# GlitaskFlutter🏛️

# Task Management App📓:

Task Management App is a mobile application built with Flutter that allows users to manage their tasks efficiently. The app supports adding, editing, deleting tasks, and includes user authentication.


🔐 : System design 🔐


![Screenshot 2024-07-20 232413](https://github.com/user-attachments/assets/82d15ee6-fb55-454c-8e08-d31ffde4ec25)

## Table of Contents🔡

- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Screenshots](#screenshots)
- [Technologies Used](#technologies-used)
- [Contributing](#contributing)
- [License](#license)

## Features

+ User authentication (Login/Logout).
+ Add, edit, and delete tasks.
+ Mark tasks as completed.
+ View profile information.
+ Beautiful and professional UI/UX design.
+ Responsive design for different screen sizes.

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

## 🎥 Video:


https://github.com/user-attachments/assets/f08ea714-8e03-4b9f-baa9-2c515dbd6dca



📷 Screenshots:
<table>
  <tr>
    <td>Login View</td>
    <td>Register View</td>
    <td>Task Management List View</td>
  </tr>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/0d9d0cd9-b430-465b-aaf9-9d8d28e725bf" width=1500></td>
    <td><img src="https://github.com/user-attachments/assets/564f2525-49c2-41d1-8321-6b2adf2d0b51" width=1500></td>
    <td><img src="https://github.com/user-attachments/assets/ed9604ff-cdd6-4b9c-a28a-4eacd29a859d" width=1500></td>
  </tr>
  <tr>
    <td>Add Task</td>
    <td>Profile View</td>
    <td>dialog View</td>
  </tr>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/704a8281-d155-4073-9455-a72f061de9ba" width=1500></td>
    <td><img src="https://github.com/user-attachments/assets/adc5a5ca-2ba7-488c-a490-d24e2e35ff65" width=1500></td>
    <td><img src="https://github.com/user-attachments/assets/0b709b5c-80c0-4371-9ef9-c1f5552b4760" width=1500></td>
  </tr>
</table>

## Figma design 🎨:
https://www.figma.com/design/Ac8TSqrrGMzkFYXOVqZiqF/taskmangment?node-id=0-1&t=mEOLj6FYMGHfiPsY-1

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
