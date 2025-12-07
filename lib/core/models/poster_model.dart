import 'package:flutter/material.dart';

class PosterModel {
  final String id;
  final String name;
  final List<String> colors;
  final String? category;
  final String? description;

  PosterModel({
    required this.id,
    required this.name,
    required this.colors,
    this.category,
    this.description,
  });

  /// Convert hex color strings to Flutter Color objects
  List<Color> get gradientColors {
    return colors.map((hex) => _hexToColor(hex)).toList();
  }

  /// Convert hex string to Color
  Color _hexToColor(String hex) {
    final hexCode = hex.replaceAll('#', '');
    return Color(int.parse('FF$hexCode', radix: 16));
  }

  factory PosterModel.fromJson(Map<String, dynamic> json) {
    return PosterModel(
      id: json['id'] as String,
      name: json['name'] as String,
      colors: json['colors'] != null
          ? (json['colors'] as List).map((e) => e as String).toList()
          : [], // Default to empty list if colors is null
      category: json['category'] as String?,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'colors': colors,
      'category': category,
      'description': description,
    };
  }
}
