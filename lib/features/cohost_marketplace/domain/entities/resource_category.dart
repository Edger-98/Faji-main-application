import 'package:flutter/material.dart';

/// Categories of resources that co-hosts can offer
enum ResourceCategory {
  venue('Venue', Icons.location_city_rounded, 'Penthouses, halls & outdoor spaces', Color(0xFF6B4FBB)),
  entertainment('Entertainment', Icons.music_note_rounded, 'DJs, bands & live performers', Color(0xFFFF6B9D)),
  promotion('Promotion', Icons.campaign_rounded, 'Influencers & social media pros', Color(0xFF4A90E2)),
  security('Security', Icons.shield_rounded, 'Professional security & screening', Color(0xFFFF8C42)),
  catering('Catering', Icons.restaurant_rounded, 'Food, drinks & bartenders', Color(0xFF4CAF50)),
  media('Media', Icons.camera_alt_rounded, 'Photography & videography', Color(0xFFE91E63)),
  equipment('Equipment', Icons.settings_input_component_rounded, 'Sound systems & lighting', Color(0xFF9C27B0)),
  staffing('Staffing', Icons.groups_rounded, 'Servers & event coordinators', Color(0xFFFF5722));

  const ResourceCategory(this.displayName, this.iconData, this.description, this.color);

  final String displayName;
  final IconData iconData;
  final String description;
  final Color color;
}
