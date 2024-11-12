class Constants {
  static const String appName = 'Cris POS';

  // API URL
  static const String registerUri =
      'http://10.0.2.2:2000/api.php?action=register';
  static const String loginUri = 'http://10.0.2.2:2000/api.php?action=login';

  // User Model Fields
  static const String id = 'id';
  static const String firstName = 'firstName';
  static const String lastName = 'lastName';
  static const String email = 'email';
  static const String contactNumber = 'contactNumber';
  static const String createdAt = 'createdAt';
  static const String updatedAt = 'updatedAt';

  // Screens
  static const String initialScreen = '/';
  static const String loginScreen = '/login';
  static const String registerScreen = '/register';
  static const String homeScreen = '/home';

  // Padding
  static const double paddingSmall = 8.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 24.0;

  // Font Sizes
  static const double fontSmall = 12.0;
  static const double fontMedium = 16.0;
  static const double fontLarge = 20.0;
  static const double fontExtraLarge = 28.0;

  // Spacing
  static const double spacingSmall = 4.0;
  static const double spacingMedium = 8.0;
  static const double spacingLarge = 16.0;
  static const double spacingExtraLarge = 24.0;

  // Border Radius
  static const double borderRadiusSmall = 4.0;
  static const double borderRadiusMedium = 8.0;
  static const double borderRadiusLarge = 16.0;
  static const double borderRadiusExtraLarge = 24.0;

  // Circular Radius
  static const double circularRadiusSmall = 20.0;
  static const double circularRadiusMedium = 30.0;
  static const double circularRadiusLarge = 40.0;

  // Icon Sizes
  static const double iconSizeSmall = 20.0;
  static const double iconSizeMedium = 24.0;
  static const double iconSizeLarge = 32.0;

  // Animation Durations
  static const Duration shortAnimationDuration = Duration(milliseconds: 200);
  static const Duration mediumAnimationDuration = Duration(milliseconds: 400);
  static const Duration longAnimationDuration = Duration(milliseconds: 600);

  // Buttons sizes
  static const double buttonWidth = 200.0;
  static const double buttonHeight = 50.0;
}
