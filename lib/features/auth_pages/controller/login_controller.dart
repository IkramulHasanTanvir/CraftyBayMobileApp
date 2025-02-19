import 'package:crafty_bay/services/api_urls.dart';
import 'package:crafty_bay/services/network_caller.dart';
import 'package:crafty_bay/services/network_response.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  bool _inProgress = false;
  String _errorMgs = '';
  String _successMgs = '';

  bool get inProgress => _inProgress;

  String get errorMgs => _errorMgs;

  String get successMgs => _successMgs;

  Future<bool> login(String email,String password) async {
    _inProgress = true;
    update();

    final params = {'email': email,'password' : password};
    final NetworkResponse response = await NetworkCaller().postRequest(
      ApiUrls.login,
      params,
    );

    if (response.isSuccess) {
      _successMgs = response.successMessage;
    } else {
      _errorMgs = response.errorMessage;
    }
    _inProgress = false;
    update();
    return response.isSuccess;
  }
}
