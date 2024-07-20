# glitask

# Task Management App

Task Management App is a mobile application built with Flutter that allows users to manage their tasks efficiently. The app supports adding, editing, deleting tasks, and includes user authentication.

## Table of Contents

- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Screenshots](#screenshots)
- [Technologies Used](#technologies-used)
- [Contributing](#contributing)
- [License](#license)

## Features

- User authentication (Login/Logout).
- Add, edit, and delete tasks.
- Mark tasks as completed.
- View profile information.
- Beautiful and professional UI/UX design.
- Responsive design for different screen sizes.

## Installation

To get started with the Task Management App, follow these steps:

1. **Clone the repository:**

    ```sh
    git clone https://github.com/your-username/task-management-app.git
    cd task-management-app
    ```

2. **Install dependencies:**

    ```sh
    flutter pub get
    ```

3. **Set up Firebase:**

    - Create a new project in [Firebase Console](https://console.firebase.google.com/).
    - Add an Android/iOS app to your Firebase project and download the `google-services.json` or `GoogleService-Info.plist`.
    - Place the downloaded file in the respective directories (`android/app` for `google-services.json` and `ios/Runner` for `GoogleService-Info.plist`).
    - Enable Firebase Authentication in the Firebase Console.

4. **Generate splash screen:**

    ```sh
    flutter pub run flutter_native_splash:create
    ```

5. **Run the app:**

    ```sh
    flutter run
    ```

## Usage

Once the app is running, you can:

- Register a new account or login with an existing account.
- Add new tasks by navigating to the "Add Task" tab.
- Edit or delete existing tasks by interacting with them in the "Tasks" tab.
- View your profile information and logout from the "Profile" tab.

## Screenshots

Include some screenshots of your app here to showcase its design and functionality.

## Technologies Used

- [Flutter](https://flutter.dev/) - UI toolkit for building natively compiled applications.
- [Firebase](https://firebase.google.com/) - Backend services for authentication and data storage.
- [Bloc](https://bloclibrary.dev/) - State management library for managing the app's state.

## Contributing

Contributions are welcome! Please fork the repository and use a feature branch. Pull requests are warmly welcome.

1. Fork the repository
2. Create a feature branch (`git checkout -b feature-name`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin feature-name`)
5. Create a new Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
