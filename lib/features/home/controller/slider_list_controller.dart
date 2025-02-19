import 'package:crafty_bay/features/home/models/slider_list_model.dart';
import 'package:crafty_bay/services/api_urls.dart';
import 'package:crafty_bay/services/network_caller.dart';
import 'package:crafty_bay/services/network_response.dart';
import 'package:get/get.dart';

class SliderListController extends GetxController {
  bool _inProgress = false;
  String _errorMsg = '';

  List<SliderData> _sliderList = [];

  bool get inProgress => _inProgress;

  String get errorMsg => _errorMsg;

  List<SliderData> get sliderList => _sliderList;

  Future<bool> getSliderList() async {
    _inProgress = true;
    update();

    NetworkResponse response = await NetworkCaller().getRequest(ApiUrls.slides);

    if (response.isSuccess) {
      SliderModel sliderListModel =
          SliderModel.fromJson(response.responseBody);
      _sliderList = sliderListModel.data?.sliders ?? [];
    } else {
      _errorMsg = response.errorMessage;
    }
    _inProgress = false;
    update();
    return response.isSuccess;
  }
}
