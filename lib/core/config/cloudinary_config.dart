import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Cloudinary configuration for image uploads
class CloudinaryConfig {
  /// Cloud name from environment
  static String get cloudName => dotenv.env['CLOUDINARY_CLOUD_NAME'] ?? '';
  
  /// Upload preset from environment (unsigned preset for client-side uploads)
  static String get uploadPreset => dotenv.env['CLOUDINARY_UPLOAD_PRESET'] ?? '';
  
  /// Folder for event images
  static const String eventImagesFolder = 'faji/events';
  
  /// Folder for user avatars
  static const String userAvatarsFolder = 'faji/avatars';
  
  /// Folder for service provider portfolios
  static const String portfolioFolder = 'faji/portfolios';
  
  /// Maximum file size (10MB)
  static const int maxFileSizeBytes = 10 * 1024 * 1024;
  
  /// Allowed image formats
  static const List<String> allowedFormats = <String>['jpg', 'jpeg', 'png', 'webp'];
  
  /// Image transformation presets
  static const String thumbnailTransform = 'c_fill,w_300,h_300,q_auto';
  static const String cardTransform = 'c_fill,w_600,h_400,q_auto';
  static const String fullTransform = 'c_limit,w_1200,q_auto';
  
  /// Check if Cloudinary is configured
  static bool get isConfigured => cloudName.isNotEmpty && uploadPreset.isNotEmpty;
}
