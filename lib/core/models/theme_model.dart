import 'package:flutter/material.dart';

class ThemeModel {

  ThemeModel({
    required this.id,
    required this.name,
    required this.colors,
    this.category,
  });

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
  final String id;
  final String name;
  final List<String> colors;
  final String? category;

  /// Convert hex color strings to Flutter Color objects
  List<Color> get gradientColors => colors.map((hex) => _hexToColor(hex)).toList();

  /// Convert hex string to Color
  Color _hexToColor(String hex) {
    final String hexCode = hex.replaceAll('#', '');
    return Color(int.parse('FF$hexCode', radix: 16));
  }

  Map<String, dynamic> toJson() => {
      'id': id,
      'name': name,
      'colors': colors,
      'category': category,
    };
}
