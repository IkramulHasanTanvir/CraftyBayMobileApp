import 'package:crafty_bay/features/category/models/caregory_model.dart';

class ProductModel {
  final int? code;
  final String? status;
  final String? msg;
  final Data? data;

  ProductModel({this.code, this.status, this.msg, this.data});

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    code: json['code'],
    status: json['status'],
    msg: json['msg'],
    data: json['data'] != null ? Data.fromJson(json['data']) : null,
  );

  Map<String, dynamic> toJson() => {
    'code': code,
    'status': status,
    'msg': msg,
    'data': data?.toJson(),
  };
}

class Data {
  final List<ProductData>? results;
  final int? total;
  final int? next;
  final int? lastPage;

  Data({this.results, this.total, this.next, this.lastPage});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    results: (json['results'] as List?)?.map((v) => ProductData.fromJson(v)).toList(),
    total: json['total'],
    next: json['next'],
    lastPage: json['last_page'],
  );

  Map<String, dynamic> toJson() => {
    'results': results?.map((v) => v.toJson()).toList(),
    'total': total,
    'next': next,
    'last_page': lastPage,
  };
}

class ProductData {
  final String? id;
  final String? title;
  final Brand? brand;
  final List<CategoryData>? categories;
  final String? slug;
  final String? description;
  final List<String>? photos;
  final int? currentPrice;
  final int? quantity;
  final bool? inCart;
  final bool? inWishlist;

  ProductData({
    this.id,
    this.title,
    this.brand,
    this.categories,
    this.slug,
    this.description,
    this.photos,
    this.currentPrice,
    this.quantity,
    this.inCart,
    this.inWishlist,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) => ProductData(
    id: json['_id'],
    title: json['title'],
    brand: json['brand'] != null ? Brand.fromJson(json['brand']) : null,
    categories: (json['categories'] as List?)?.map((v) => CategoryData.fromJson(v)).toList(),
    slug: json['slug'],
    description: json['description'],
    photos: (json['photos'] as List?)?.cast<String>(),
    currentPrice: json['current_price'],
    quantity: json['quantity'],
    inCart: json['in_cart'],
    inWishlist: json['in_wishlist'],
  );

  Map<String, dynamic> toJson() => {
    '_id': id,
    'title': title,
    'brand': brand?.toJson(),
    'categories': categories?.map((v) => v.toJson()).toList(),
    'slug': slug,
    'description': description,
    'photos': photos,
    'current_price': currentPrice,
    'quantity': quantity,
    'in_cart': inCart,
    'in_wishlist': inWishlist,
  };
}

class Brand {
  final String? id;
  final String? title;
  final String? slug;
  final String? icon;

  Brand({this.id, this.title, this.slug, this.icon});

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
    id: json['_id'],
    title: json['title'],
    slug: json['slug'],
    icon: json['icon'],
  );

  Map<String, dynamic> toJson() => {
    '_id': id,
    'title': title,
    'slug': slug,
    'icon': icon,
  };
}
