import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../app/modules/app/ui/app.dart';
import 'strings_resources/language_factory.dart';
import 'values/constants.dart';

class AppSettings {
  late AppLanguage _appLanguage;

  AppSettings.fromSharedPreferences(SharedPreferences sharedPreferences) {
    _appLanguage = LanguageFactory()
        .lang(sharedPreferences.getString(SPKeys.keyAppLanguage) ?? 'en');
  }

  setAppLanguage(AppLanguage appLanguage, BuildContext context) {
    _appLanguage = appLanguage;
    AppWatcher.of(context).changeLanguage(appLanguage);
  }

  AppLanguage get appLanguage => _appLanguage;
}
