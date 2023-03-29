import 'package:sde_007/utils/strings_resources/strings_en.dart';
import 'package:sde_007/utils/strings_resources/strings_resource.dart';

enum AppLanguage {
  english,
}

extension AppLanguageExtension on AppLanguage {
  String get languageCode {
    switch (this) {
      case AppLanguage.english:
        return 'en';
      default:
        return 'en';
    }
  }

  String get languageName {
    switch (this) {
      case AppLanguage.english:
        return 'English';
        break;
      default:
        return 'English';
    }
  }
}

class LanguageFactory {
  StringResource provideStringResource(String languageCode) {
    switch (languageCode) {
      case 'en':
        return StringsEnglish();
        break;
      default:
        return StringsEnglish();
        break;
    }
  }

  AppLanguage lang(String languageCode) {
    switch (languageCode) {
      case 'en':
        return AppLanguage.english;
        break;
      default:
        return AppLanguage.english;
        break;
    }
  }
}
