class CategoryModel {
  int? code;
  String? status;
  String? msg;
  Data? data;

  CategoryModel({this.code, this.status, this.msg, this.data});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['status'] = status;
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<CategoryData>? categoryList;
  int? total;
  Null? firstPage;
  Null? previous;
  int? next;
  int? lastPage;

  Data(
      {this.categoryList,
        this.total,
        this.firstPage,
        this.previous,
        this.next,
        this.lastPage});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      categoryList = <CategoryData>[];
      json['results'].forEach((v) {
        categoryList!.add(CategoryData.fromJson(v));
      });
    }
    total = json['total'];
    firstPage = json['first_page'];
    previous = json['previous'];
    next = json['next'];
    lastPage = json['last_page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (categoryList != null) {
      data['results'] = categoryList!.map((v) => v.toJson()).toList();
    }
    data['total'] = total;
    data['first_page'] = firstPage;
    data['previous'] = previous;
    data['next'] = next;
    data['last_page'] = lastPage;
    return data;
  }
}

class CategoryData {
  String? sId;
  String? title;
  String? slug;
  String? description;
  String? icon;
  Null? parent;
  String? createdAt;
  String? updatedAt;
  int? iV;

  CategoryData(
      {this.sId,
        this.title,
        this.slug,
        this.description,
        this.icon,
        this.parent,
        this.createdAt,
        this.updatedAt,
        this.iV});

  CategoryData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    icon = json['icon'];
    parent = json['parent'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['slug'] = slug;
    data['description'] = description;
    data['icon'] = icon;
    data['parent'] = parent;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
