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
}

class Data {
  final List<ProductData>? productDataList;
  final int? total, firstPage, previous, next, lastPage;

  Data(
      {this.productDataList,
      this.total,
      this.firstPage,
      this.previous,
      this.next,
      this.lastPage});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        productDataList: (json['results'] as List?)
            ?.map((e) => ProductData.fromJson(e))
            .toList(),
        total: json['total'],
        firstPage: json['first_page'],
        previous: json['previous'],
        next: json['next'],
        lastPage: json['last_page'],
      );
}

class ProductData {
  final String? sId,
      title,
      slug,
      metaDescription,
      description,
      createdAt,
      updatedAt;
  final List<CategoriesData>? categories;
  final List<String>? photos, colors, sizes, tags;
  final int? regularPrice, currentPrice, quantity;
  final bool? inCart, inWishlist;
  final CategoriesData? brand;

  ProductData({
    this.sId,
    this.title,
    this.categories,
    this.slug,
    this.metaDescription,
    this.description,
    this.photos,
    this.colors,
    this.sizes,
    this.tags,
    this.regularPrice,
    this.currentPrice,
    this.quantity,
    this.createdAt,
    this.updatedAt,
    this.inCart,
    this.inWishlist,
    this.brand,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) => ProductData(
        sId: json['_id'],
        title: json['title'],
        categories: (json['categories'] as List?)
            ?.map((e) => CategoriesData.fromJson(e))
            .toList(),
        slug: json['slug'],
        metaDescription: json['meta_description'],
        description: json['description'],
        photos: List<String>.from(json['photos'] ?? []),
        colors: List<String>.from(json['colors'] ?? []),
        sizes: List<String>.from(json['sizes'] ?? []),
        tags: List<String>.from(json['tags'] ?? []),
        regularPrice: json['regular_price'],
        currentPrice: json['current_price'],
        quantity: json['quantity'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
        inCart: json['in_cart'],
        inWishlist: json['in_wishlist'],
        brand:
            json['brand'] != null ? CategoriesData.fromJson(json['brand']) : null,
      );
}

class CategoriesData {
  final String? sId, title, slug, icon;

  CategoriesData({this.sId, this.title, this.slug, this.icon});

  factory CategoriesData.fromJson(Map<String, dynamic> json) => CategoriesData(
        sId: json['_id'],
        title: json['title'],
        slug: json['slug'],
        icon: json['icon'],
      );
}
