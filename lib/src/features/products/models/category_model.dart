import 'dart:convert';

import 'package:al_barq/src/core/constants/network_images.dart';

class CategoryModel {
  final String id;
  final String name;
  final String image;
  final String description;
  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
  });

  CategoryModel copyWith({
    String? id,
    String? name,
    String? image,
    String? description,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
      'description': description,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'] as String,
      name: map['name'] as String,
      image: map['image'] as String,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);
       
  static List<CategoryModel> dummyCategories = [
    CategoryModel(
      id: '',
      name: "Modules",
      image:NetworkImages.modules,
      description: '',
    ),
    CategoryModel(
      id: '',
      name: "Inverters",
      image:
          NetworkImages.inverter,
      description: '',
    ),
    CategoryModel(
      id: '',
      name: "Solar Kit",
      image: NetworkImages.solarKit,
      description: '',
    ),
    CategoryModel(
      name: "Solar Grid Kit",
      image: NetworkImages.solarGrid,
      id: '',
      description: '',
    ),
    CategoryModel(
      name: "Wires",
      id: '',
      image: NetworkImages.wires,
      description: '',
    ),
    CategoryModel(
      name: "Solar Stand",
      image: NetworkImages.solarStands,
      id: '',
      description: '',
    ),
  ];

}
