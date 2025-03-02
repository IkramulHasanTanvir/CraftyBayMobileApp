class SliderModel {
  int? code;
  String? status;
  String? msg;
  Data? data;

  SliderModel({this.code, this.status, this.msg, this.data});

  SliderModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<SliderData>? results;
  int? total;
  Null? firstPage;
  Null? previous;
  int? next;
  int? lastPage;

  Data(
      {this.results,
        this.total,
        this.firstPage,
        this.previous,
        this.next,
        this.lastPage});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <SliderData>[];
      json['results'].forEach((v) {
        results!.add(new SliderData.fromJson(v));
      });
    }
    total = json['total'];
    firstPage = json['first_page'];
    previous = json['previous'];
    next = json['next'];
    lastPage = json['last_page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    data['first_page'] = this.firstPage;
    data['previous'] = this.previous;
    data['next'] = this.next;
    data['last_page'] = this.lastPage;
    return data;
  }
}

class SliderData {
  String? sId;
  String? photoUrl;
  String? description;
  String? product;
  String? brand;
  Null? category;
  String? createdAt;
  String? updatedAt;
  int? iV;

  SliderData(
      {this.sId,
        this.photoUrl,
        this.description,
        this.product,
        this.brand,
        this.category,
        this.createdAt,
        this.updatedAt,
        this.iV});

  SliderData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    photoUrl = json['photo_url'];
    description = json['description'];
    product = json['product'];
    brand = json['brand'];
    category = json['category'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['photo_url'] = this.photoUrl;
    data['description'] = this.description;
    data['product'] = this.product;
    data['brand'] = this.brand;
    data['category'] = this.category;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
