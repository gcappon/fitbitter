# fitbitter

<img src="https://i.postimg.cc/W4pq6xhF/fitbitter-logo.png" width="250" height="250">

A Flutter package to make your life easier when dealing with Fitbit APIs.

## Getting started 

### Step 1: Install Fitbitter

To install Fitbitter, simply add `fitbitter: ` to the dependencies of your `pubspec.yaml` file: 

```yaml
dependencies:
    fitbitter: #latest version
```

### Step 1a: (for Android only) Modify you manifest

Fitbitter uses `flutter_web_auth` to let you authenticate to Fitbit. In Android, you need to add these lines of code to your `android/app/src/main/AndroidManifest.xml` file:
```xml
<activity android:name="com.linusu.flutter_web_auth.CallbackActivity" >
      <intent-filter android:label="flutter_web_auth">
        <action android:name="android.intent.action.VIEW" />
        <category android:name="android.intent.category.DEFAULT" />
        <category android:name="android.intent.category.BROWSABLE" />
        <data android:scheme="CALLBACK_SCHEME" />
      </intent-filter>
    </activity>
```
and change ```CALLBACK_SCHEME``` with your callback scheme (in the test example below this will be ```example```)

### Step 1b: (for Android only) Increase the minimum Android SDK version

Fitbitter uses `flutter_secure_storage` to securely store the Fitbit tokens. Since `flutter_secure_storage` requires that minimum Android SDK version is 18, you need to change the default minimum sdk version to 18 or above. To do so, open `android/app/build.gradle`, locate this snippet of code:
```gradle
...
defaultConfig {
        applicationId "your.app.id"
        minSdkVersion flutter.minSdkVersion
        targetSdkVersion flutter.targetSdkVersion
        versionCode flutterVersionCode.toInteger()
        versionName flutterVersionName
    }
...
```
and change ```minSdkVersion``` to 18 or above, e.g.,:
```gradle
...
defaultConfig {
        applicationId "your.app.id"
        minSdkVersion 18
        targetSdkVersion flutter.targetSdkVersion
        versionCode flutterVersionCode.toInteger()
        versionName flutterVersionName
    }
...
```

### Step 1c: (for Android only) Requirement: Web Browser

Fitbitter uses `flutter_web_auth` to let you authenticate to Fitbit. In order to let it work correcty please be sure that your emulator or your physical device is using Chrome, Opera, or Firefox as default web browser. 

### Step 1d:(for Web only) Requirement: Create an endpoint

