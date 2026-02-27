import 'package:flutter/widgets.dart';

class AppLocalizations {
  final Locale locale;

  const AppLocalizations(this.locale);

  static const supportedLocales = [
    Locale('ru'),
    Locale('en'),
    Locale('kk'),
    Locale('uk'),
    Locale('be'),
    Locale('ky'),
    Locale('uz'),
    Locale('tg'),
    Locale('hy'),
    Locale('ro'),
  ];

  static AppLocalizations of(BuildContext context) {
    final localizations = Localizations.of<AppLocalizations>(
      context,
      AppLocalizations,
    );
    assert(localizations != null, 'AppLocalizations not found in context');
    return localizations!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  String get _lang {
    final code = locale.languageCode;
    if (_localizedValues.containsKey(code)) {
      return code;
    }
    return 'ru';
  }

  String _t(String key) =>
      _localizedValues[_lang]![key] ?? _localizedValues['ru']![key] ?? key;

  Object _data(String key) =>
      (_localizedData[_lang] ?? _localizedData['ru'])![key]!;

  String get appName => _t('appName');
  String get appTitle => _t('appTitle');
  String get navHome => _t('navHome');
  String get navFeatures => _t('navFeatures');
  String get navReferral => _t('navReferral');
  String get navAbout => _t('navAbout');

  String get heroBadge => _t('heroBadge');
  String get heroTitle => _t('heroTitle');
  String get heroSubtitle => _t('heroSubtitle');
  String get heroMission => _t('heroMission');

  List<Map<String, String>> get benefits =>
      List<Map<String, String>>.from(_data('benefits') as List);

  List<Map<String, dynamic>> get detailedFeatures {
    final localized = List<Map<String, dynamic>>.from(
      _data('detailedFeatures') as List,
    );
    if (localized.length >= 6) {
      return localized;
    }
    return List<Map<String, dynamic>>.from(
      _localizedData['ru']!['detailedFeatures'] as List,
    );
  }

  Map<String, dynamic> get referralProgram =>
      Map<String, dynamic>.from(_data('referralProgram') as Map);

  String get referralHowItWorks => _t('referralHowItWorks');
  String get referralStartEarning => _t('referralStartEarning');

  String get ctaTitle => _t('ctaTitle');
  String get ctaSubtitle => _t('ctaSubtitle');
  List<Map<String, String>> get stats =>
      List<Map<String, String>>.from(_data('stats') as List);

  String get aboutTitle => _t('aboutTitle');
  String get aboutDescription => _t('aboutDescription');

  String get footerDescription => _t('footerDescription');
  List<Map<String, String>> get footerLinks =>
      List<Map<String, String>>.from(_data('footerLinks') as List);
  String get contacts => _t('contacts');
  String get socialNetworks => _t('socialNetworks');
  String get copyrightText => _t('copyrightText');

  String get faqTitle => _t('faqTitle');
  String get faqSubtitle => _t('faqSubtitle');
  String get testimonialsTitle => _t('testimonialsTitle');
  String get testimonialsSubtitle => _t('testimonialsSubtitle');
  String get howItWorksTitle => _t('howItWorksTitle');
  String get howItWorksSubtitle => _t('howItWorksSubtitle');
  String get problemTitle => _t('problemTitle');
  String get problemSubtitle => _t('problemSubtitle');
  String get solutionTitle => _t('solutionTitle');
  String get solutionSubtitle => _t('solutionSubtitle');
  String get pricingTitle => _t('pricingTitle');
  String get pricingSubtitle => _t('pricingSubtitle');
  String get pricingSelect => _t('pricingSelect');
  String get pricingPopular => _t('pricingPopular');
  String get languageCode => _lang;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => AppLocalizations.supportedLocales.any(
    (supported) => supported.languageCode == locale.languageCode,
  );

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

const Map<String, Map<String, String>> _localizedValues = {
  'ru': {
    'appName': 'Финансовый помощник',
    'appTitle': 'Приложение по управлению личными финансами',
    'navHome': 'Главная',
    'navFeatures': 'Возможности',
    'navReferral': 'Партнёрство',
    'navAbout': 'О нас',
    'heroBadge': 'Личные финансы без хаоса',
    'heroTitle': 'Приложение по управлению личными финансами',
    'heroSubtitle':
        'Возьмите контроль над своими деньгами. Планируйте, накапливайте, достигайте финансовых целей.',
    'heroMission': 'Ваш надежный партнер в мире личных финансов',
    'referralHowItWorks': 'Как это работает',
    'referralStartEarning': 'Начать зарабатывать',
    'ctaTitle': 'Начните управлять финансами сегодня!',
    'ctaSubtitle':
        'Присоединяйтесь к тысячам пользователей, которые уже взяли контроль над своими деньгами',
    'aboutTitle': 'О приложении',
    'aboutDescription':
        'Мы создали приложение, которое делает управление личными финансами простым и понятным. Наша миссия - помочь каждому человеку достичь финансовой стабильности и независимости через осознанное управление деньгами.\n\nПриложение разработано с учетом лучших практик финансового планирования и отзывов тысяч пользователей. Мы постоянно развиваемся и добавляем новые функции.',
    'footerDescription': 'Ваш надежный помощник в управлении личными финансами',
    'contacts': 'Контакты',
    'socialNetworks': 'Социальные сети',
    'copyrightText': '© 2026, Все права защищены',
    'faqTitle': 'Частые вопросы',
    'faqSubtitle': 'Мы ответили на самые популярные вопросы',
    'testimonialsTitle': 'Что говорят пользователи',
    'testimonialsSubtitle': 'Реальные истории успеха',
    'howItWorksTitle': 'Как это работает',
    'howItWorksSubtitle': 'Начните контролировать бюджет за 4 шага',
    'problemTitle': 'Знакомая ситуация?',
    'problemSubtitle': 'Многие сталкиваются с этими проблемами ежедневно',
    'solutionTitle': 'У нас есть решение',
    'solutionSubtitle': 'RaBay превращает хаос в порядок',
    'pricingTitle': 'Простые тарифы',
    'pricingSubtitle': 'Выберите то, что подходит именно вам',
    'pricingSelect': 'Выбрать',
    'pricingPopular': 'ПОПУЛЯРНЫЙ',
  },
  'en': {
    'appName': 'Finance Assistant',
    'appTitle': 'Personal Finance Management App',
    'navHome': 'Home',
    'navFeatures': 'Features',
    'navReferral': 'Partnership',
    'navAbout': 'About',
    'heroBadge': 'Personal finance without chaos',
    'heroTitle': 'Personal Finance Management App',
    'heroSubtitle':
        'Take control of your money. Plan, save, and achieve your financial goals.',
    'heroMission': 'Your trusted partner in personal finance',
    'referralHowItWorks': 'How it works',
    'referralStartEarning': 'Start earning',
    'ctaTitle': 'Start managing your finances today!',
    'ctaSubtitle':
        'Join thousands of users who have already taken control of their money',
    'aboutTitle': 'About the app',
    'aboutDescription':
        'We created an app that makes personal finance management simple and clear. Our mission is to help everyone achieve financial stability and independence through mindful money management.\n\nThe app is built using best financial planning practices and feedback from thousands of users. We continuously improve and add new features.',
    'footerDescription':
        'Your reliable assistant in personal finance management',
    'contacts': 'Contacts',
    'socialNetworks': 'Social networks',
    'copyrightText': '© 2026, All rights reserved',
    'faqTitle': 'Frequently asked questions',
    'faqSubtitle': 'We answered the most popular questions',
    'testimonialsTitle': 'What users say',
    'testimonialsSubtitle': 'Real success stories',
    'howItWorksTitle': 'How it works',
    'howItWorksSubtitle': 'Start controlling your budget in 4 steps',
    'problemTitle': 'Does this sound familiar?',
    'problemSubtitle': 'Many people face these challenges every day',
    'solutionTitle': 'We have a solution',
    'solutionSubtitle': 'RaBay turns chaos into order',
    'pricingTitle': 'Simple pricing',
    'pricingSubtitle': 'Choose what fits you best',
    'pricingSelect': 'Choose',
    'pricingPopular': 'POPULAR',
  },
  'kk': {
    'appName': 'Қаржы көмекшісі',
    'appTitle': 'Жеке қаржыны басқару қосымшасы',
    'navHome': 'Басты бет',
    'navFeatures': 'Мүмкіндіктер',
    'navReferral': 'Серіктестік',
    'navAbout': 'Біз туралы',
    'heroBadge': 'Жеке қаржы — ретсіздіксіз',
    'heroTitle': 'Жеке қаржыны басқару қосымшасы',
    'heroSubtitle':
        'Ақшаңызды бақылауға алыңыз. Жоспарлаңыз, жинаңыз және қаржылық мақсаттарыңызға жетіңіз.',
    'heroMission': 'Жеке қаржы әлеміндегі сенімді серіктесіңіз',
    'referralHowItWorks': 'Бұл қалай жұмыс істейді',
    'referralStartEarning': 'Табыс табуды бастау',
    'ctaTitle': 'Қаржыңызды бүгіннен бастап басқарыңыз!',
    'ctaSubtitle': 'Ақшасын бақылауға алған мыңдаған пайдаланушыға қосылыңыз',
    'aboutTitle': 'Қосымша туралы',
    'aboutDescription':
        'Біз жеке қаржыны басқаруды қарапайым әрі түсінікті ететін қосымша жасадық. Миссиямыз — саналы қаржы басқаруы арқылы әр адамға қаржылық тұрақтылық пен тәуелсіздікке жетуге көмектесу.\n\nҚосымша қаржылық жоспарлаудың үздік тәжірибелері мен мыңдаған пайдаланушы пікірлері негізінде жасалған. Біз үнемі дамып, жаңа мүмкіндіктерді қосамыз.',
    'footerDescription': 'Жеке қаржыны басқарудағы сенімді көмекшіңіз',
    'contacts': 'Байланыс',
    'socialNetworks': 'Әлеуметтік желілер',
    'copyrightText': '© 2026, Барлық құқықтар қорғалған',
    'faqTitle': 'Жиі қойылатын сұрақтар',
    'faqSubtitle': 'Ең жиі қойылатын сұрақтарға жауап бердік',
    'testimonialsTitle': 'Пайдаланушылар не дейді',
    'testimonialsSubtitle': 'Шынайы табыс тарихтары',
    'howItWorksTitle': 'Бұл қалай жұмыс істейді',
    'howItWorksSubtitle': 'Бюджетті 4 қадамда бақылауды бастаңыз',
    'problemTitle': 'Таныс жағдай ма?',
    'problemSubtitle': 'Көпшілік бұл мәселелерге күн сайын тап болады',
    'solutionTitle': 'Бізде шешім бар',
    'solutionSubtitle': 'RaBay ретсіздікті тәртіпке айналдырады',
    'pricingTitle': 'Қарапайым тарифтер',
    'pricingSubtitle': 'Өзіңізге лайық нұсқаны таңдаңыз',
    'pricingSelect': 'Таңдау',
    'pricingPopular': 'ТАНЫМАЛ',
  },
  'uk': {
    'appName': 'Фінансовий помічник',
    'appTitle': 'Застосунок для керування особистими фінансами',
    'navHome': 'Головна',
    'navFeatures': 'Можливості',
    'navReferral': 'Партнерство',
    'navAbout': 'Про нас',
    'heroBadge': 'Особисті фінанси без хаосу',
    'heroTitle': 'Застосунок для керування особистими фінансами',
    'heroSubtitle':
        'Візьміть під контроль свої гроші. Плануйте, заощаджуйте та досягайте фінансових цілей.',
    'heroMission': 'Ваш надійний партнер у світі особистих фінансів',
    'referralHowItWorks': 'Як це працює',
    'referralStartEarning': 'Почати заробляти',
    'ctaTitle': 'Почніть керувати фінансами вже сьогодні!',
    'ctaSubtitle':
        'Приєднуйтесь до тисяч користувачів, які вже взяли гроші під контроль',
    'aboutTitle': 'Про застосунок',
    'aboutDescription':
        'Ми створили застосунок, який робить управління особистими фінансами простим і зрозумілим. Наша місія — допомогти кожній людині досягти фінансової стабільності та незалежності через усвідомлене управління грошима.\n\nЗастосунок розроблено з урахуванням найкращих практик фінансового планування та відгуків тисяч користувачів. Ми постійно розвиваємось і додаємо нові функції.',
    'footerDescription':
        'Ваш надійний помічник в управлінні особистими фінансами',
    'contacts': 'Контакти',
    'socialNetworks': 'Соціальні мережі',
    'copyrightText': '© 2026, Усі права захищено',
    'faqTitle': 'Поширені запитання',
    'faqSubtitle': 'Ми відповіли на найпопулярніші запитання',
    'testimonialsTitle': 'Що кажуть користувачі',
    'testimonialsSubtitle': 'Реальні історії успіху',
    'howItWorksTitle': 'Як це працює',
    'howItWorksSubtitle': 'Почніть контролювати бюджет за 4 кроки',
    'problemTitle': 'Знайома ситуація?',
    'problemSubtitle': 'Багато хто стикається з цими проблемами щодня',
    'solutionTitle': 'У нас є рішення',
    'solutionSubtitle': 'RaBay перетворює хаос на порядок',
    'pricingTitle': 'Прості тарифи',
    'pricingSubtitle': 'Оберіть те, що підходить саме вам',
    'pricingSelect': 'Обрати',
    'pricingPopular': 'ПОПУЛЯРНИЙ',
  },
  'be': {
    'appName': 'Фінансавы памочнік',
    'appTitle': 'Дадатак для кіравання асабістымі фінансамі',
    'navHome': 'Галоўная',
    'navFeatures': 'Магчымасці',
    'navReferral': 'Партнёрства',
    'navAbout': 'Пра нас',
    'heroBadge': 'Асабістыя фінансы без хаосу',
    'heroTitle': 'Дадатак для кіравання асабістымі фінансамі',
    'heroSubtitle':
        'Вазьміце пад кантроль свае грошы. Плануйце, зберагайце і дасягайце фінансавых мэт.',
    'heroMission': 'Ваш надзейны партнёр у свеце асабістых фінансаў',
    'referralHowItWorks': 'Як гэта працуе',
    'referralStartEarning': 'Пачаць зарабляць',
    'ctaTitle': 'Пачніце кіраваць фінансамі ўжо сёння!',
    'ctaSubtitle':
        'Далучайцеся да тысяч карыстальнікаў, якія ўжо ўзялі грошы пад кантроль',
    'aboutTitle': 'Пра дадатак',
    'aboutDescription':
        'Мы стварылі дадатак, які робіць кіраванне асабістымі фінансамі простым і зразумелым. Наша місія — дапамагчы кожнаму чалавеку дасягнуць фінансавай стабільнасці і незалежнасці праз асэнсаванае кіраванне грашыма.\n\nДадатак распрацаваны з улікам лепшых практык фінансавага планавання і водгукаў тысяч карыстальнікаў. Мы пастаянна развіваемся і дадаем новыя функцыі.',
    'footerDescription':
        'Ваш надзейны памочнік у кіраванні асабістымі фінансамі',
    'contacts': 'Кантакты',
    'socialNetworks': 'Сацыяльныя сеткі',
    'copyrightText': '© 2026, Усе правы абаронены',
    'faqTitle': 'Частыя пытанні',
    'faqSubtitle': 'Мы адказалі на самыя папулярныя пытанні',
    'testimonialsTitle': 'Што кажуць карыстальнікі',
    'testimonialsSubtitle': 'Рэальныя гісторыі поспеху',
    'howItWorksTitle': 'Як гэта працуе',
    'howItWorksSubtitle': 'Пачніце кантраляваць бюджэт за 4 крокі',
    'problemTitle': 'Знаёмая сітуацыя?',
    'problemSubtitle': 'Многія сутыкаюцца з гэтымі праблемамі штодня',
    'solutionTitle': 'У нас ёсць рашэнне',
    'solutionSubtitle': 'RaBay ператварае хаос у парадак',
    'pricingTitle': 'Простыя тарыфы',
    'pricingSubtitle': 'Выберыце тое, што падыходзіць менавіта вам',
    'pricingSelect': 'Выбраць',
    'pricingPopular': 'ПАПУЛЯРНЫ',
  },
  'ky': {
    'appName': 'Каржы жардамчысы',
    'appTitle': 'Жеке каржыны башкаруу колдонмосу',
    'navHome': 'Башкы бет',
    'navFeatures': 'Мүмкүнчүлүктөр',
    'navReferral': 'Өнөктөштүк',
    'navAbout': 'Биз жөнүндө',
    'heroBadge': 'Жеке каржы — башаламандыксыз',
    'heroTitle': 'Жеке каржыны башкаруу колдонмосу',
    'heroSubtitle':
        'Акчаңызды көзөмөлгө алыңыз. Планды түзүңүз, топтоңуз жана каржылык максаттарга жетиңиз.',
    'heroMission': 'Жеке каржы дүйнөсүндөгү ишенимдүү өнөктөшүңүз',
    'referralHowItWorks': 'Бул кандай иштейт',
    'referralStartEarning': 'Тапканды баштоо',
    'ctaTitle': 'Бүгүнтөн тартып каржыңызды башкарыңыз!',
    'ctaSubtitle': 'Акчасын көзөмөлгө алган миңдеген колдонуучуларга кошулуңуз',
    'aboutTitle': 'Колдонмо жөнүндө',
    'aboutDescription':
        'Биз жеке каржыны башкарууну жөнөкөй жана түшүнүктүү кылган колдонмону түздүк. Биздин миссия — ар бир адамга акчаны аң-сезимдүү башкаруу аркылуу каржылык туруктуулукка жана көзкарандысыздыкка жетүүгө жардам берүү.\n\nКолдонмо каржылык пландоонун мыкты тажрыйбалары жана миңдеген колдонуучулардын пикирлери эске алынып иштелип чыккан. Биз дайыма өнүгүп, жаңы функцияларды кошобуз.',
    'footerDescription': 'Жеке каржыны башкарууда ишенимдүү жардамчыңыз',
    'contacts': 'Байланыш',
    'socialNetworks': 'Социалдык тармактар',
    'copyrightText': '© 2026, Бардык укуктар корголгон',
    'faqTitle': 'Көп берилүүчү суроолор',
    'faqSubtitle': 'Эң популярдуу суроолорго жооп бердик',
    'testimonialsTitle': 'Колдонуучулар эмне дейт',
    'testimonialsSubtitle': 'Чыныгы ийгилик окуялары',
    'howItWorksTitle': 'Бул кандай иштейт',
    'howItWorksSubtitle': 'Бюджетти 4 кадам менен көзөмөлдөөнү баштаңыз',
    'problemTitle': 'Тааныш абалбы?',
    'problemSubtitle': 'Көптөр бул көйгөйлөргө күн сайын туш болот',
    'solutionTitle': 'Бизде чечим бар',
    'solutionSubtitle': 'RaBay башаламандыкты тартипке келтирет',
    'pricingTitle': 'Жөнөкөй тарифтер',
    'pricingSubtitle': 'Өзүңүзгө ылайыктуусун тандаңыз',
    'pricingSelect': 'Тандоо',
    'pricingPopular': 'ТААНЫМАЛ',
  },
  'uz': {
    'appName': 'Moliyaviy yordamchi',
    'appTitle': 'Shaxsiy moliyani boshqarish ilovasi',
    'navHome': 'Bosh sahifa',
    'navFeatures': 'Imkoniyatlar',
    'navReferral': 'Hamkorlik',
    'navAbout': 'Biz haqimizda',
    'heroBadge': 'Shaxsiy moliya — tartibsizlarsiz',
    'heroTitle': 'Shaxsiy moliyani boshqarish ilovasi',
    'heroSubtitle':
        'Pul mablag‘laringizni nazoratga oling. Rejalashtiring, jamg‘aring va moliyaviy maqsadlarga erishing.',
    'heroMission': 'Shaxsiy moliya olamidagi ishonchli hamkoringiz',
    'referralHowItWorks': 'Bu qanday ishlaydi',
    'referralStartEarning': 'Daromad olishni boshlash',
    'ctaTitle': 'Bugunoq moliyangizni boshqarishni boshlang!',
    'ctaSubtitle':
        'Pulini allaqachon nazoratga olgan minglab foydalanuvchilarga qo‘shiling',
    'aboutTitle': 'Ilova haqida',
    'aboutDescription':
        'Biz shaxsiy moliyani boshqarishni sodda va tushunarli qiladigan ilovani yaratdik. Missiyamiz — ongli pul boshqaruvi orqali har bir insonga moliyaviy barqarorlik va mustaqillikka erishishda yordam berish.\n\nIlova moliyaviy rejalashtirishning eng yaxshi amaliyotlari va minglab foydalanuvchilar fikri asosida ishlab chiqilgan. Biz doimiy ravishda rivojlanib, yangi funksiyalar qo‘shamiz.',
    'footerDescription':
        'Shaxsiy moliyani boshqarishdagi ishonchli yordamchingiz',
    'contacts': 'Aloqa',
    'socialNetworks': 'Ijtimoiy tarmoqlar',
    'copyrightText': '© 2026, Barcha huquqlar himoyalangan',
    'faqTitle': 'Ko‘p so‘raladigan savollar',
    'faqSubtitle': 'Eng ommabop savollarga javob berdik',
    'testimonialsTitle': 'Foydalanuvchilar fikri',
    'testimonialsSubtitle': 'Haqiqiy muvaffaqiyat hikoyalari',
    'howItWorksTitle': 'Bu qanday ishlaydi',
    'howItWorksSubtitle': 'Byudjetni 4 qadamda nazorat qilishni boshlang',
    'problemTitle': 'Tanish holatmi?',
    'problemSubtitle': 'Ko‘pchilik bu muammolarga har kuni duch keladi',
    'solutionTitle': 'Bizda yechim bor',
    'solutionSubtitle': 'RaBay tartibsizlikni tartibga aylantiradi',
    'pricingTitle': 'Oddiy tariflar',
    'pricingSubtitle': 'O‘zingizga mosini tanlang',
    'pricingSelect': 'Tanlash',
    'pricingPopular': 'OMMABOP',
  },
  'tg': {
    'appName': 'Ёрдамчии молиявӣ',
    'appTitle': 'Барномаи идоракунии молияи шахсӣ',
    'navHome': 'Саҳифаи асосӣ',
    'navFeatures': 'Имкониятҳо',
    'navReferral': 'Шарикӣ',
    'navAbout': 'Дар бораи мо',
    'heroBadge': 'Молияи шахсӣ бидуни бесарусомонӣ',
    'heroTitle': 'Барномаи идоракунии молияи шахсӣ',
    'heroSubtitle':
        'Пулҳои худро зери назорат гиред. Нақша кунед, пасандоз намоед ва ба ҳадафҳои молиявӣ бирасед.',
    'heroMission': 'Шарики боэътимоди шумо дар ҷаҳони молияи шахсӣ',
    'referralHowItWorks': 'Ин чӣ гуна кор мекунад',
    'referralStartEarning': 'Оғози даромад',
    'ctaTitle': 'Имрӯз идоракунии молияи худро оғоз кунед!',
    'ctaSubtitle':
        'Ба ҳазорон корбароне ҳамроҳ шавед, ки аллакай пулашонро назорат мекунанд',
    'aboutTitle': 'Дар бораи барнома',
    'aboutDescription':
        'Мо барномае сохтем, ки идоракунии молияи шахсиро содда ва фаҳмо месозад. Ҳадафи мо кумак ба ҳар шахс барои расидан ба устувории молиявӣ ва мустақилият тавассути идоракунии огоҳонаи маблағҳост.\n\nБарнома бо назардошти таҷрибаҳои беҳтарини банақшагирии молиявӣ ва фикру мулоҳизаҳои ҳазорон корбар таҳия шудааст. Мо пайваста рушд мекунем ва функсияҳои нав илова менамоем.',
    'footerDescription': 'Ёрдамчии боэътимоди шумо дар идоракунии молияи шахсӣ',
    'contacts': 'Тамос',
    'socialNetworks': 'Шабакаҳои иҷтимоӣ',
    'copyrightText': '© 2026, Ҳамаи ҳуқуқҳо ҳифз шудаанд',
    'faqTitle': 'Саволҳои маъмул',
    'faqSubtitle': 'Ба саволҳои аз ҳама машҳур ҷавоб додем',
    'testimonialsTitle': 'Корбарон чӣ мегӯянд',
    'testimonialsSubtitle': 'Ҳикояҳои воқеии муваффақият',
    'howItWorksTitle': 'Ин чӣ гуна кор мекунад',
    'howItWorksSubtitle': 'Идоракунии буҷаро дар 4 қадам оғоз кунед',
    'problemTitle': 'Вазъияти шинос?',
    'problemSubtitle': 'Бисёриҳо ҳар рӯз бо ин мушкилот рӯ ба рӯ мешаванд',
    'solutionTitle': 'Мо ҳалли масъала дорем',
    'solutionSubtitle': 'RaBay бесарусомониро ба тартиб меорад',
    'pricingTitle': 'Тарифҳои одӣ',
    'pricingSubtitle': 'Он чизеро интихоб кунед, ки ба шумо мувофиқ аст',
    'pricingSelect': 'Интихоб',
    'pricingPopular': 'МАШҲУР',
  },
  'hy': {
    'appName': 'Ֆինանսական օգնական',
    'appTitle': 'Անձնական ֆինանսների կառավարման հավելված',
    'navHome': 'Գլխավոր',
    'navFeatures': 'Հնարավորություններ',
    'navReferral': 'Գործընկերություն',
    'navAbout': 'Մեր մասին',
    'heroBadge': 'Անձնական ֆինանսներ՝ առանց քաոսի',
    'heroTitle': 'Անձնական ֆինանսների կառավարման հավելված',
    'heroSubtitle':
        'Վերահսկեք ձեր գումարը։ Պլանավորեք, խնայեք և հասեք ֆինանսական նպատակներին։',
    'heroMission': 'Ձեր վստահելի գործընկերը անձնական ֆինանսների աշխարհում',
    'referralHowItWorks': 'Ինչպես է դա աշխատում',
    'referralStartEarning': 'Սկսել վաստակել',
    'ctaTitle': 'Սկսեք կառավարել ձեր ֆինանսները այսօր!',
    'ctaSubtitle':
        'Միացեք հազարավոր օգտատերերի, որոնք արդեն վերահսկում են իրենց գումարը',
    'aboutTitle': 'Հավելվածի մասին',
    'aboutDescription':
        'Մենք ստեղծել ենք հավելված, որը դարձնում է անձնական ֆինանսների կառավարումը պարզ և հասկանալի։ Մեր առաքելությունն է օգնել յուրաքանչյուրին հասնել ֆինանսական կայունության և անկախության՝ գիտակցված գումարի կառավարման միջոցով։\n\nՀավելվածը մշակվել է ֆինանսական պլանավորման լավագույն փորձի և հազարավոր օգտատերերի կարծիքների հիման վրա։ Մենք մշտապես զարգանում ենք և ավելացնում նոր հնարավորություններ։',
    'footerDescription':
        'Ձեր վստահելի օգնականը անձնական ֆինանսների կառավարման մեջ',
    'contacts': 'Կոնտակտներ',
    'socialNetworks': 'Սոցիալական ցանցեր',
    'copyrightText': '© 2026, Բոլոր իրավունքները պաշտպանված են',
    'faqTitle': 'Հաճախ տրվող հարցեր',
    'faqSubtitle': 'Պատասխանել ենք ամենատարածված հարցերին',
    'testimonialsTitle': 'Ինչ են ասում օգտատերերը',
    'testimonialsSubtitle': 'Հաջողության իրական պատմություններ',
    'howItWorksTitle': 'Ինչպես է դա աշխատում',
    'howItWorksSubtitle': 'Սկսեք վերահսկել բյուջեն 4 քայլով',
    'problemTitle': 'Ծանո՞թ իրավիճակ է',
    'problemSubtitle': 'Շատերը ամեն օր բախվում են այս խնդիրներին',
    'solutionTitle': 'Մենք լուծում ունենք',
    'solutionSubtitle': 'RaBay-ը քաոսը վերածում է կարգի',
    'pricingTitle': 'Պարզ սակագներ',
    'pricingSubtitle': 'Ընտրեք այն, ինչ ձեզ է համապատասխանում',
    'pricingSelect': 'Ընտրել',
    'pricingPopular': 'ՀԱՅՏՆԻ',
  },
  'ro': {
    'appName': 'Asistent financiar',
    'appTitle': 'Aplicație pentru gestionarea finanțelor personale',
    'navHome': 'Acasă',
    'navFeatures': 'Funcții',
    'navReferral': 'Parteneriat',
    'navAbout': 'Despre noi',
    'heroBadge': 'Finanțe personale fără haos',
    'heroTitle': 'Aplicație pentru gestionarea finanțelor personale',
    'heroSubtitle':
        'Preia controlul asupra banilor tăi. Planifică, economisește și atinge obiectivele financiare.',
    'heroMission': 'Partenerul tău de încredere în finanțele personale',
    'referralHowItWorks': 'Cum funcționează',
    'referralStartEarning': 'Începe să câștigi',
    'ctaTitle': 'Începe să-ți gestionezi finanțele chiar azi!',
    'ctaSubtitle':
        'Alătură-te miilor de utilizatori care și-au luat deja banii sub control',
    'aboutTitle': 'Despre aplicație',
    'aboutDescription':
        'Am creat o aplicație care face gestionarea finanțelor personale simplă și clară. Misiunea noastră este să ajutăm fiecare persoană să atingă stabilitatea și independența financiară prin administrarea conștientă a banilor.\n\nAplicația este dezvoltată pe baza celor mai bune practici de planificare financiară și a feedback-ului a mii de utilizatori. Ne dezvoltăm constant și adăugăm funcții noi.',
    'footerDescription': 'Asistentul tău de încredere pentru finanțe personale',
    'contacts': 'Contacte',
    'socialNetworks': 'Rețele sociale',
    'copyrightText': '© 2026, Toate drepturile rezervate',
    'faqTitle': 'Întrebări frecvente',
    'faqSubtitle': 'Am răspuns la cele mai populare întrebări',
    'testimonialsTitle': 'Ce spun utilizatorii',
    'testimonialsSubtitle': 'Povești reale de succes',
    'howItWorksTitle': 'Cum funcționează',
    'howItWorksSubtitle': 'Începe să controlezi bugetul în 4 pași',
    'problemTitle': 'Situație cunoscută?',
    'problemSubtitle': 'Mulți se confruntă zilnic cu aceste probleme',
    'solutionTitle': 'Avem o soluție',
    'solutionSubtitle': 'RaBay transformă haosul în ordine',
    'pricingTitle': 'Tarife simple',
    'pricingSubtitle': 'Alege ce ți se potrivește',
    'pricingSelect': 'Alege',
    'pricingPopular': 'POPULAR',
  },
};

const Map<String, Map<String, Object>> _localizedData = {
  'ru': {
    'benefits': [
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
        'title': 'Управляйте долгами, планируйте платежи',
        'description':
            'Отслеживайте долги и кредиты. Планируйте регулярные платежи и освобождайтесь от финансовых обязательств.',
      },
    ],
    'detailedFeatures': [
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
      },
    ],
    'referralProgram': {
      'title': 'Зарабатывайте с нами',
      'subtitle': '3-уровневая реферальная программа',
      'levels': [
        {
          'level': 1,
          'percentage': '8%',
          'title': '1-й уровень',
          'subtitle': 'Ваши прямые рефералы',
          'description': 'Доход от подписки',
        },
        {
          'level': 2,
          'percentage': '4%',
          'title': '2-й уровень',
          'subtitle': 'Рефералы ваших рефералов',
          'description': 'Пассивный доход',
        },
        {
          'level': 3,
          'percentage': '2%',
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
    },
    'stats': [
      {'value': '10,000+', 'label': 'активных пользователей'},
      {'value': '500,000+', 'label': 'транзакций записано'},
      {'value': '85%', 'label': 'достигли финансовых целей'},
    ],
    'footerLinks': [
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
    ],
  },
  'en': {
    'benefits': [
      {
        'title': 'Complete financial control',
        'description':
            'Track all income and expenses in one place. Analyze your spending and discover ways to save.',
      },
      {
        'title': 'Reach goals faster',
        'description':
            'Create savings for important purchases. Track progress and stay motivated for financial success.',
      },
      {
        'title': 'Manage debts and plan payments',
        'description':
            'Track debts and loans. Plan recurring payments and reduce financial obligations.',
      },
    ],
    'detailedFeatures': [
      {
        'title': 'Income and expenses',
        'subtitle': 'Tracking has never been this easy!',
        'description':
            'Control all income and expense categories. Instantly see where you can save. Analyze your budget at a glance. Create your own categories and subcategories. Export data to Excel.',
        'features': [
          'Categories with subcategories',
          'Monthly category limits',
          'Detailed analytics',
          'Excel export',
        ],
      },
      {
        'title': 'Multi-currency accounts',
        'subtitle': 'Manage money in any currency',
        'description':
            'Create unlimited accounts in different currencies. Transfer between accounts with automatic rate conversion. See your total balance across currencies.',
        'features': [
          'Unlimited accounts',
          'Support for all major currencies',
          'Automatic exchange rate conversion',
          'Transfers between accounts',
        ],
      },
      {
        'title': 'Savings',
        'subtitle': 'Achieve financial goals',
        'description':
            'Create savings goals for purchases, travel, and education. Track progress in percentages. Save regularly or one-time. Reach goals faster with progress visualization.',
        'features': [
          'Progress visualization',
          'Multiple savings goals',
          'Deadline tracking',
          'Motivational reminders',
        ],
      },
      {
        'title': 'Debt management',
        'subtitle': 'Control financial obligations',
        'description':
            'Two sections: "I owe" and "Owed to me". Add debt details, due dates, and amounts. Mark partial repayments. Receive reminders before deadlines.',
        'features': [
          'Separate debt tracking',
          'Payment reminders',
          'Repayment history',
          'Interest calculations',
        ],
      },
      {
        'title': 'Recurring payments',
        'subtitle': 'Never miss important payments',
        'description':
            'Add subscriptions, utility bills, and loans. Set frequency: daily, weekly, monthly, yearly. Get reminders before due dates. Automatic transaction creation.',
        'features': [
          'Flexible recurrence settings',
          'Smart reminders',
          'Automatic transactions',
          'Payment history',
        ],
      },
      {
        'title': 'Shopping list',
        'subtitle': 'Plan spending in advance',
        'description':
            'Create shopping lists with prices. Calculate total amount before going to the store. Mark purchased items. Control impulse buying.',
        'features': [
          'Multiple shopping lists',
          'Total amount calculation',
          'Item categorization',
          'Quick add',
        ],
      },
    ],
    'referralProgram': {
      'title': 'Earn with us',
      'subtitle': '3-level referral program',
      'levels': [
        {
          'level': 1,
          'percentage': '8%',
          'title': 'Level 1',
          'subtitle': 'Your direct referrals',
          'description': 'Subscription income',
        },
        {
          'level': 2,
          'percentage': '4%',
          'title': 'Level 2',
          'subtitle': 'Referrals of your referrals',
          'description': 'Passive income',
        },
        {
          'level': 3,
          'percentage': '2%',
          'title': 'Level 3',
          'subtitle': 'Extended network',
          'description': 'Additional income',
        },
      ],
      'howItWorks': [
        'Invite friends using your referral link',
        'Get a percentage from their subscriptions',
        'Earn up to 3 levels deep',
        'Withdraw funds in a convenient way',
      ],
    },
    'stats': [
      {'value': '10,000+', 'label': 'active users'},
      {'value': '500,000+', 'label': 'transactions recorded'},
      {'value': '85%', 'label': 'reached financial goals'},
    ],
    'footerLinks': [
      {
        'title': 'Terms of Service',
        'type': 'terms',
        'contentKey': 'termsOfService',
      },
      {
        'title': 'Privacy Policy',
        'type': 'terms',
        'contentKey': 'privacyPolicy',
      },
    ],
  },
  'kk': {
    'benefits': [
      {
        'title': 'Қаржыны толық бақылау',
        'description':
            'Барлық кіріс пен шығысты бір жерден бақылаңыз. Шығындарыңызды талдап, үнемдеу жолдарын табыңыз.',
      },
      {
        'title': 'Мақсатқа тезірек жетіңіз',
        'description':
            'Маңызды сатып алуларға жинақ жасаңыз. Прогресті бақылап, қаржылық жетістікке ынталаныңыз.',
      },
      {
        'title': 'Қарызды басқарып, төлемді жоспарлаңыз',
        'description':
            'Қарыздар мен несиелерді қадағалаңыз. Тұрақты төлемдерді жоспарлап, міндеттемелерден босаныңыз.',
      },
    ],
    'detailedFeatures': [
      {
        'title': 'Кірістер мен шығыстар',
        'subtitle': 'Есеп жүргізу бұрын-соңды мұншалықты ыңғайлы болмаған!',
        'description':
            'Кіріс пен шығыстың барлық санатын бақылаңыз. Қай жерде үнемдеуге болатынын бірден көріңіз. Бюджетті бір қарағанда талдаңыз. Өз санаттарыңыз бен ішкі санаттарыңызды жасаңыз. Деректерді Excel-ге экспорттаңыз.',
        'features': [
          'Ішкі санаттары бар санаттар',
          'Санаттар бойынша айлық лимиттер',
          'Толық статистика',
          'Excel-ге экспорт',
        ],
      },
      {
        'title': 'Көп валюталы шоттар',
        'subtitle': 'Кез келген валютада ақша басқарыңыз',
        'description':
            'Әртүрлі валютада шексіз шот ашыңыз. Шоттар арасында курсты автоматты қайта есептеумен аударыңыз. Барлық валютадағы жалпы балансты көріңіз.',
        'features': [
          'Шот санына шектеу жоқ',
          'Әлем валюталарын қолдау',
          'Курсты автоматты қайта есептеу',
          'Шоттар арасындағы аударымдар',
        ],
      },
      {
        'title': 'Жинақ',
        'subtitle': 'Қаржылық мақсаттарға жетіңіз',
        'description':
            'Сатып алу, саяхат, оқу үшін жинақ мақсаттарын жасаңыз. Прогресті пайызбен бақылаңыз. Тұрақты немесе бір реттік жинаңыз. Көрнекі прогресс арқылы тезірек жетіңіз.',
        'features': [
          'Прогресті визуализациялау',
          'Бірнеше жинақ мақсаты',
          'Мерзімді бақылау',
          'Мотивациялық хабарламалар',
        ],
      },
      {
        'title': 'Қарызды басқару',
        'subtitle': 'Қаржылық міндеттемелерді бақылаңыз',
        'description':
            'Екі бөлім: "Мен қарызбын" және "Маған қарыз". Қарыз деректері, мерзімі мен сомасын қосыңыз. Ішінара өтеуді белгілеңіз. Мерзім жақындағанда еске салғыш алыңыз.',
        'features': [
          'Қарызды бөлек есепке алу',
          'Төлем еске салғыштары',
          'Өтеу тарихы',
          'Пайыздық есептеулер',
        ],
      },
      {
        'title': 'Тұрақты төлемдер',
        'subtitle': 'Маңызды төлемдерді жіберіп алмаңыз',
        'description':
            'Жазылымдар, коммуналдық төлемдер мен несиелерді қосыңыз. Жиілігін баптаңыз: күн сайын, апта сайын, ай сайын, жыл сайын. Төлем күніне дейін еске салғыш алыңыз. Транзакциялар автоматты жасалады.',
        'features': [
          'Жиілікті икемді баптау',
          'Ақылды еске салғыштар',
          'Автоматты транзакциялар',
          'Төлем тарихы',
        ],
      },
      {
        'title': 'Сатып алу тізімі',
        'subtitle': 'Шығынды алдын ала жоспарлаңыз',
        'description':
            'Бағалары бар сатып алу тізімдерін жасаңыз. Дүкенге бармас бұрын жалпы соманы есептеңіз. Сатып алынған тауарларды белгілеңіз. Кенеттен сатып алуды бақылаңыз.',
        'features': [
          'Бірнеше сатып алу тізімі',
          'Жалпы соманы есептеу',
          'Тауарларды санаттау',
          'Жылдам қосу',
        ],
      },
    ],
    'referralProgram': {
      'title': 'Бізбен бірге табыс табыңыз',
      'subtitle': '3 деңгейлі реферальды бағдарлама',
      'levels': [
        {
          'level': 1,
          'percentage': '8%',
          'title': '1-деңгей',
          'subtitle': 'Тікелей рефералдарыңыз',
          'description': 'Жазылымнан табыс',
        },
        {
          'level': 2,
          'percentage': '4%',
          'title': '2-деңгей',
          'subtitle': 'Рефералдарыңыздың рефералдары',
          'description': 'Пассив табыс',
        },
        {
          'level': 3,
          'percentage': '2%',
          'title': '3-деңгей',
          'subtitle': 'Кеңейтілген желі',
          'description': 'Қосымша табыс',
        },
      ],
      'howItWorks': [
        'Реферал сілтемесі арқылы достарыңызды шақырыңыз',
        'Олардың жазылымдарынан пайыз алыңыз',
        '3 деңгейге дейін табыс табыңыз',
        'Қаражатты ыңғайлы тәсілмен шығарыңыз',
      ],
    },
    'stats': [
      {'value': '10,000+', 'label': 'белсенді пайдаланушы'},
      {'value': '500,000+', 'label': 'тіркелген транзакция'},
      {'value': '85%', 'label': 'қаржылық мақсатқа жетті'},
    ],
    'footerLinks': [
      {
        'title': 'Пайдаланушы келісімі',
        'type': 'terms',
        'contentKey': 'termsOfService',
      },
      {
        'title': 'Құпиялылық саясаты',
        'type': 'terms',
        'contentKey': 'privacyPolicy',
      },
    ],
  },
  'uk': {
    'benefits': [
      {
        'title': 'Повний контроль фінансів',
        'description':
            'Відстежуйте всі доходи та витрати в одному місці. Аналізуйте витрати й знаходьте способи заощадження.',
      },
      {
        'title': 'Досягайте цілей швидше',
        'description':
            'Створюйте накопичення на важливі покупки. Відстежуйте прогрес і мотивуйте себе на фінансовий успіх.',
      },
      {
        'title': 'Керуйте боргами та плануйте платежі',
        'description':
            'Відстежуйте борги та кредити. Плануйте регулярні платежі й позбувайтеся фінансових зобов’язань.',
      },
    ],
    'detailedFeatures': [
      {
        'title': 'Доходи та витрати',
        'subtitle': 'Облік ще ніколи не був таким зручним!',
        'description':
            'Контролюйте всі категорії доходів і витрат. Наочно бачте, де можна заощадити. Аналізуйте бюджет одним поглядом. Створюйте власні категорії та підкатегорії. Експортуйте дані в Excel.',
        'features': [
          'Категорії з підкатегоріями',
          'Місячні ліміти на категорії',
          'Детальна статистика',
          'Експорт в Excel',
        ],
      },
      {
        'title': 'Мультивалютні рахунки',
        'subtitle': 'Керуйте грошима в будь-якій валюті',
        'description':
            'Створюйте необмежену кількість рахунків у різних валютах. Переказуйте між рахунками з автоматичним перерахунком курсу. Бачте загальний баланс у всіх валютах.',
        'features': [
          'Необмежена кількість рахунків',
          'Підтримка світових валют',
          'Автоматичний перерахунок курсів',
          'Перекази між рахунками',
        ],
      },
      {
        'title': 'Накопичення',
        'subtitle': 'Досягайте фінансових цілей',
        'description':
            'Створюйте цілі накопичення на покупки, подорожі, навчання. Відстежуйте прогрес у відсотках. Відкладайте гроші регулярно або разово. Досягайте цілей швидше з візуалізацією прогресу.',
        'features': [
          'Візуалізація прогресу',
          'Кілька цілей накопичення',
          'Контроль термінів',
          'Мотиваційні сповіщення',
        ],
      },
      {
        'title': 'Керування боргами',
        'subtitle': 'Контролюйте фінансові зобов’язання',
        'description':
            'Два розділи: "Я винен" і "Мені винні". Додавайте деталі боргу, строки й суми. Позначайте часткові погашення. Отримуйте нагадування про наближення строків.',
        'features': [
          'Окремий облік боргів',
          'Нагадування про платежі',
          'Історія погашень',
          'Процентні розрахунки',
        ],
      },
      {
        'title': 'Регулярні платежі',
        'subtitle': 'Ніколи не пропускайте важливі платежі',
        'description':
            'Додавайте підписки, комунальні платежі, кредити. Налаштовуйте частоту: щодня, щотижня, щомісяця, щороку. Отримуйте нагадування перед датою платежу. Автоматичне створення транзакцій.',
        'features': [
          'Гнучкі налаштування періодичності',
          'Розумні нагадування',
          'Автоматичні транзакції',
          'Історія платежів',
        ],
      },
      {
        'title': 'Список покупок',
        'subtitle': 'Плануйте витрати заздалегідь',
        'description':
            'Створюйте списки покупок із цінами. Розраховуйте загальну суму перед походом у магазин. Позначайте куплені товари. Контролюйте спонтанні покупки.',
        'features': [
          'Кілька списків покупок',
          'Розрахунок загальної суми',
          'Категоризація товарів',
          'Швидке додавання',
        ],
      },
    ],
    'referralProgram': {
      'title': 'Заробляйте з нами',
      'subtitle': '3-рівнева реферальна програма',
      'levels': [
        {
          'level': 1,
          'percentage': '8%',
          'title': '1-й рівень',
          'subtitle': 'Ваші прямі реферали',
          'description': 'Дохід із підписки',
        },
        {
          'level': 2,
          'percentage': '4%',
          'title': '2-й рівень',
          'subtitle': 'Реферали ваших рефералів',
          'description': 'Пасивний дохід',
        },
        {
          'level': 3,
          'percentage': '2%',
          'title': '3-й рівень',
          'subtitle': 'Розширена мережа',
          'description': 'Додатковий дохід',
        },
      ],
      'howItWorks': [
        'Запросіть друзів за реферальним посиланням',
        'Отримуйте відсоток від їхніх підписок',
        'Заробляйте на 3 рівні вглиб',
        'Виводьте кошти зручним способом',
      ],
    },
    'stats': [
      {'value': '10,000+', 'label': 'активних користувачів'},
      {'value': '500,000+', 'label': 'транзакцій записано'},
      {'value': '85%', 'label': 'досягли фінансових цілей'},
    ],
    'footerLinks': [
      {
        'title': 'Користувацька угода',
        'type': 'terms',
        'contentKey': 'termsOfService',
      },
      {
        'title': 'Політика конфіденційності',
        'type': 'terms',
        'contentKey': 'privacyPolicy',
      },
    ],
  },
  'be': {
    'benefits': [
      {
        'title': 'Поўны кантроль фінансаў',
        'description':
            'Адсочвайце ўсе даходы і выдаткі ў адным месцы. Аналізуйце свае выдаткі і знаходзьце шляхі эканоміі.',
      },
      {
        'title': 'Дасягайце мэт хутчэй',
        'description':
            'Стварайце назапашванні на важныя пакупкі. Сачыце за прагрэсам і матывуйце сябе на фінансавы поспех.',
      },
      {
        'title': 'Кіруйце даўгамі і плацяжамі',
        'description':
            'Адсочвайце даўгі і крэдыты. Плануйце рэгулярныя плацяжы і зніжайце фінансавыя абавязкі.',
      },
    ],
    'detailedFeatures': [
      {
        'title': 'Даходы і выдаткі',
        'subtitle': 'Улік яшчэ ніколі не быў настолькі зручным!',
        'description':
            'Кантралюйце ўсе катэгорыі даходаў і выдаткаў. Бачце, дзе можна зэканоміць. Аналізуйце бюджэт з аднаго погляду. Стварайце ўласныя катэгорыі і падкатэгорыі. Экспартуйце даныя ў Excel.',
        'features': [
          'Катэгорыі з падкатэгорыямі',
          'Месячныя ліміты па катэгорыях',
          'Падрабязная статыстыка',
          'Экспарт у Excel',
        ],
      },
      {
        'title': 'Мультывалютныя рахункі',
        'subtitle': 'Кіруйце грашыма ў любой валюце',
        'description':
            'Стварайце неабмежаваную колькасць рахункаў у розных валютах. Рабіце пераклады паміж рахункамі з аўтаматычным пералікам курсу.',
        'features': [
          'Неабмежаваная колькасць рахункаў',
          'Падтрымка сусветных валют',
          'Аўтаматычны пералік курсу',
          'Пераклады паміж рахункамі',
        ],
      },
      {
        'title': 'Назапашванні',
        'subtitle': 'Дасягайце фінансавых мэт',
        'description':
            'Стварайце мэты назапашвання на пакупкі, падарожжы і навучанне. Адсочвайце прагрэс у працэнтах. Адкладайце грошы рэгулярна або разава. Хутчэй дасягайце мэт дзякуючы візуалізацыі прагрэсу.',
        'features': [
          'Візуалізацыя прагрэсу',
          'Некалькі мэт назапашвання',
          'Кантроль тэрмінаў',
          'Матывацыйныя напаміны',
        ],
      },
      {
        'title': 'Кіраванне даўгамі',
        'subtitle': 'Кантралюйце фінансавыя абавязкі',
        'description':
            'Два раздзелы: «Я павінен» і «Мне павінны». Дадавайце дэталі даўгу, тэрміны і сумы. Пазначайце частковыя пагашэнні. Атрымлівайце напаміны пра набліжэнне тэрмінаў.',
        'features': [
          'Асобны ўлік даўгоў',
          'Напаміны пра плацяжы',
          'Гісторыя пагашэнняў',
          'Працэнтныя разлікі',
        ],
      },
      {
        'title': 'Рэгулярныя плацяжы',
        'subtitle': 'Не прапускайце важныя плацяжы',
        'description':
            'Дадавайце падпіскі, камунальныя плацяжы і крэдыты. Наладжвайце частату: штодня, штотыдзень, штомесяц, штогод. Атрымлівайце напаміны перад датай плацяжу. Аўтаматычнае стварэнне транзакцый.',
        'features': [
          'Гнуткая налада перыядычнасці',
          'Разумныя напаміны',
          'Аўтаматычныя транзакцыі',
          'Гісторыя плацяжоў',
        ],
      },
      {
        'title': 'Спіс пакупак',
        'subtitle': 'Плануйце выдаткі загадзя',
        'description':
            'Стварайце спісы пакупак з цэнамі. Разлічвайце агульную суму перад паходам у краму. Пазначайце набытыя тавары. Кантралюйце спантанныя пакупкі.',
        'features': [
          'Некалькі спісаў пакупак',
          'Разлік агульнай сумы',
          'Катэгарызацыя тавараў',
          'Хуткае даданне',
        ],
      },
    ],
    'referralProgram': {
      'title': 'Зарабляйце з намі',
      'subtitle': '3-узроўневая рэферальная праграма',
      'levels': [
        {
          'level': 1,
          'percentage': '8%',
          'title': '1-ы ўзровень',
          'subtitle': 'Вашы прамыя рэфералы',
          'description': 'Даход ад падпіскі',
        },
        {
          'level': 2,
          'percentage': '4%',
          'title': '2-і ўзровень',
          'subtitle': 'Рэфералы вашых рэфералаў',
          'description': 'Пасіўны даход',
        },
        {
          'level': 3,
          'percentage': '2%',
          'title': '3-і ўзровень',
          'subtitle': 'Пашыраная сетка',
          'description': 'Дадатковы даход',
        },
      ],
      'howItWorks': [
        'Запрасіце сяброў па рэферальнай спасылцы',
        'Атрымлівайце працэнт ад іх падпісак',
        'Зарабляйце на 3 узроўнях углыб',
        'Выводзьце сродкі зручным спосабам',
      ],
    },
    'stats': [
      {'value': '10,000+', 'label': 'актыўных карыстальнікаў'},
      {'value': '500,000+', 'label': 'транзакцый запісана'},
      {'value': '85%', 'label': 'дасягнулі фінансавых мэт'},
    ],
    'footerLinks': [
      {
        'title': 'Карыстальніцкае пагадненне',
        'type': 'terms',
        'contentKey': 'termsOfService',
      },
      {
        'title': 'Палітыка прыватнасці',
        'type': 'terms',
        'contentKey': 'privacyPolicy',
      },
    ],
  },
  'ky': {
    'benefits': [
      {
        'title': 'Каржыны толук көзөмөлдөө',
        'description':
            'Бардык киреше жана чыгашаны бир жерде көзөмөлдөңүз. Чыгымдарды талдап, үнөмдөөнүн жолдорун табыңыз.',
      },
      {
        'title': 'Максатка тезирээк жетиңиз',
        'description':
            'Маанилүү сатып алуулар үчүн топтоңуз. Прогрессти көзөмөлдөп, мотивацияны сактаңыз.',
      },
      {
        'title': 'Карыздарды жана төлөмдөрдү башкарыңыз',
        'description':
            'Карыз жана кредиттерди көзөмөлдөңүз. Туруктуу төлөмдөрдү пландап, милдеттенмелерди азайтыңыз.',
      },
    ],
    'detailedFeatures': [
      {
        'title': 'Киреше жана чыгаша',
        'subtitle': 'Эсеп жүргүзүү мурдагыдан да ыңгайлуу!',
        'description':
            'Киреше/чыгашанын бардык категорияларын көзөмөлдөңүз. Кайсы жерде үнөмдөөгө болорун дароо көрүңүз. Дайындарды Excelге экспорттоңуз.',
        'features': [
          'Подкатегориялары бар категориялар',
          'Айлык лимиттер',
          'Толук статистика',
          'Excelге экспорт',
        ],
      },
      {
        'title': 'Көп валюталуу эсептер',
        'subtitle': 'Каалаган валютада акча башкарыңыз',
        'description':
            'Ар кандай валютада чексиз эсеп түзүңүз. Эсептер ортосунда автоматтык курс менен которуңуз.',
        'features': [
          'Чексиз эсептер',
          'Дүйнөлүк валюталарды колдоо',
          'Авто курс которуу',
          'Эсептер аралык которуу',
        ],
      },
      {
        'title': 'Топтомдор',
        'subtitle': 'Каржылык максаттарга жетиңиз',
        'description':
            'Сатып алууларга, саякатка жана окууга топтоо максаттарын түзүңүз. Прогрессти пайыз менен көзөмөлдөңүз. Акчаны үзгүлтүксүз же бир жолку түрдө бөлүңүз. Визуалдуу прогресс менен максатка тезирээк жетиңиз.',
        'features': [
          'Прогрессти визуалдаштыруу',
          'Бир нече топтоо максаты',
          'Мөөнөттөрдү көзөмөлдөө',
          'Мотивациялык эскертмелер',
        ],
      },
      {
        'title': 'Карыздарды башкаруу',
        'subtitle': 'Каржылык милдеттенмелерди көзөмөлдөңүз',
        'description':
            'Эки бөлүм: «Мен карызмын» жана «Мага карыз». Карыздын суммасын, мөөнөтүн жана деталдарын кошуңуз. Жарым-жартылай төлөмдөрдү белгилеңиз. Мөөнөт жакындаганда эскертме алыңыз.',
        'features': [
          'Карыздарды өзүнчө эсепке алуу',
          'Төлөм эскертмелери',
          'Төлөө тарыхы',
          'Пайыздык эсептөөлөр',
        ],
      },
      {
        'title': 'Туруктуу төлөмдөр',
        'subtitle': 'Маанилүү төлөмдөрдү өткөрүп жибербеңиз',
        'description':
            'Жазылууларды, коммуналдык төлөмдөрдү жана кредиттерди кошуңуз. Жыштыгын тууралаңыз: күн сайын, жума сайын, ай сайын, жыл сайын. Төлөм күнүнө чейин эскертме алыңыз. Транзакциялар автоматтык түзүлөт.',
        'features': [
          'Жыштыктын ийкемдүү жөндөөлөрү',
          'Акылдуу эскертмелер',
          'Автоматтык транзакциялар',
          'Төлөм тарыхы',
        ],
      },
      {
        'title': 'Сатып алуу тизмеси',
        'subtitle': 'Чыгымдарды алдын ала пландаңыз',
        'description':
            'Баалары менен сатып алуу тизмелерин түзүңүз. Дүкөнгө барардан мурун жалпы сумманы эсептеңиз. Сатып алынган товарларды белгилеңиз. Спонтандык сатып алууларды көзөмөлдөңүз.',
        'features': [
          'Бир нече сатып алуу тизмеси',
          'Жалпы сумманы эсептөө',
          'Товарларды категориялоо',
          'Тез кошуу',
        ],
      },
    ],
    'referralProgram': {
      'title': 'Биз менен табыңыз',
      'subtitle': '3 деңгээлдүү рефералдык программа',
      'levels': [
        {
          'level': 1,
          'percentage': '8%',
          'title': '1-деңгээл',
          'subtitle': 'Түз рефералдарыңыз',
          'description': 'Жазылуудан киреше',
        },
        {
          'level': 2,
          'percentage': '4%',
          'title': '2-деңгээл',
          'subtitle': 'Рефералдарыңыздын рефералдары',
          'description': 'Пассивдүү киреше',
        },
        {
          'level': 3,
          'percentage': '2%',
          'title': '3-деңгээл',
          'subtitle': 'Кеңейген тармак',
          'description': 'Кошумча киреше',
        },
      ],
      'howItWorks': [
        'Досторду реферал шилтеме менен чакырыңыз',
        'Алардын жазылууларынан пайыз алыңыз',
        '3 деңгээл тереңдикке чейин табыңыз',
        'Каражатты ыңгайлуу жол менен чыгарыңыз',
      ],
    },
    'stats': [
      {'value': '10,000+', 'label': 'активдүү колдонуучу'},
      {'value': '500,000+', 'label': 'жазылган транзакция'},
      {'value': '85%', 'label': 'каржылык максатка жетти'},
    ],
    'footerLinks': [
      {
        'title': 'Колдонуучу келишими',
        'type': 'terms',
        'contentKey': 'termsOfService',
      },
      {
        'title': 'Купуялуулук саясаты',
        'type': 'terms',
        'contentKey': 'privacyPolicy',
      },
    ],
  },
  'uz': {
    'benefits': [
      {
        'title': 'To‘liq moliyaviy nazorat',
        'description':
            'Barcha daromad va xarajatlarni bir joyda kuzating. Xarajatlaringizni tahlil qilib, tejash yo‘llarini toping.',
      },
      {
        'title': 'Maqsadga tezroq erishing',
        'description':
            'Muhim xaridlar uchun jamg‘arma yarating. Taraqqiyotni kuzatib, moliyaviy muvaffaqiyatga erishing.',
      },
      {
        'title': 'Qarzlar va to‘lovlarni boshqaring',
        'description':
            'Qarz va kreditlarni kuzating. Muntazam to‘lovlarni rejalashtirib, majburiyatlarni kamaytiring.',
      },
    ],
    'detailedFeatures': [
      {
        'title': 'Daromad va xarajatlar',
        'subtitle': 'Hisob yuritish endi juda qulay!',
        'description':
            'Daromad/xarajat kategoriyalarini nazorat qiling, byudjetni bir qarashda tahlil qiling, ma’lumotlarni Excelga eksport qiling.',
        'features': [
          'Subkategoriyali kategoriyalar',
          'Oylik limitlar',
          'Batafsil statistika',
          'Excelga eksport',
        ],
      },
      {
        'title': 'Ko‘p valyutali hisoblar',
        'subtitle': 'Har qanday valyutada boshqaring',
        'description':
            'Turli valyutada cheksiz hisob yarating va avtomatik kurs bo‘yicha o‘tkazing.',
        'features': [
          'Cheksiz hisoblar',
          'Dunyo valyutalari qo‘llovi',
          'Avtomatik kurs hisoblash',
          'Hisoblararo o‘tkazma',
        ],
      },
      {
        'title': 'Jamg‘armalar',
        'subtitle': 'Moliyaviy maqsadlarga erishing',
        'description':
            'Xaridlar, sayohat va ta’lim uchun jamg‘arma maqsadlarini yarating. Progressni foizlarda kuzating. Muntazam yoki bir martalik jamg‘aring. Vizual progress yordamida maqsadlarga tezroq erishing.',
        'features': [
          'Progress vizualizatsiyasi',
          'Bir nechta jamg‘arma maqsadi',
          'Muddatlarni kuzatish',
          'Motivatsion eslatmalar',
        ],
      },
      {
        'title': 'Qarzlarni boshqarish',
        'subtitle': 'Moliyaviy majburiyatlarni nazorat qiling',
        'description':
            'Ikki bo‘lim: «Men qarzdorman» va «Menga qarzdor». Qarzdorlik tafsilotlari, muddatlar va summalarni qo‘shing. Qisman to‘lovlarni belgilang. Muddat yaqinlashganda eslatmalar oling.',
        'features': [
          'Qarzlarni alohida hisobga olish',
          'To‘lov eslatmalari',
          'Qoplash tarixi',
          'Foiz hisob-kitoblari',
        ],
      },
      {
        'title': 'Muntazam to‘lovlar',
        'subtitle': 'Muhim to‘lovlarni o‘tkazib yubormang',
        'description':
            'Obunalar, kommunal to‘lovlar va kreditlarni qo‘shing. Davriylikni sozlang: har kuni, har hafta, har oy, har yil. To‘lov sanasidan oldin eslatma oling. Tranzaksiyalar avtomatik yaratiladi.',
        'features': [
          'Moslashuvchan davriylik sozlamalari',
          'Aqlli eslatmalar',
          'Avtomatik tranzaksiyalar',
          'To‘lovlar tarixi',
        ],
      },
      {
        'title': 'Xaridlar ro‘yxati',
        'subtitle': 'Xarajatlarni oldindan rejalashtiring',
        'description':
            'Narxlar bilan xarid ro‘yxatlarini yarating. Do‘konga borishdan oldin umumiy summani hisoblang. Xarid qilingan mahsulotlarni belgilang. Spontan xaridlarni nazorat qiling.',
        'features': [
          'Bir nechta xarid ro‘yxati',
          'Umumiy summani hisoblash',
          'Mahsulotlarni kategoriyalash',
          'Tez qo‘shish',
        ],
      },
    ],
    'referralProgram': {
      'title': 'Biz bilan daromad qiling',
      'subtitle': '3-darajali referal dastur',
      'levels': [
        {
          'level': 1,
          'percentage': '8%',
          'title': '1-daraja',
          'subtitle': 'To‘g‘ridan-to‘g‘ri referallar',
          'description': 'Obunadan daromad',
        },
        {
          'level': 2,
          'percentage': '4%',
          'title': '2-daraja',
          'subtitle': 'Referallaringiz referallari',
          'description': 'Passiv daromad',
        },
        {
          'level': 3,
          'percentage': '2%',
          'title': '3-daraja',
          'subtitle': 'Kengaytirilgan tarmoq',
          'description': 'Qo‘shimcha daromad',
        },
      ],
      'howItWorks': [
        'Do‘stlaringizni referal havola bilan taklif qiling',
        'Ularning obunasidan foiz oling',
        '3 daraja chuqurlikkacha daromad qiling',
        'Mablag‘ni qulay usulda yeching',
      ],
    },
    'stats': [
      {'value': '10,000+', 'label': 'faol foydalanuvchi'},
      {'value': '500,000+', 'label': 'yozilgan tranzaksiya'},
      {'value': '85%', 'label': 'moliyaviy maqsadga erishdi'},
    ],
    'footerLinks': [
      {
        'title': 'Foydalanuvchi kelishuvi',
        'type': 'terms',
        'contentKey': 'termsOfService',
      },
      {
        'title': 'Maxfiylik siyosati',
        'type': 'terms',
        'contentKey': 'privacyPolicy',
      },
    ],
  },
  'tg': {
    'benefits': [
      {
        'title': 'Назорати пурраи молия',
        'description':
            'Ҳамаи даромад ва хароҷотро дар як ҷо идора кунед. Хароҷотро таҳлил карда, роҳҳои сарфаҷӯиро ёбед.',
      },
      {
        'title': 'Ба ҳадаф зудтар расед',
        'description':
            'Барои харидҳои муҳим пасандоз созед ва пешрафтро пайгирӣ намоед.',
      },
      {
        'title': 'Қарз ва пардохтҳоро идора кунед',
        'description':
            'Қарз ва кредитҳоро пайгирӣ намоед, пардохтҳои давриро банақшагирӣ кунед.',
      },
    ],
    'detailedFeatures': [
      {
        'title': 'Даромад ва хароҷот',
        'subtitle': 'Баҳисобгирӣ ҳоло хеле қулай аст!',
        'description':
            'Категорияҳои даромад ва хароҷотро идора кунед, буҷаро зуд таҳлил намоед ва маълумотро ба Excel содир кунед.',
        'features': [
          'Категорияҳо бо зеркатегория',
          'Лимитҳои моҳона',
          'Омори муфассал',
          'Содирот ба Excel',
        ],
      },
      {
        'title': 'Ҳисобҳои бисёрқурбӣ',
        'subtitle': 'Пулро дар ҳар гуна асъор идора кунед',
        'description':
            'Ҳисобҳои бемаҳдуд дар асъорҳои гуногун созед ва байни онҳо бо қурби худкор интиқол диҳед.',
        'features': [
          'Ҳисобҳои бемаҳдуд',
          'Дастгирии асъорҳои ҷаҳон',
          'Ҳисоби худкори қурб',
          'Интиқол байни ҳисобҳо',
        ],
      },
      {
        'title': 'Пасандозҳо',
        'subtitle': 'Ба ҳадафҳои молиявӣ бирасед',
        'description':
            'Барои харидҳо, сафар ва таҳсил ҳадафҳои пасандоз созед. Пешрафтро бо фоиз пайгирӣ кунед. Маблағро мунтазам ё якбора гузоред. Бо визуализатсияи пешрафт ба ҳадаф зудтар расед.',
        'features': [
          'Визуализатсияи пешрафт',
          'Чанд ҳадафи пасандоз',
          'Назорати муҳлатҳо',
          'Ёдраскуниҳои ҳавасмандкунанда',
        ],
      },
      {
        'title': 'Идоракунии қарз',
        'subtitle': 'Уҳдадориҳои молиявиро назорат кунед',
        'description':
            'Ду бахш: «Ман қарздор» ва «Ба ман қарздоранд». Тафсилот, муҳлат ва маблағи қарзро илова кунед. Пардохтҳои қисмиро қайд намоед. Пеш аз анҷоми муҳлат ёдрас гиред.',
        'features': [
          'Баҳисобгирии ҷудогонаи қарзҳо',
          'Ёдраскуниҳои пардохт',
          'Таърихи пардохт',
          'Ҳисобҳои фоизӣ',
        ],
      },
      {
        'title': 'Пардохтҳои мунтазам',
        'subtitle': 'Пардохтҳои муҳимро аз даст надиҳед',
        'description':
            'Обунаҳо, пардохтҳои коммуналӣ ва кредитҳоро илова кунед. Давриятро танзим кунед: ҳар рӯз, ҳар ҳафта, ҳар моҳ, ҳар сол. Пеш аз санаи пардохт ёдрас гиред. Транзаксияҳо худкор сохта мешаванд.',
        'features': [
          'Танзими чандири даврият',
          'Ёдраскуниҳои ҳушманд',
          'Транзаксияҳои худкор',
          'Таърихи пардохтҳо',
        ],
      },
      {
        'title': 'Рӯйхати харид',
        'subtitle': 'Хароҷотро пешакӣ банақшагирӣ кунед',
        'description':
            'Рӯйхати харидро бо нархҳо созед. Пеш аз рафтан ба мағоза маблағи умумиро ҳисоб кунед. Маҳсулоти харидашударо қайд кунед. Харидҳои ногаҳониро назорат кунед.',
        'features': [
          'Чанд рӯйхати харид',
          'Ҳисоби маблағи умумӣ',
          'Категориябандии молҳо',
          'Иловаи зуд',
        ],
      },
    ],
    'referralProgram': {
      'title': 'Бо мо даромад гиред',
      'subtitle': 'Барномаи рефералии 3-сатҳа',
      'levels': [
        {
          'level': 1,
          'percentage': '8%',
          'title': 'Сатҳи 1',
          'subtitle': 'Рефералҳои мустақими шумо',
          'description': 'Даромад аз обуна',
        },
        {
          'level': 2,
          'percentage': '4%',
          'title': 'Сатҳи 2',
          'subtitle': 'Рефералҳои рефералҳои шумо',
          'description': 'Даромади пассив',
        },
        {
          'level': 3,
          'percentage': '2%',
          'title': 'Сатҳи 3',
          'subtitle': 'Шабакаи васеъшуда',
          'description': 'Даромади иловагӣ',
        },
      ],
      'howItWorks': [
        'Дӯстонро бо пайванди рефералӣ даъват кунед',
        'Аз обунаи онҳо фоиз гиред',
        'То 3 сатҳ даромад гиред',
        'Маблағро бо роҳи қулай бароред',
      ],
    },
    'stats': [
      {'value': '10,000+', 'label': 'корбари фаъол'},
      {'value': '500,000+', 'label': 'транзаксия сабт шуд'},
      {'value': '85%', 'label': 'ба ҳадафи молиявӣ расиданд'},
    ],
    'footerLinks': [
      {
        'title': 'Созишномаи корбар',
        'type': 'terms',
        'contentKey': 'termsOfService',
      },
      {
        'title': 'Сиёсати махфият',
        'type': 'terms',
        'contentKey': 'privacyPolicy',
      },
    ],
  },
  'hy': {
    'benefits': [
      {
        'title': 'Ֆինանսների ամբողջական վերահսկում',
        'description':
            'Հետևեք բոլոր եկամուտներին և ծախսերին մեկ տեղում։ Վերլուծեք ձեր ծախսերը և գտեք խնայողության ուղիներ։',
      },
      {
        'title': 'Արագ հասեք նպատակներին',
        'description':
            'Ստեղծեք խնայողություններ կարևոր գնումների համար և հետևեք առաջընթացին։',
      },
      {
        'title': 'Կառավարեք պարտքերն ու վճարումները',
        'description':
            'Հետևեք պարտքերին և վարկերին, պլանավորեք պարբերական վճարումները։',
      },
    ],
    'detailedFeatures': [
      {
        'title': 'Եկամուտներ և ծախսեր',
        'subtitle': 'Հաշվառում անելն այժմ ավելի հեշտ է!',
        'description':
            'Վերահսկեք եկամուտների և ծախսերի բոլոր կատեգորիաները, վերլուծեք բյուջեն և արտահանեք տվյալները Excel։',
        'features': [
          'Կատեգորիաներ ենթակատեգորիաներով',
          'Ամսական սահմանաչափեր',
          'Մանրամասն վիճակագրություն',
          'Excel արտահանում',
        ],
      },
      {
        'title': 'Բազմարժույթ հաշիվներ',
        'subtitle': 'Կառավարեք գումարը ցանկացած արժույթով',
        'description':
            'Ստեղծեք անսահմանափակ հաշիվներ տարբեր արժույթներով և փոխանցումներ կատարեք ավտոմատ փոխարժեքով։',
        'features': [
          'Անսահմանափակ հաշիվներ',
          'Աշխարհի արժույթների աջակցում',
          'Փոխարժեքի ավտոմատ հաշվարկ',
          'Փոխանցումներ հաշիվների միջև',
        ],
      },
      {
        'title': 'Խնայողություններ',
        'subtitle': 'Հասեք ֆինանսական նպատակներին',
        'description':
            'Ստեղծեք խնայողության նպատակներ գնումների, ճանապարհորդության և ուսման համար։ Հետևեք առաջընթացին տոկոսներով։ Գումար խնայեք պարբերաբար կամ մեկանգամյա։ Առաջընթացի տեսանելիությամբ ավելի արագ հասեք նպատակներին։',
        'features': [
          'Առաջընթացի վիզուալացում',
          'Խնայողության մի քանի նպատակ',
          'Ժամկետների վերահսկում',
          'Մոտիվացնող հիշեցումներ',
        ],
      },
      {
        'title': 'Պարտքերի կառավարում',
        'subtitle': 'Վերահսկեք ֆինանսական պարտավորությունները',
        'description':
            'Երկու բաժին՝ «Ես պարտք եմ» և «Ինձ պարտք են»։ Ավելացրեք պարտքի մանրամասները, ժամկետներն ու գումարները։ Նշեք մասնակի մարումները։ Ստացեք հիշեցումներ ժամկետների մոտենալուն։',
        'features': [
          'Պարտքերի առանձին հաշվառում',
          'Վճարման հիշեցումներ',
          'Մարումների պատմություն',
          'Տոկոսային հաշվարկներ',
        ],
      },
      {
        'title': 'Պարբերական վճարումներ',
        'subtitle': 'Մի՛ բաց թողեք կարևոր վճարումները',
        'description':
            'Ավելացրեք բաժանորդագրություններ, կոմունալ վճարումներ և վարկեր։ Կարգավորեք պարբերականությունը՝ ամեն օր, շաբաթական, ամսական, տարեկան։ Վճարման ամսաթվից առաջ ստացեք հիշեցումներ։ Գործարքները ստեղծվում են ավտոմատ։',
        'features': [
          'Պարբերականության ճկուն կարգավորումներ',
          'Խելացի հիշեցումներ',
          'Ավտոմատ գործարքներ',
          'Վճարումների պատմություն',
        ],
      },
      {
        'title': 'Գնումների ցանկ',
        'subtitle': 'Պլանավորեք ծախսերը նախապես',
        'description':
            'Ստեղծեք գնումների ցանկեր գներով։ Մինչ խանութ գնալը հաշվարկեք ընդհանուր գումարը։ Նշեք գնված ապրանքները։ Վերահսկեք ինքնաբուխ գնումները։',
        'features': [
          'Գնումների մի քանի ցանկ',
          'Ընդհանուր գումարի հաշվարկ',
          'Ապրանքների դասակարգում',
          'Արագ ավելացում',
        ],
      },
    ],
    'referralProgram': {
      'title': 'Վաստակեք մեզ հետ',
      'subtitle': '3-աստիճան ռեֆերալ ծրագիր',
      'levels': [
        {
          'level': 1,
          'percentage': '8%',
          'title': '1-ին մակարդակ',
          'subtitle': 'Ձեր ուղիղ ռեֆերալները',
          'description': 'Բաժանորդագրությունից եկամուտ',
        },
        {
          'level': 2,
          'percentage': '4%',
          'title': '2-րդ մակարդակ',
          'subtitle': 'Ձեր ռեֆերալների ռեֆերալները',
          'description': 'Պասիվ եկամուտ',
        },
        {
          'level': 3,
          'percentage': '2%',
          'title': '3-րդ մակարդակ',
          'subtitle': 'Ընդլայնված ցանց',
          'description': 'Լրացուցիչ եկամուտ',
        },
      ],
      'howItWorks': [
        'Հրավիրեք ընկերներին ռեֆերալ հղումով',
        'Ստացեք տոկոս նրանց բաժանորդագրություններից',
        'Վաստակեք մինչև 3 մակարդակ խորությամբ',
        'Հանեք միջոցները հարմար եղանակով',
      ],
    },
    'stats': [
      {'value': '10,000+', 'label': 'ակտիվ օգտատեր'},
      {'value': '500,000+', 'label': 'գրանցված գործարք'},
      {'value': '85%', 'label': 'հասել են ֆինանսական նպատակների'},
    ],
    'footerLinks': [
      {
        'title': 'Օգտատիրոջ համաձայնագիր',
        'type': 'terms',
        'contentKey': 'termsOfService',
      },
      {
        'title': 'Գաղտնիության քաղաքականություն',
        'type': 'terms',
        'contentKey': 'privacyPolicy',
      },
    ],
  },
  'ro': {
    'benefits': [
      {
        'title': 'Control financiar complet',
        'description':
            'Urmărește toate veniturile și cheltuielile într-un singur loc. Analizează cheltuielile și găsește modalități de economisire.',
      },
      {
        'title': 'Atinge obiectivele mai rapid',
        'description':
            'Creează economii pentru achiziții importante și urmărește progresul.',
      },
      {
        'title': 'Gestionează datorii și plăți',
        'description':
            'Urmărește datoriile și creditele. Planifică plăți recurente și redu obligațiile financiare.',
      },
    ],
    'detailedFeatures': [
      {
        'title': 'Venituri și cheltuieli',
        'subtitle': 'Evidența nu a fost niciodată atât de simplă!',
        'description':
            'Controlează categoriile de venituri și cheltuieli, analizează bugetul dintr-o privire și exportă datele în Excel.',
        'features': [
          'Categorii cu subcategorii',
          'Limite lunare pe categorii',
          'Statistici detaliate',
          'Export în Excel',
        ],
      },
      {
        'title': 'Conturi multivalutare',
        'subtitle': 'Gestionează banii în orice valută',
        'description':
            'Creează conturi nelimitate în valute diferite și transferă între conturi cu conversie automată.',
        'features': [
          'Număr nelimitat de conturi',
          'Suport pentru valute globale',
          'Conversie automată a cursului',
          'Transferuri între conturi',
        ],
      },
      {
        'title': 'Economii',
        'subtitle': 'Atinge obiectivele financiare',
        'description':
            'Creează obiective de economisire pentru cumpărături, călătorii și educație. Urmărește progresul în procente. Economisește regulat sau ocazional. Atinge obiectivele mai repede cu vizualizarea progresului.',
        'features': [
          'Vizualizarea progresului',
          'Obiective multiple de economisire',
          'Urmărirea termenelor',
          'Memento-uri motivaționale',
        ],
      },
      {
        'title': 'Gestionarea datoriilor',
        'subtitle': 'Controlează obligațiile financiare',
        'description':
            'Două secțiuni: «Eu datorez» și «Mi se datorează». Adaugă detalii despre datorie, termene și sume. Marchează rambursările parțiale. Primește memento-uri înainte de scadență.',
        'features': [
          'Evidență separată a datoriilor',
          'Memento-uri de plată',
          'Istoric rambursări',
          'Calcule de dobândă',
        ],
      },
      {
        'title': 'Plăți recurente',
        'subtitle': 'Nu rata niciodată plățile importante',
        'description':
            'Adaugă abonamente, utilități și credite. Setează frecvența: zilnic, săptămânal, lunar, anual. Primește memento-uri înainte de data plății. Tranzacțiile sunt create automat.',
        'features': [
          'Setări flexibile de recurență',
          'Memento-uri inteligente',
          'Tranzacții automate',
          'Istoric plăți',
        ],
      },
      {
        'title': 'Listă de cumpărături',
        'subtitle': 'Planifică cheltuielile din timp',
        'description':
            'Creează liste de cumpărături cu prețuri. Calculează suma totală înainte de mersul la magazin. Marchează produsele cumpărate. Controlează cumpărăturile impulsive.',
        'features': [
          'Mai multe liste de cumpărături',
          'Calculul sumei totale',
          'Categorisirea produselor',
          'Adăugare rapidă',
        ],
      },
    ],
    'referralProgram': {
      'title': 'Câștigă cu noi',
      'subtitle': 'Program de recomandare pe 3 niveluri',
      'levels': [
        {
          'level': 1,
          'percentage': '8%',
          'title': 'Nivelul 1',
          'subtitle': 'Recomandările tale directe',
          'description': 'Venit din abonament',
        },
        {
          'level': 2,
          'percentage': '4%',
          'title': 'Nivelul 2',
          'subtitle': 'Recomandările recomandărilor tale',
          'description': 'Venit pasiv',
        },
        {
          'level': 3,
          'percentage': '2%',
          'title': 'Nivelul 3',
          'subtitle': 'Rețea extinsă',
          'description': 'Venit suplimentar',
        },
      ],
      'howItWorks': [
        'Invită prieteni prin linkul tău de recomandare',
        'Primește procent din abonamentele lor',
        'Câștigă pe 3 niveluri în profunzime',
        'Retrage fondurile într-un mod convenabil',
      ],
    },
    'stats': [
      {'value': '10,000+', 'label': 'utilizatori activi'},
      {'value': '500,000+', 'label': 'tranzacții înregistrate'},
      {'value': '85%', 'label': 'au atins obiective financiare'},
    ],
    'footerLinks': [
      {
        'title': 'Termeni de utilizare',
        'type': 'terms',
        'contentKey': 'termsOfService',
      },
      {
        'title': 'Politica de confidențialitate',
        'type': 'terms',
        'contentKey': 'privacyPolicy',
      },
    ],
  },
};
