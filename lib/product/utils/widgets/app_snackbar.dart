import 'package:fluttertoast/fluttertoast.dart';

import '../../../core/theme/app_colors.dart';

class AppSnackbar {
  static AppSnackbar? _instance;
  const AppSnackbar._();
  static AppSnackbar get instance => _instance ??= const AppSnackbar._();

  void showError({dynamic message}) {
    Fluttertoast.showToast(msg: "$message", backgroundColor: AppColors.errorColor);
  }

  void showSuccess({dynamic message}) {
    Fluttertoast.showToast(msg: message.toString(), backgroundColor: AppColors.primaryColor);
  }

  void get succesSaveName {
    showSuccess(message: "İsim başarıyla güncellendi");
  }

  void get errorUserGame {
    showError(message: "Karşı tarafın hamle yapması bekleniyor. Lütfen bekleyiniz");
  }

  void get errorUserLimitGame {
    showError(message: "2. Oyuncu bekleniyor. Lütfen bekleyiniz");
  }
}
