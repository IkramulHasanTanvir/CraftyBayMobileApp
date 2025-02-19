import 'package:crafty_bay/features/auth_pages/models/sing_up_params.dart';
import 'package:crafty_bay/services/api_urls.dart';
import 'package:crafty_bay/services/network_caller.dart';
import 'package:crafty_bay/services/network_response.dart';
import 'package:get/get.dart';

class SingUpController extends GetxController {
  bool _inProgress = false;
  String _errorMgs = '';
  String _successMgs = '';

  bool get inProgress => _inProgress;

  String get errorMgs => _errorMgs;

  String get successMgs => _successMgs;

  Future<bool> signUp(SingUpParams params) async {
    _inProgress = true;
    update();

    final NetworkResponse response = await NetworkCaller().postRequest(
      ApiUrls.signup,
      params.toJson(),
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
