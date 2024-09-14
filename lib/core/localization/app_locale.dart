enum AppLocale {
  english('en', 'English', '🇺🇸'),
  arabic('ar', 'العربية', '🇪🇬');

  const AppLocale(this.code, this.name, this.flag);

  final String code;
  final String name;
  final String flag;
}
