import 'package:crafty_bay/common/models/product_model.dart';

class CardModel {
  final int? code;
  final String? status;
  final String? msg;
  final Data? data;

  CardModel({this.code, this.status, this.msg, this.data});

  factory CardModel.fromJson(Map<String, dynamic> json) => CardModel(
    code: json['code'],
    status: json['status'],
    msg: json['msg'],
    data: json['data'] != null ? Data.fromJson(json['data']) : null,
  );
}

class Data {
  final List<CardData>? cardList;
  final int? total;

  Data({this.cardList, this.total});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    cardList: (json['results'] as List?)
        ?.map((e) => CardData.fromJson(e))
        .toList(),
    total: json['total'],
  );
}

class CardData {
  final String? id;
  final ProductData? product;
  final String? user;
  final int? quantity;
  final String? createdAt;
  final String? updatedAt;
  final int? version;

  CardData({
    this.id,
    this.product,
    this.user,
    this.quantity,
    this.createdAt,
    this.updatedAt,
    this.version,
  });

  factory CardData.fromJson(Map<String, dynamic> json) => CardData(
    id: json['_id'],
    product: json['product'] != null
        ? ProductData.fromJson(json['product'])
        : null,
    user: json['user'],
    quantity: json['quantity'],
    createdAt: json['createdAt'],
    updatedAt: json['updatedAt'],
    version: json['__v'],
  );
}