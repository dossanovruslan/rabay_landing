// ignore_for_file: constant_identifier_names

class AppConstants {
  static const String appName = 'Финансовый Помощник';
  static const String appTitle = 'Приложение по управлению личными финансами';

  // Store Links
  static const String appStoreUrl = 'https://rabay.onelink.me/ehFJ/tpkmlboz';
  static const String googlePlayUrl = 'https://rabay.onelink.me/ehFJ/tpkmlboz';

  // Social Links
  static const String instagramUrl =
      'https://www.instagram.com/rabay.kz?igsh=MWoyNGhrYzN5aWR0dw%3D%3D&utm_source=qr';
  static const String facebookUrl =
      'https://www.instagram.com/rabay.kz?igsh=MWoyNGhrYzN5aWR0dw%3D%3D&utm_source=qr';
  static const String telegramUrl = 'https://t.me/c/3693784616/1';
  static const String emailUrl = 'mailto:support @finance.app';

  // Legal Links
  static const String privacyPolicyUrl = 'https://finance.app/privacy';
  static const String termsOfServiceUrl = 'https://finance.app/terms';

  // Screenshots
  static const String screenShoppingList = 'assets/images/screens/screen1.png';
  static const String screenAccounts = 'assets/images/screens/screen2.png';
  static const String screenBudget = 'assets/images/screens/screen3.png';
  static const String screenShoppingListSimple =
      'assets/images/screens/screen4.png';
  static const String screenSavings = 'assets/images/screens/screen5.png';

  // Screenshots list for bloc (legacy)
  static const List<String> screenshots = [
    screenAccounts,
    screenBudget,
    screenSavings,
    screenShoppingList,
  ];

  // Hero Section
  static const String heroTitle = 'Приложение по управлению личными финансами';
  static const String heroSubtitle =
      'Возьмите контроль над своими деньгами. Планируйте, накапливайте, достигайте финансовых целей.';
  static const String heroMission =
      'Ваш надежный партнер в мире личных финансов';

  // Benefits (3 cards)
  static const List<Map<String, String>> benefits = [
    {
      'title': 'Полный контроль финансов',
      'description':
          'Отслеживайте все доходы и расходы в одном месте. Анализируйте свои траты и находите способы экономии.',
    },
    {
      'title': 'Достигайте целей быстрее',
      'description':
          'Создавайте накопления на важные покупки. Следите за прогрессом и мотивируйтесь на финансовый успех.',
    },
    {
      'title': 'Управляйте долгами',
      'description':
          'Отслеживайте долги и кредиты. Планируйте регулярные платежи и освобождайтесь от финансовых обязательств.',
    },
  ];

  // Detailed Features Sections (6 sections with alternating layout)
  static const List<Map<String, dynamic>> detailedFeatures = [
    {
      'title': 'Доходы и расходы',
      'subtitle': 'Вести учет еще никогда не было так удобно!',
      'description':
          'Контролируйте все категории доходов и расходов. Наглядно видьте статьи, где можно сэкономить. Анализируйте бюджет одним взглядом. Создавайте свои категории и подкатегории. Экспортируйте данные в Excel.',
      'features': [
        'Категории с подкатегориями',
        'Месячные лимиты на категории',
        'Детальная статистика',
        'Экспорт в Excel',
      ],
      'image': screenBudget,
    },
    {
      'title': 'Мультивалютные счета',
      'subtitle': 'Управляйте деньгами в любой валюте',
      'description':
          'Создавайте неограниченное количество счетов в разных валютах. Переводите между счетами с автоматическим пересчетом курса. Видьте общий баланс во всех валютах.',
      'features': [
        'Неограниченное количество счетов',
        'Поддержка всех мировых валют',
        'Автоматический пересчет курсов',
        'Переводы между счетами',
      ],
      'image': screenAccounts,
    },
    {
      'title': 'Накопления',
      'subtitle': 'Достигайте финансовых целей',
      'description':
          'Создавайте цели накопления на покупки, путешествия, обучение. Отслеживайте прогресс в процентах. Откладывайте деньги регулярно или разово. Достигайте целей быстрее с визуализацией прогресса.',
      'features': [
        'Визуализация прогресса',
        'Множественные цели накопления',
        'Отслеживание сроков',
        'Мотивационные уведомления',
      ],
      'image': screenSavings,
    },
    {
      'title': 'Управление долгами',
      'subtitle': 'Контролируйте финансовые обязательства',
      'description':
          'Два раздела: "Я должен" и "Мне должны". Добавляйте детали долга, сроки и суммы. Отмечайте частичные погашения. Получайте уведомления о приближающихся сроках.',
      'features': [
        'Раздельный учет долгов',
        'Напоминания о платежах',
        'История погашений',
        'Процентные расчеты',
      ],
      'image': screenAccounts,
    },
    {
      'title': 'Регулярные платежи',
      'subtitle': 'Никогда не пропускайте важные платежи',
      'description':
          'Добавляйте подписки, коммунальные платежи, кредиты. Настраивайте частоту: ежедневно, еженедельно, ежемесячно, ежегодно. Получайте напоминания перед датой платежа. Автоматическое создание транзакций.',
      'features': [
        'Гибкая настройка периодичности',
        'Умные напоминания',
        'Автоматические транзакции',
        'История платежей',
      ],
      'image': screenBudget,
    },
    {
      'title': 'Список покупок',
      'subtitle': 'Планируйте траты заранее',
      'description':
          'Создавайте списки покупок с ценами. Рассчитывайте общую сумму перед походом в магазин. Отмечайте купленные товары. Контролируйте спонтанные покупки.',
      'features': [
        'Несколько списков покупок',
        'Расчет общей суммы',
        'Категоризация товаров',
        'Быстрое добавление',
      ],
      'image': screenShoppingList,
    },
  ];

