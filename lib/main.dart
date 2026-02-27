import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'core/theme/app_theme.dart';
import 'core/localization/app_localizations.dart';
import 'features/landing/presentation/pages/landing_page.dart';

/// Wraps [GlobalMaterialLocalizations.delegate] and falls back to Russian
/// for locales not supported by the package (e.g. tg, hy, be, ky).
class _FallbackMaterialLocalizationsDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  static const _delegate = GlobalMaterialLocalizations.delegate;

  const _FallbackMaterialLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => true;

  @override
  Future<MaterialLocalizations> load(Locale locale) {
    final supported = _delegate.isSupported(locale);
    return supported
        ? _delegate.load(locale)
        : _delegate.load(const Locale('ru'));
  }

  @override
  bool shouldReload(_FallbackMaterialLocalizationsDelegate old) => false;
}

/// Wraps [GlobalCupertinoLocalizations.delegate] and falls back to Russian
/// for locales not supported by the package (e.g. tg, hy, be, ky).
class _FallbackCupertinoLocalizationsDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  static const _delegate = GlobalCupertinoLocalizations.delegate;

  const _FallbackCupertinoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => true;

  @override
  Future<CupertinoLocalizations> load(Locale locale) {
    final supported = _delegate.isSupported(locale);
    return supported
        ? _delegate.load(locale)
        : _delegate.load(const Locale('ru'));
  }

  @override
  bool shouldReload(_FallbackCupertinoLocalizationsDelegate old) => false;
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('ru');

  void _changeLocale(Locale locale) {
    if (_locale.languageCode != locale.languageCode) {
      setState(() {
        _locale = locale;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: _locale,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        _FallbackMaterialLocalizationsDelegate(),
        GlobalWidgetsLocalizations.delegate,
        _FallbackCupertinoLocalizationsDelegate(),
      ],
      onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 600, name: MOBILE),
          const Breakpoint(start: 601, end: 900, name: TABLET),
          const Breakpoint(start: 901, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
      home: LandingPage(currentLocale: _locale, onLocaleChanged: _changeLocale),
    );
  }
}
