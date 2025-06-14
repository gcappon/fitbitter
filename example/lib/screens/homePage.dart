import 'package:fitbitter/fitbitter.dart';
import 'package:flutter/material.dart';

import '../utils/strings.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const route = '/';
  static const routename = 'HomePage';

  @override
  Widget build(BuildContext context) {
    debugPrint('${HomePage.routename} built');
    return Scaffold(
      appBar: AppBar(
        title: const Text(HomePage.routename),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                // Optional: customize the authorization scope
                //           If this is not specified, by default it will be generated a token pair with rights to access to all data
                //           If you are wrong in specifying the auth scopes, errors will be possible.
                //           As an example, here we are requesting access rights to profile and SpO2 data only.
                //           The following can be requested: FitbitAuthScope.ACTIVITY, FitbitAuthScope.CARDIO_FITNESS, FitbitAuthScope.HEART_RATE, FitbitAuthScope.LOCATION, FitbitAuthScope.NUTRITION, FitbitAuthScope.OXYGEN_SATURATION, FitbitAuthScope.PROFILE, FitbitAuthScope.RESPIRATORY_RATE, FitbitAuthScope.SETTINGS, FitbitAuthScope.SLEEP, FitbitAuthScope.SOCIAL, FitbitAuthScope.TEMPERATURE
                final List<FitbitAuthScope> scopeList = [
                  FitbitAuthScope.HEART_RATE,
                  FitbitAuthScope.ACTIVITY,
                ];
                // Optional: customize the token lifetime in seconds. It can be 3600 (1 hour), 28800 (8 hours), 86400 (1 day), 604800 (1 week), 2592000 (30 days), or 31536000 (1 year)
                //           If this is not specified, by default it will be 28800.
                //           As an example, here we are requesting a lifetime of 3600 seconds
                const int expiresIn = 3600;

                // Authorize the app and get the Fitbit credentials
                FitbitCredentials? fitbitCredentials = await FitbitConnector.authorize(
                    clientID: Strings.fitbitClientID,
                    clientSecret: Strings.fitbitClientSecret,
                    redirectUri: Strings.fitbitRedirectUri,
                    callbackUrlScheme: Strings.fitbitCallbackScheme,
                    scopeList: scopeList,
                    expiresIn: expiresIn);
                debugPrint(fitbitCredentials.toString());
              },
              child: const Text('Tap to authorize and fetch data'),
            ),
          ],
        ),
      ),
    );
  } //build
} //HomePage
