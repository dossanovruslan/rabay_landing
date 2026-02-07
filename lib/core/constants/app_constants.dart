class AppConstants {
  static const String appName = 'RaBay';
  static const String appTitle = 'RaBay - Учет личных финансов';
  static const String appDescription =
      'Простое приложение для контроля личных финансов! Следи за расходами, управляй бюджетом!';

  // Store Links
  static const String appStoreUrl = 'https://apps.apple.com/app/rabay';
  static const String googlePlayUrl =
      'https://play.google.com/store/apps/details?id=com.rabay';

  // Social Links
  static const String instagramUrl = 'https://instagram.com/rabay_app';
  static const String facebookUrl = 'https://facebook.com/rabay';
  static const String telegramUrl = 'https://t.me/rabay_support';

  // Legal Links
  static const String privacyPolicyUrl = 'https://rabay.app/privacy';
  static const String termsOfServiceUrl = 'https://rabay.app/terms';

  // Features
  static const List<Map<String, String>> features = [
    {
      'title': 'Управление счетами',
      'description': 'Отслеживайте все свои счета в одном месте',
      'icon': '💳',
    },
    {
      'title': 'Контроль бюджета',
      'description': 'Планируйте расходы по категориям',
      'icon': '📊',
    },
    {
      'title': 'Накопления',
      'description': 'Ставьте цели и копите на мечты',
      'icon': '🎯',
    },
    {
      'title': 'Списки покупок',
      'description': 'Планируйте покупки с лёгкостью',
      'icon': '🛒',
    },
  ];

  // Screenshots
  static const List<String> screenshots = [
    'assets/images/screens/accounts.jpg',
    'assets/images/screens/main_budget.jpg',
    'assets/images/screens/savings.jpg',
    'assets/images/screens/shopping_list.jpg',
  ];
}