Fitbitter uses `flutter_web_auth` to let you authenticate to Fitbit. In order to let it work correcty, as indicated in [https://pub.dev/packages/flutter_web_auth](https://pub.dev/packages/flutter_web_auth), on the Web platform an endpoint needs to be created that captures the callback URL and sends it to the application using the JavaScript `postMessage()` method. In the `./web` folder of the project, create an HTML file with the name e.g. `auth.html` with content:
```html
<!DOCTYPE html>
<title>Authentication complete</title>
<p>Authentication is complete. If this does not happen automatically, please
close the window.
<script>
  window.opener.postMessage({
    'flutter-web-auth': window.location.href
  }, window.location.origin);
  window.close();
</script>
```
Redirection URL passed to the authentication service must be the same as the URL on which the application is running (schema, host, port if necessary) and the path must point to created HTML file, `/auth.html`in this case. The `callbackUrlScheme` parameter of the `authenticate()` method does not take into account, so it is possible to use a schema for native platforms in the code.

For the Sign in with Apple in web_message response mode, postMessage from [https://appleid.apple.com](https://appleid.apple.com) is also captured, and the authorization object is returned as a URL fragment encoded as a query string (for compatibility with other providers).

### Step 2: Test Fitbitter

Once installed, it is time to test drive Fitbitter. In this example, we will use Fitbitter to authenticate our app into Fitbit APIs and simply fetch yesterday's step count. 

#### Preliminary requirement: Register your app 

To be able to perform any operation with the Fitbit APIs, you must register first your application in the developer portal of Fitbit and obtain two IDs, namely the "**OAuth 2.0 Client ID**" and the "**Client Secret**". To do so, you have to follow these steps. 

* Create a Fitbit account, if you do not have one.
* Register a new app at [https://dev.fitbit.com/apps/new](https://dev.fitbit.com/apps/new).
  The form will look like this: 
  ![Fitbit App Registration Form](https://github.com/gcappon/fitbitter/blob/gh-pages/fitbitAppRegistrationForm.png)
  
* Choose an "Application Name" (e.g., "Example").
* Set a brief "Description" (e.g., "Just a simple test of an awesome package.")
* Set the "Application Website". It can be random for the purpose of testing the example so let's put https://www.example.com/.
* Set an "Organization" (e.g., "Myself").
* Set an "Organization Website". It can be random for the purpose of testing the example so let's put https://www.myself.com/.
* Set a "Terms of Service Url". It can be random for the purpose of testing the example so let's put https://www.myself.com/tos.
* Set an "Privacy Policy Url". It can be random for the purpose of testing the example so let's put https://www.myself.com/pp.
* Set the "Application Type" to "Client".
* Choose a Callback URL" (e.g., "example://fitbit/auth").
* Choose a "Default Access Type" (e.g., "Read-Only").
* Check the "I have read and agree to the terms of service" box.
* Click the "Register" button. You should now see the "**OAuth 2.0 Client ID**" and the "**Client Secret**" strings provided by Fitbit.

#### App authentication 

You are now ready to authorize your application.

To do that, simply call the asynchronous method `FitbitConnector.authorize()`, within your code, as: 

```dart
    FitbitCredentials? fitbitCredentials =
        await FitbitConnector.authorize(
            clientID: Strings.fitbitClientID,
            clientSecret: Strings.fitbitClientSecret,
            redirectUri: Strings.fitbitRedirectUri,
            callbackUrlScheme: Strings.fitbitCallbackScheme
        );
```

This will open a web view where user will be able to input his Fitbit credentials and login.
After the login, the web view will close and the method will return a `FitbitCredentials?` instance that contains the credentials to be used to make requests to the Fitbit Web API via `fitbitter`. In particular, `fitbitCredentials.userID` contains the Fitbit user id of the user that just authorized `fitbitter`, `fitbitCredentials.fitbitAccessToken` contains the Fitbit access token, and `fitbitCredentials.fitbitRefreshToken` contains the Fitbit refresh token.

::: warning 
Since version 2.0.0, `fitbitter` no longer stores the credentials automatically. As such, you, as a developer, must manage such crendentials according to your strategy. 
:::

#### Fetch step count data

With your app authorized, you are now ready to fetch data from Fitbit. In this example, we will fetch yesterday's step count.

Using Fitbitter, this is very easy. First instanciate a `FitbitActivityTimeseriesDataManager` of `type: 'steps'`:

```dart
    FitbitActivityTimeseriesDataManager
        fitbitActivityTimeseriesDataManager =
        FitbitActivityTimeseriesDataManager(
            clientID: '<OAuth 2.0 Client ID>',
            clientSecret: '<Client Secret>',
            type: 'steps', 
        );
```

Then fetch the desired data using the `fetch` method of `FitbitActivityTimeseriesDataManager` with the proper `FitbitActivityTimeseriesAPIURL`:

```dart 
final stepsData = await fitbitActivityTimeseriesDataManager.fetch(
    FitbitActivityTimeseriesAPIURL.dayWithResource(
        date: DateTime.now().subtract(Duration(days: 1)),
        userID: fitbitAccount.id,
        resource: fitbitActivityTimeseriesDataManager.type,
        fitbitCredentials: fitbitCredentials!,
        )
    ) as List<FitbitActivityTimeseriesData>;
```

That's it! 

::: tip
For more information on Fitbitter functionalities, check out the [Guides](https://gcappon.github.io/fitbitter/guides/) and the Fitbitter [Reference API](https://pub.dev/documentation/fitbitter/latest/)
:::

## Documentation & Guides

For more docs and guides please refer to: [https://gcappon.github.io/fitbitter/](https://gcappon.github.io/fitbitter/).

## Support

If you like my work, feel free to support me with a coffee. Thanks!

[!["Buy Me A Coffee"](https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png)](https://www.buymeacoffee.com/gcappon)