  // Referral Program
  static const Map<String, dynamic> referralProgram = {
    'title': 'Зарабатывайте с нами',
    'subtitle': '3-уровневая реферальная программа',
    'levels': [
      {
        'level': 1,
        'percentage': '6%',
        'title': '1-й уровень',
        'subtitle': 'Ваши прямые рефералы',
        'description': 'Доход от подписки',
      },
      {
        'level': 2,
        'percentage': '3%',
        'title': '2-й уровень',
        'subtitle': 'Рефералы ваших рефералов',
        'description': 'Пассивный доход',
      },
      {
        'level': 3,
        'percentage': '1%',
        'title': '3-й уровень',
        'subtitle': 'Расширенная сеть',
        'description': 'Дополнительный доход',
      },
    ],
    'howItWorks': [
      'Пригласите друзей по реферальной ссылке',
      'Получайте процент от их подписок',
      'Зарабатывайте на 3 уровня вглубь',
      'Выводите средства удобным способом',
    ],
  };

  // CTA Section
  static const String ctaTitle = 'Начните управлять финансами сегодня!';
  static const String ctaSubtitle =
      'Присоединяйтесь к тысячам пользователей, которые уже взяли контроль над своими деньгами';

  static const List<Map<String, String>> stats = [
    {'value': '10,000+', 'label': 'активных пользователей'},
    {'value': '500,000+', 'label': 'транзакций записано'},
    {'value': '85%', 'label': 'достигли финансовых целей'},
  ];

  // About Section
  static const String aboutTitle = 'О приложении';
  static const String aboutDescription =
      'Мы создали приложение, которое делает управление личными финансами простым и понятным. Наша миссия - помочь каждому человеку достичь финансовой стабильности и независимости через осознанное управление деньгами.\n\nПриложение разработано с учетом лучших практик финансового планирования и отзывов тысяч пользователей. Мы постоянно развиваемся и добавляем новые функции.';

  // Footer
  static const String footerDescription =
      'Ваш надежный помощник в управлении личными финансами';

  static const List<Map<String, String>> footerLinks = [
    {'title': 'О нас', 'url': '#about', 'type': 'link'},
    {'title': 'Возможности', 'url': '#features', 'type': 'link'},
    {'title': 'Поддержка', 'url': emailUrl, 'type': 'link'},
    {
      'title': 'Пользовательское соглашение',
      'type': 'terms',
      'contentKey': 'termsOfService',
    },
    {
      'title': 'Политика конфиденциальности',
      'type': 'terms',
      'contentKey': 'privacyPolicy',
    },
  ];

  static const String copyrightText = '© 2026, Все права защищены';

  // Legacy constants for old sections (not used in new landing page)
  static const List<Map<String, String>> testimonials = [];
  static const List<Map<String, String>> faq = [];
  static const List<Map<String, dynamic>> pricing = [];
  static const List<Map<String, String>> steps = [];
  static const List<Map<String, String>> problems = [];
  static const List<Map<String, String>> solutions = [];
}
