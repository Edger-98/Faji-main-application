class VendorModel {
  final String id;
  final String name;
  final String category;
  final VendorContactModel contact;
  final bool isOnline;
  final String? avatar;

  VendorModel({
    required this.id,
    required this.name,
    required this.category,
    required this.contact,
    required this.isOnline,
    this.avatar,
  });

  factory VendorModel.fromJson(Map<String, dynamic> json) {
    return VendorModel(
      id: json['id'] as String,
      name: json['name'] as String,
      category: json['category'] as String,
      contact: VendorContactModel.fromJson(json['contact'] as Map<String, dynamic>),
      isOnline: json['isOnline'] as bool? ?? false,
      avatar: json['avatar'] as String?,
    );
  }
}

class VendorContactModel {
  final String phone;
  final String email;

  VendorContactModel({
    required this.phone,
    required this.email,
  });

  factory VendorContactModel.fromJson(Map<String, dynamic> json) {
    return VendorContactModel(
      phone: json['phone'] as String,
      email: json['email'] as String,
    );
  }
}
