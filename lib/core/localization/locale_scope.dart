import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class LocaleScope extends InheritedWidget {
  final ValueListenable<Locale> localeListenable;
  final ValueChanged<Locale> onLocaleChanged;

  const LocaleScope({
    super.key,
    required this.localeListenable,
    required this.onLocaleChanged,
    required super.child,
  });

  static LocaleScope of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<LocaleScope>();
    assert(scope != null, 'LocaleScope is not found in widget tree');
    return scope!;
  }

  static Locale currentLocaleOf(BuildContext context) {
    return of(context).localeListenable.value;
  }

  static ValueChanged<Locale> onLocaleChangedOf(BuildContext context) {
    return of(context).onLocaleChanged;
  }

  @override
  bool updateShouldNotify(covariant LocaleScope oldWidget) {
    return localeListenable != oldWidget.localeListenable ||
        onLocaleChanged != oldWidget.onLocaleChanged;
  }
}
