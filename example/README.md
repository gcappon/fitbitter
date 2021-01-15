# fitbitter_example

A simple app that demonstrates the use of fitbitter.

## Instructions

To run the example application follow these steps.

1. Create a Fitbit account, if you do not have one.
2. Register a new app at [https://dev.fitbit.com/apps/new](https://dev.fitbit.com/apps/new).
  The form will look like this: 
  ![Fitbit App Registration Form](fitbitAppRegistrationForm.png)
  Follow these steps:
    a. Choose an "Application Name" (e.g., "Example").
    b. Set a brief "Description" (e.g., "Just a simple test of an awesome package.")
    c. Set the "Application Website". It can be random for the purpose of testing the example so let's put https://www.example.com/.
    d. Set an "Organization" (e.g., "Myself").
    e. Set an "Organization Website". It can be random for the purpose of testing the example so let's put https://www.myself.com/.
    f. Set a "Terms of Service Url". It can be random for the purpose of testing the example so let's put https://www.myself.com/tos.
    g. Set an "Privaly Policy Url". It can be random for the purpose of testing the example so let's put https://www.myself.com/pp.
    h. Set the "Application Type" to "Client".
    i. Choose a Callback URL" (e.g., "example://fitbit/auth").
    j. Choose a "Default Access Type" (e.g., "Read-Only").
    k. Check the "I have read and agree to the terms of service" box.
    l. Click the "Register" button.
  You should see the "OAuth 2.0 Client ID" and the "Client Secret" strings provided by Fitbit.
3. Go to "lib/utils/strings.dart" and change the values of the following variables 
  ```dart
  // Fitbit Client ID
  static const String fitbitClientID = 'XXX';

  // Fitbit Client Secret
  static const String fitbitClientSecret = 'XXX';
  ```
  from 'XXX' to the "OAuth 2.0 Client ID" and "Client Secret" strings values provided at the previous step.
  Then change the values of the following variables:
  ```dart
  /// Auth Uri
  static const String fitbitRedirectUri = 'XXX';

  /// Callback scheme
  static const String fitbitCallbackScheme = 'XXX';
  ```
  from 'XXX' to 'example://fitbit/auth' and 'example', respectively.
4. Run the application with `flutter run`. Enjoy!
  
