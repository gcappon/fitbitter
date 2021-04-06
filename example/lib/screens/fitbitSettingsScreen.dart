import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:fitbitter/fitbitter.dart';

import 'package:fitbitter_example/database/database.dart';
import 'package:fitbitter_example/utils/utils.dart';

class FitbitSettingsScreen extends StatefulWidget {
  static const routeName = Strings.fitbitSettingsScreenRouteName;

  @override
  _FitbitSettingsScreenState createState() => _FitbitSettingsScreenState();
} // FitbitSettingsScreen

class _FitbitSettingsScreenState extends State<FitbitSettingsScreen> {
  FitbitAccount? fitbitAccount;

  @override
  void initState() {
    super.initState();
    //Fitbit.submitGetFitbitaccount(context); change it with a provider on db
  } // initState

  @override
  Widget build(BuildContext context) {
    print("${FitbitSettingsScreen.routeName} built"); //for debugging

    return StreamProvider<FitbitAccount?>(
      initialData: null,
      catchError: (_,err) => null,
      create: (context) =>
          GetIt.instance<MyDatabase>().fitbitAccountsDao.watchFitbitAccount(),
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: _buildPage(context, fitbitAccount),
        floatingActionButton:
            Consumer<FitbitAccount?>(builder: (context, fitbitAccount, child) {
          return fitbitAccount == null
              ? _buildFloatingActionButton(false)
              : _buildFloatingActionButton(true);
        } // builder
                //Text(Strings.hello),
                ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                height: 30,
              )
            ],
          ),
          shape: CircularNotchedRectangle(),
        ),
      ),
    );
  } // build

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      leading: TextButton(
        child: Icon(
          Icons.arrow_back,
          color: Theme.of(context).accentColor,
        ),
        onPressed: () => toHomepage(context),
      ),
      title: Text(Strings.fitbitSettingsScreenName),
    );
  } //buildAppBar

  Widget _buildPage(BuildContext context, FitbitAccount? fitbitAccount) {
    return SafeArea(
      child: Center(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 25, bottom: 8, left: 20, right: 20),
          child:
              Consumer<FitbitAccount?>(builder: (context, fitbitAccount, child) {
            return fitbitAccount == null
                ? Text(
                    "Tap the button below to authorize ${Strings.appName} to connect to Fitbit services.")
                : _buildFitbitAccountInformation(context, fitbitAccount);
          } // builder
                  //Text(Strings.hello),
                  ),
        ),
      ),
    );
  } // buildPage

  Widget _buildFloatingActionButton(bool isConnected) {
    Widget fabDisconnect = FloatingActionButton(
      elevation: 2,
      backgroundColor: Theme.of(context).errorColor,
      child: Icon(
        Icons.cancel,
      ),
      onPressed: () async {
        // send the unauthorization request
        await FitbitConnector.unauthorize(
            clientID: Strings.fitbitClientID,
            clientSecret: Strings.fitbitClientSecret);

        // get Fitbit account
        final fitbitAccount = await GetIt.instance<MyDatabase>()
            .fitbitAccountsDao
            .getFitbitAccount();

        // remove entry from db
        await GetIt.instance<MyDatabase>()
            .fitbitAccountsDao
            .deleteFitbitAccountByID(fitbitAccount.id);
      },
    );
    Widget fabConnect = FloatingActionButton(
        elevation: 2,
        child: Icon(
          Icons.account_circle,
        ),
        onPressed: () async {
          //FitbitConnector.test();
          // authorize the app using Fitbitter
          String? id = await FitbitConnector.authorize(
              context: context,
              clientID: Strings.fitbitClientID,
              clientSecret: Strings.fitbitClientSecret,
              redirectUri: Strings.fitbitRedirectUri,
              callbackUrlScheme: Strings.fitbitCallbackScheme);
          // fetch user data
          FitbitAccountDataManager fitbitAccountDataManager =
              FitbitAccountDataManager(
                  clientID: Strings.fitbitClientID,
                  clientSecret: Strings.fitbitClientSecret);
          final fitbitAccountDatas = await fitbitAccountDataManager
              .fetch(FitbitUserAPIURL.withUserID(userID: id));
          FitbitAccountData fitbitAccountData = fitbitAccountDatas[0] as FitbitAccountData;

          // insert user data within the database
          await GetIt.instance<MyDatabase>()
              .fitbitAccountsDao
              .insertFitbitAccount(FitbitAccount(
                id: fitbitAccountData.encodedId!,
                displayName: fitbitAccountData.displayName!,
                birthDate: fitbitAccountData.dateOfBirth!,
                gender: fitbitAccountData.gender!,
                height: fitbitAccountData.height!,
                weight: fitbitAccountData.weight!,
                avatar150: fitbitAccountData.avatar150!,
                createdAt: DateTime.now(),
                updatedAt: DateTime.now(),
                deletedAt: null,
              ));
        });

    return isConnected ? fabDisconnect : fabConnect;
  }

  Widget _buildFitbitAccountInformation(
      BuildContext context, FitbitAccount fitbitAccount) {
    return Column(children: [
      Card(
        elevation: 10,
        child: Image.network(
          fitbitAccount.avatar150,
          height: 150,
        ),
      ),
      SizedBox(
        height: 20,
      ),
      Expanded(
        child: ListView(
          children: [
            //Name
            ListTile(
              leading: Icon(
                Icons.face,
                color: Theme.of(context).accentColor,
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Name',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(fitbitAccount.displayName),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            //DATE OF BIRTH
            ListTile(
              leading: Icon(
                Icons.cake,
                color: Theme.of(context).accentColor,
              ),
              title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Date of birth',
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(Formats.onlyDayDateFormat
                        .format(fitbitAccount.birthDate)),
                  ]),
            ),
            //Height
            ListTile(
              leading: Icon(
                Icons.height,
                color: Theme.of(context).accentColor,
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Height',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(fitbitAccount.height.toString()),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            //Weight
            ListTile(
              leading: Icon(
                Icons.linear_scale,
                color: Theme.of(context).accentColor,
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Weight',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(fitbitAccount.weight.toString()),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    ]);
  } // buildFitbitAccountInformation

  void toHomepage(BuildContext context) {
    print('------ toHomepage ------');
    Navigator.pop(context);
  } //toHomepage

} //_FitbitSettingsState
