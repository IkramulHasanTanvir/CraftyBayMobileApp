import 'package:crafty_bay/features/category/models/caregory_model.dart';
import 'package:crafty_bay/services/api_urls.dart';
import 'package:crafty_bay/services/network_caller.dart';
import 'package:crafty_bay/services/network_response.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  bool _inProgress = false;
  String _errorMsg = '';

  List<CategoryData> _categoryList = [];

  bool get inProgress => _inProgress;

  String get errorMsg => _errorMsg;

  List<CategoryData> get categoryList => _categoryList;

  Future<bool> getCategoryList() async {
    _inProgress = true;
    update();
    NetworkResponse response =
        await NetworkCaller().getRequest(ApiUrls.categories);

    if (response.isSuccess) {
      CategoryModel categoryModel =
          CategoryModel.fromJson(response.responseBody);
      _categoryList = categoryModel.data?.categoryList ?? [];
    } else {
      _errorMsg = response.errorMessage;
    }
    _inProgress = false;
    update();
    return response.isSuccess;
  }
}
