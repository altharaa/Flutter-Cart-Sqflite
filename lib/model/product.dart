import 'dart:ffi';

import 'package:get/get.dart';

class ProductModel {
  int? id;
  String? brand;
  String? name;
  String? price;
  String? imageLink;
  String? productLink;
  String? websiteLink;
  String? description;
  double? rating;
  String? productType;
  String? createdAt;
  String? updatedAt;
  String? productApiUrl;
  String? apiFeaturedImage;
  RxInt quantity = 1.obs;

  ProductModel(
      {this.id,
      this.brand,
      this.name,
      this.price,
      this.imageLink,
      this.productLink,
      this.websiteLink,
      this.description,
      this.rating,
      this.productType,
  
      this.createdAt,
      this.updatedAt,
      this.productApiUrl,
      this.apiFeaturedImage,
});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    brand = json['brand'];
    name = json['name'];
    price = json['price'];
    imageLink = json['image_link'];
    productLink = json['product_link'];
    websiteLink = json['website_link'];
    description = json['description'];
    rating = json['rating'];
    productType = json['product_type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    productApiUrl = json['product_api_url'];
    apiFeaturedImage = json['api_featured_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['brand'] = this.brand;
    data['name'] = this.name;
    data['price'] = this.price;
    data['image_link'] = this.imageLink;
    data['product_link'] = this.productLink;
    data['website_link'] = this.websiteLink;
    data['description'] = this.description;
    data['rating'] = this.rating;
    data['product_type'] = this.productType;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['product_api_url'] = this.productApiUrl;
    data['api_featured_image'] = this.apiFeaturedImage;
    return data;
  }
}


