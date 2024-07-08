// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:homwork_bloc_storage/core/model/handling.dart';
part 'product_model.g.dart';

class ListOf<T> extends ResultModel {
  List<T> data;
  ListOf({
    required this.data,
  });
}

@HiveType(typeId: 0,adapterName: 'ProductAdapter')
class ProductModel extends ResultModel {
  @HiveField(0)
  String name;
  @HiveField(1)
  String description;
  @HiveField(2)
  double price;
  @HiveField(3)
  String image;
  @HiveField(4)
  String brand;
  ProductModel({
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.brand,
  });

  ProductModel copyWith({
    String? name,
    String? description,
    double? price,
    String? image,
    String? brand,
  }) {
    return ProductModel(
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      image: image ?? this.image,
      brand: brand ?? this.brand,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'price': price,
      'image': image,
      'brand': brand,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      name: map['name'] as String,
      description: map['description'] as String,
      price: map['price'] as double,
      image: map['image'] as String,
      brand: map['brand'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) => ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductModel(name: $name, description: $description, price: $price, image: $image, brand: $brand)';
  }

  @override
  bool operator ==(covariant ProductModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.description == description &&
      other.price == price &&
      other.image == image &&
      other.brand == brand;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      description.hashCode ^
      price.hashCode ^
      image.hashCode ^
      brand.hashCode;
  }
}
