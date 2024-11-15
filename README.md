# SimplePOS

Welcome to SimplePOS, a new Flutter project designed to provide a seamless point-of-sale experience.

## Project Overview

This repository contains the source code for the `pos_app`, a Flutter-based application aimed at simplifying point-of-sale operations.

## Getting Started

To get started with this project, follow the steps below:

### Prerequisites

Ensure you have the following installed on your development machine:

- Flutter SDK: [Install Flutter](https://docs.flutter.dev/get-started/install)
- Dart SDK: Included with Flutter
- Android Studio or Visual Studio Code: [Setup IDE](https://docs.flutter.dev/get-started/editor)
- PHP 8.3: [Download PHP](https://www.php.net/downloads)

### Setting Up the Flutter Project

1. Clone the repository:
    ```sh
    git clone https://github.com/yourusername/SimplePOS.git
    ```
2. Navigate to the project directory:
    ```sh
    cd pos_app
    ```
3. Install the Flutter dependencies:
    ```sh
    flutter pub get
    ```

### Running the Application

1. Connect your mobile device or start an emulator.
2. Run the application:
    ```sh
    flutter run
    ```

## Backend Setup

To set up the backend for this project, follow these steps:

1. Install Composer on your PC. You can download it from [getcomposer.org](https://getcomposer.org/).
2. Navigate to the backend folder of the project:
    ```sh
    cd backend
    ```
3. Install the necessary dependencies:
    ```sh
    composer install
    ```
4. Ensure that your PHP version is 8.3. You can check your PHP version by running:
    ```sh
    php -v
    ```

### Database Setup

The name of the database is `cris_pos`. Use the following SQL command to create the `Users` table:

```sql
CREATE TABLE `Users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `firstName` varchar(100) NOT NULL,
  `lastName` varchar(100) NOT NULL,
  `contactNumber` varchar(20) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
```

## Configuration

### API URL

Don't forget to update the API URL in `constants.dart` to point to your login API. This is crucial for the application to communicate with the backend.

```dart
  static const String registerUri = 'http://127.0.0.1:2000/api.php?action=register';
  static const String loginUri = 'http:/127.0.0.1:2000/api.php?action=login';
```

## Resources

Here are a few resources to help you get started with Flutter:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For comprehensive Flutter documentation, including tutorials, samples, and a full API reference, visit the [Flutter documentation](https://docs.flutter.dev/).

## Support

If you encounter any issues or have questions, feel free to open an issue in the repository or contact the maintainers.

Happy coding!