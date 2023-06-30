## [2.0.2] - 2023/06/30

Updates dependencies. 

## [2.0.1] - 2022/09/06

Fixed some typos.

## [2.0.0] - 2022/09/06

Major release 2.0.0. 

Breaking change:

Fitbit provided tokens are no longer managed by fitbitter. Now they are returned during the authorization process by the `FitbitConnector.authorize()` method: 
```dart
FitbitCredentials? fitbitCredentials =
                    await FitbitConnector.authorize(
                        clientID: Strings.fitbitClientID,
                        clientSecret: Strings.fitbitClientSecret,
                        redirectUri: Strings.fitbitRedirectUri,
                        callbackUrlScheme: Strings.fitbitCallbackScheme);
```
As a consequence, to fetch data it is necessary to pass the credentials to each `FitbitAPIURL` constructor. For example:

See the docs for more info and examples.

New features:
- Now it is possible to fetch breathing rate data (see `FitbitBreathingRateData`)
- Now it is possible to fetch cardio score (VO2Max) data (see `FitbitCardioScoreData`)
- Now it is possible to heart rate variability data (see `FitbitHeartRateVariabilityData`)
- Now it is possible to fetch intraday Heart data (see `FitbitHeartRateIntradayData`)
- Now it is possible to fetch SpO2 data (see `FitbitSpO2Data`)
- Now it is possible to fetch intraday SpO2 data (see `FitbitSpO2IntradayData`)
- Now it is possible to fetch skin temperature data (see `FitbitTemperatureSkinData`)

Minor changes:
- `FitbitHeartData` is now `FitbitHeartRateData`
- Removed `WithUserId` string from the name of APIURL related constructors
- `encodedId` field in the Data classes is now called `userID`

## [1.1.1] - 2022/02/25

Formatted according to `flutter format .`.

## [1.0.0] - 2022/02/25

Release 1.0.0. 
Added docs at https://gcappon.github.com/fitbitter/
Updated dependencies. 

## [1.0.0-dev.5] - 2021/04/06

Now compatible with null safety.

## [1.0.0-dev.4] - 2021/01/15

Formatted according to `flutter format .`.
Added an example Flutter app.

## [1.0.0-dev.3] - 2021/01/15

Upgraded dependencies.
Deleted initialization deprecation of List.
Provide full API docs.

## [1.0.0-dev.2] - 2021/01/15

Fixed class exports.

## [1.0.0-dev.1] - 2021/01/15

Just the first release.
