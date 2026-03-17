# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

```bash
# Install dependencies
flutter pub get

# Run the app (web is primary target)
flutter run -d chrome

# Build for web
flutter build web

# Build for other platforms
flutter build apk     # Android
flutter build ios     # iOS

# Generate code (auto_route, etc.)
dart run build_runner build --delete-conflicting-outputs

# Analyze
flutter analyze

# Run tests
flutter test

# Run a single test file
flutter test test/path/to/test_file.dart
```

## Architecture

This is a **Flutter landing page** for the Rabay personal finance app. It targets web primarily, but supports all platforms.

### Layer structure (Clean Architecture)

```
lib/
  main.dart                          # App entry point, locale setup
  core/
    constants/
      app_constants.dart             # All static content (URLs, copy text, feature lists)
      terms.dart                     # Legal document content
    localization/
      app_localizations.dart         # Custom localization (no ARB files — strings hardcoded inline)
      locale_scope.dart              # InheritedNotifier for locale propagation
    navigation/
      app_router.dart                # Manual auto_route setup (no code gen)
    theme/
      app_theme.dart                 # AppTheme with color constants, Google Fonts (Inter)
    utils/
      url_helper.dart                # url_launcher wrapper
      web_html_opener.dart           # Conditional export stub
      web_html_opener_stub.dart      # Non-web stub
      web_html_opener_web.dart       # Web impl (dart:html, opens blob in new tab)
  features/landing/
    data/models/                     # ScreenshotModel
    domain/entities/                 # Screenshot entity
    presentation/
      bloc/                          # LandingBloc (screenshots, URL launching)
      pages/                         # LandingPage, LegalDocumentsPage, ReferralDetailsPage
      widgets/
        common/                      # Reusable widgets (AppButton, GradientButton, FeatureCard, SectionTitle)
        sections/                    # One widget per landing section
```

### Key architectural decisions

- **No code generation for routes**: `AppRouter` is hand-written using `RootStackRouter.build()` with `NamedRouteDef`. There is no `.gr.dart` generated file — do not run route generation expecting auto_route's generator.
- **Localization is inline**: `AppLocalizations` stores all translated strings as `Map<String, Map<String, dynamic>>` directly in the file — no ARB files or external JSON. To add a translation key, add it to `_localizedValues` and `_localizedData` maps and expose a getter.
- **Supported locales**: ru (default), en, kk, uk, be, ky, uz, tg, hy, ro. Unsupported Material/Cupertino locales fall back to `ru` via delegate wrappers in `main.dart`.
- **Locale state**: `ValueNotifier<Locale>` in `MyApp` flows down via `LocaleScope` (InheritedNotifier). Widgets read locale with `LocaleScope.currentLocaleOf(context)` and trigger changes with `LocaleScope.onLocaleChangedOf(context)`.
- **Responsive breakpoints**: MOBILE (0–600), TABLET (601–900), DESKTOP (901–1920), 4K (1921+). Use `ResponsiveBreakpoints.of(context)` to branch layout.
- **All static content** (copy, feature lists, referral info, store URLs, social links) lives in `AppConstants`. The `LandingBloc` is mostly legacy; sections read `AppLocalizations` directly.
- **Legal documents** are stored in `lib/core/constants/terms.dart` and opened as HTML blobs in the browser via `web_html_opener_web.dart`.

### Landing page sections (top → bottom)

`HeaderSection` (sticky overlay) → `HeroSection` → `BenefitsSection` → `FeaturesSection` → `ReferralSection` → `CtaSection` → `AboutSection` → `FooterSection`

Navigation scrolls via `GlobalKey` + `Scrollable.ensureVisible`.

### Theme

Primary color: `#038AA6`. Font: Inter (Google Fonts). Only a light theme exists (`AppTheme.lightTheme`).
