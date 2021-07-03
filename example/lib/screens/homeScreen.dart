import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import 'package:fitbitter_example/database/database.dart';

import 'package:fitbitter_example/utils/utils.dart';

import 'package:fitbitter/fitbitter.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = Strings.homeScreenRouteName;

  @override
  _HomeScreenState createState() => _HomeScreenState();
} // HomeScreen

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    print("${HomeScreen.routeName} built"); //for debugging

    return StreamProvider<FitbitAccount?>(
      initialData: null,
      create: (context) =>
          GetIt.instance<MyDatabase>().fitbitAccountsDao.watchFitbitAccount(),
      catchError: (_, err) => null,
      child: Scaffold(
        appBar: buildAppBar(context),
        drawer:
            Consumer<FitbitAccount?>(builder: (context, fitbitAccount, child) {
          return buildHomeDrawer(
              context,
              fitbitAccount == null
                  ? 'No user'
                  : '${fitbitAccount.displayName}');
        } // builder
                ),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Consumer<FitbitAccount?>(
                    builder: (context, fitbitAccount, child) {
                  return fitbitAccount == null
                      ? Text(
                          'No user logged. To start open the Drawer and tap "Fitbit Account"')
                      : Column(
                          children: [
                            ElevatedButton(
                                child: Text('Fetch yesterday step data'),
                                onPressed: () async {
                                  // Instantiate a proper FitbitManager
                                  FitbitActivityTimeseriesDataManager
                                      fitbitActivityTimeseriesDataManager =
                                      FitbitActivityTimeseriesDataManager(
                                    clientID: Strings.fitbitClientID,
                                    clientSecret: Strings.fitbitClientSecret,
                                    type: 'steps',
                                  );
                                  // Fetch data
                                  final stepsData =
                                      await fitbitActivityTimeseriesDataManager
                                          .fetch(FitbitActivityTimeseriesAPIURL
                                              .dayWithResource(
                                    date: DateTime.now()
                                        .subtract(Duration(days: 1)),
                                    userID: fitbitAccount.id,
                                    resource: 'steps',
                                  )) as List<FitbitActivityTimeseriesData>;

                                  // Use them as you want
                                  final snackBar = SnackBar(
                                      content: Text(
                                          'Yesterday you walked ${stepsData[0].value} steps!'));
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                }),
                          ],
                        );
                } // builder
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  } // build

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 15,
      title: Text(Strings.homeScreenName),
      leading: Builder(
        builder: (context) => IconButton(
          icon: new Icon(Icons.menu),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
      ),
    );
  } //buildAppBar

  Widget buildHomeDrawer(BuildContext context, String title) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: 100,
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            child: DrawerHeader(
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.settings_remote,
              color: Theme.of(context).accentColor,
            ),
            title: Text('Fitbit Account'),
            onTap: () {
              Navigator.pop(context); //First pop the drawer
              toFitbitSettings(context);
            },
          ),
        ],
      ),
    );
  } //buildHomeDrawer

  void toFitbitSettings(BuildContext context) {
    print('------ toFitbitSettings ------');
    Navigator.of(context).pushNamed(Strings.fitbitSettingsScreenRouteName);
  } // toFitbitSettings

} // _HomeScreenState
