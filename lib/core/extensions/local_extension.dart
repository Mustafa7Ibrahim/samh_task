import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:samh_task/core/localization/app_locale.dart';

extension LocalExtension on BuildContext {
  AppLocalizations get tr => AppLocalizations.of(this)!;
  bool get isRTL =>
      Localizations.localeOf(this).languageCode == AppLocale.arabic.code;
}
