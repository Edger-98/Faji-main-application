import 'package:flutter/material.dart';

class ThemeModel {
  final String id;
  final String name;
  final List<String> colors;
  final String? category;

  ThemeModel({
    required this.id,
    required this.name,
    required this.colors,
    this.category,
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

  factory ThemeModel.fromJson(Map<String, dynamic> json) {
    return ThemeModel(
      id: json['id'] as String,
      name: json['name'] as String,
      colors: json['colors'] != null 
          ? (json['colors'] as List).map((e) => e as String).toList()
          : [], // Default to empty list if colors is null
      category: json['category'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'colors': colors,
      'category': category,
    };
  }
}
