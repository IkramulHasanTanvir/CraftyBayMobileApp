import 'package:crafty_bay/features/wish_list/models/wish_list_model.dart';
import 'package:crafty_bay/services/api_urls.dart';
import 'package:crafty_bay/services/network_caller.dart';
import 'package:crafty_bay/services/network_response.dart';
import 'package:get/get.dart';

class WishListController extends GetxController {
  bool _inProgress = false;
  String _errorMsg = '';

  List<WishListData> _wishListData = [];

  bool get inProgress => _inProgress;

  String get errorMsg => _errorMsg;

  List<WishListData> get wishListData => _wishListData;

  Future<bool> getWishList() async {
    _inProgress = true;
    update();
    NetworkResponse response =
    await NetworkCaller().getRequest(ApiUrls.wishList);

    if (response.isSuccess) {
      WishListModel wishData =
      WishListModel.fromJson(response.responseBody);
      _wishListData = wishData.data?.results ?? [];
    } else {
      _errorMsg = response.errorMessage;
    }
    _inProgress = false;
    update();
    return response.isSuccess;
  }
}
