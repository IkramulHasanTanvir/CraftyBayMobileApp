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
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

}

class Data {
  List<SliderData>? sliders;
  int? total;
  int? firstPage;
  int? previous;
  int? next;
  int? lastPage;

  Data(
      {this.sliders,
        this.total,
        this.firstPage,
        this.previous,
        this.next,
        this.lastPage});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      sliders = <SliderData>[];
      json['results'].forEach((v) {
        sliders!.add(SliderData.fromJson(v));
      });
    }
    total = json['total'];
    firstPage = json['first_page'];
    previous = json['previous'];
    next = json['next'];
    lastPage = json['last_page'];
  }

}

class SliderData {
  String? sId;
  String? photoUrl;
  String? description;
  String? product;
  String? brand;
  int? category;
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
}
