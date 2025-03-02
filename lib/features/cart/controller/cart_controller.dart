import 'package:crafty_bay/features/cart/models/card_model.dart';
import 'package:crafty_bay/services/api_urls.dart';
import 'package:crafty_bay/services/network_caller.dart';
import 'package:crafty_bay/services/network_response.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  bool _inProgress = false;
  String _errorMsg = '';

  List<CardData> _cartList = [];

  bool get inProgress => _inProgress;

  String get errorMsg => _errorMsg;

  List<CardData> get cartList => _cartList;

  Future<bool> getCartList() async {
    _inProgress = true;
    update();
    NetworkResponse response = await NetworkCaller().getRequest(ApiUrls.cartList);

    if (response.isSuccess) {
      CardModel categoryModel =
      CardModel.fromJson(response.responseBody);
      _cartList = categoryModel.data?.cardList ?? [];
    } else {
      _errorMsg = response.errorMessage;
    }
    _inProgress = false;
    update();
    return response.isSuccess;
  }
}