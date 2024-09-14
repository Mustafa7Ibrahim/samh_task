import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'app_locale.dart';

part 'manage_locale_provider.g.dart';

@Riverpod(keepAlive: true)
class ManageAppLocale extends _$ManageAppLocale {
  @override
  AppLocale build() {
    return AppLocale.arabic;
  }

  void toggleLanguage(bool isArabic) {
    if (isArabic) {
      state = AppLocale.arabic;
    } else {
      state = AppLocale.english;
    }
  }
}
