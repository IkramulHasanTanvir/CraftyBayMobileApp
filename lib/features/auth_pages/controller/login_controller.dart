import 'package:crafty_bay/services/api_urls.dart';
import 'package:crafty_bay/services/network_caller.dart';
import 'package:crafty_bay/services/network_response.dart';
import 'package:crafty_bay/services/user_data_controller.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class LoginController extends GetxController {
  bool _inProgress = false;
  String _errorMsg = '';
  String _successMsg = '';

  bool get inProgress => _inProgress;

  String get errorMgs => _errorMsg;

  String get successMgs => _successMsg;

  Future<bool> login(String email,String password) async {
    _inProgress = true;
    update();

    final params = {'email': email,'password' : password};
    final NetworkResponse response = await NetworkCaller().postRequest(
      ApiUrls.login,
      params,
    );

    if (response.isSuccess) {
      final String token = response.responseBody['data']['token'];
      await UserDataController().saveUserData(token);
      Logger().d('TOKEN => $token');
      _successMsg = response.successMessage;
    } else {
      _errorMsg = response.errorMessage;
    }
    _inProgress = false;
    update();
    return response.isSuccess;
  }
}
