import 'ar_translations.dart';
import 'en_translations.dart';

abstract class AppTranslation {
  static Map<String, Map<String, String>> translations = {
    'ar': ar,
    'en': en,
  };
}

abstract class LocaleKeys {
  /// Exceptions Messages ======================================================
  static const networkFailure = "networkFailure";
  static const unVerifiedFailure = "unVerifiedFailure";
  static const serverFailure = 'serverFailure';
  static const unAuthMessage = 'unAuthMessage';
  static const emptyCacheMessage = 'emptyCacheMessage';
  static const unExpectedError = 'unExpectedError';
  static const forgotYourPassword = 'unExpectedError';
  static const invalidFailure = 'invalidFailure';

  

  /// ============================================================

  static const enterValidEmail = 'enterValidEmail';
  static const enterPhoneNumber = 'enterPhoneNumber';
  static const emptyPassword = 'emptyPassword';
  static const emptyFiled = 'emptyFiled';

  static const validCardNumber = 'validCardNumber';
  static const enterValidPassword = 'enterValidPassword';
}
