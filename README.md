# Flutter Firebase Authentication

This Flutter application demonstrates Firebase authentication with email and password. The project uses `firebase_auth`, `firebase_core`, and `firebase_analytics` packages.

## Features
- **Login Page**: Allows users to sign in using email and password.
- **Profile Page**: After successful login, users are redirected to their profile page.
- **Error Handling**: Displays appropriate messages for wrong credentials or unregistered emails.

## Setup Instructions
1. Clone this repository:
   ```bash
   git clone https://github.com/Didar1313/flutter-firebase-auth.git
   ```
2. Navigate to the project directory:
   ```bash
   cd flutter-firebase-auth
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Set up Firebase for your app by adding your `google-services.json` (for Android) or `GoogleService-Info.plist` (for iOS) to the respective directories.

5. Run the app:
   ```bash
   flutter run
   ```

## Firebase Configuration
Ensure that you've set up Firebase with the necessary services:
- Firebase Authentication
- Firebase Analytics (optional)

Update the `apiKey`, `appId`, `messagingSenderId`, and `projectId` in your `main.dart` file with your Firebase credentials.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
