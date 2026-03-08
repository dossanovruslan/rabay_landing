import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class LocaleScope extends InheritedNotifier<ValueListenable<Locale>> {
  final ValueChanged<Locale> onLocaleChanged;

  const LocaleScope({
    super.key,
    required ValueListenable<Locale> localeListenable,
    required this.onLocaleChanged,
    required super.child,
  }) : super(notifier: localeListenable);

  static LocaleScope of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<LocaleScope>();
    assert(scope != null, 'LocaleScope is not found in widget tree');
    return scope!;
  }

  static Locale currentLocaleOf(BuildContext context) {
    return of(context).notifier!.value;
  }

  static ValueChanged<Locale> onLocaleChangedOf(BuildContext context) {
    return of(context).onLocaleChanged;
  }
}
