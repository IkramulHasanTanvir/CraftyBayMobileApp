import 'package:crafty_bay/common/models/product_model.dart';

class WishListModel {
  int? code;
  String? status;
  String? msg;
  Data? data;

  WishListModel({this.code, this.status, this.msg, this.data});

  factory WishListModel.fromJson(Map<String, dynamic> json) {
    return WishListModel(
      code: json['code'],
      status: json['status'],
      msg: json['msg'],
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
    );
  }
}

class Data {
  List<WishListData>? results;
  int? total;

  Data({this.results, this.total});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      results: json['results'] != null
          ? List<WishListData>.from(
              json['results'].map((x) => WishListData.fromJson(x)))
          : [],
      total: json['total'],
    );
  }
}

class WishListData {
  String? id;
  ProductData? product;
  String? user;
  String? createdAt;
  String? updatedAt;

  WishListData(
      {this.id, this.product, this.user, this.createdAt, this.updatedAt});

  factory WishListData.fromJson(Map<String, dynamic> json) {
    return WishListData(
      id: json['_id'],
      product: json['product'] != null
          ? ProductData.fromJson(json['product'])
          : null,
      user: json['user'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}
