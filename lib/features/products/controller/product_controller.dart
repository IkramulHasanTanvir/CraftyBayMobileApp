import 'package:crafty_bay/common/models/product_model.dart';
import 'package:crafty_bay/services/api_urls.dart';
import 'package:crafty_bay/services/network_caller.dart';
import 'package:crafty_bay/services/network_response.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  bool _inProgress = false;
  String _errorMsg = '';

  List<ProductData> _productList = [];

  bool get inProgress => _inProgress;

  String get errorMsg => _errorMsg;

  List<ProductData> get productList => _productList;

  Future<bool> getProductList([String? categoryId]) async {
    _inProgress = true;
    update();
    final String productUrl = categoryId != null
        ? '${ApiUrls.products}?category=$categoryId'
        : ApiUrls.products;
    NetworkResponse response = await NetworkCaller().getRequest(productUrl);

    if (response.isSuccess) {
      ProductModel productData = ProductModel.fromJson(response.responseBody);
      _productList = productData.data?.productDataList ?? [];
    } else {
      _errorMsg = response.errorMessage;
    }
    _inProgress = false;
    update();
    return response.isSuccess;
  }
}
