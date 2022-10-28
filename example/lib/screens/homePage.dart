import 'package:fitbitter/fitbitter.dart';
import 'package:flutter/material.dart';

import '../utils/strings.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  static const route = '/';
  static const routename = 'HomePage';

  @override
  Widget build(BuildContext context) {
    print('${HomePage.routename} built');
    return Scaffold(
      appBar: AppBar(
        title: Text(HomePage.routename),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                // Authorize the app and get the Fitbit credentials
                FitbitCredentials? fitbitCredentials =
                    await FitbitConnector.authorize(
                        clientID: Strings.fitbitClientID,
                        clientSecret: Strings.fitbitClientSecret,
                        redirectUri: Strings.fitbitRedirectUri,
                        callbackUrlScheme: Strings.fitbitCallbackScheme);
                print(fitbitCredentials);

                //Instantiate a proper data manager (for example, for SpO2 data)
                FitbitSpO2IntradayDataManager fitbitSpO2IntradayDataManager =
                    FitbitSpO2IntradayDataManager(
                  clientID: Strings.fitbitClientID,
                  clientSecret: Strings.fitbitClientSecret,
                );
      //Fetch yesterday's data
                FitbitSpO2IntradayAPIURL fitbitSpO2IntradayAPIURL = FitbitSpO2IntradayAPIURL.day(
                                    date: DateTime.now(),
                                    fitbitCredentials: fitbitCredentials!,
                                  );
                List<FitbitSpO2IntradayData> fitbitSpO2IntradayData = await fitbitSpO2IntradayDataManager.fetch(fitbitSpO2IntradayAPIURL) as List<FitbitSpO2IntradayData>;
                print(fitbitSpO2IntradayData);
               
              },
              child: Text('Tap to authorize and fetch data'),
            ),
          ],
        ),
      ),
    );
  } //build

} //HomePage
