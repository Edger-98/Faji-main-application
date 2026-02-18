import 'dart:io';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fajimobileapp/core/config/cloudinary_config.dart';

/// Service for handling image uploads to Cloudinary
class CloudinaryService {
  
  CloudinaryService() {
    if (CloudinaryConfig.isConfigured) {
      _cloudinary = CloudinaryPublic(
        CloudinaryConfig.cloudName,
        CloudinaryConfig.uploadPreset,
        cache: false,
      );
    }
  }
  late final CloudinaryPublic _cloudinary;
  final ImagePicker _imagePicker = ImagePicker();
  
  /// Pick image from gallery
  Future<File?> pickImageFromGallery() async {
    try {
      final image = await _imagePicker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1920,
        maxHeight: 1920,
        imageQuality: 85,
      );
      
      if (image == null) return null;
      
      final File file = File(image.path);
      
      // Check file size
      final int fileSize = await file.length();
      if (fileSize > CloudinaryConfig.maxFileSizeBytes) {
        throw Exception('Image size exceeds 10MB limit');
      }
      
      return file;
    } catch (e) {
      throw Exception('Failed to pick image: $e');
    }
  }
  
  /// Pick image from camera
  Future<File?> pickImageFromCamera() async {
    try {
      final image = await _imagePicker.pickImage(
        source: ImageSource.camera,
        maxWidth: 1920,
        maxHeight: 1920,
        imageQuality: 85,
      );
      
      if (image == null) return null;
      
      final File file = File(image.path);
      
      // Check file size
      final int fileSize = await file.length();
      if (fileSize > CloudinaryConfig.maxFileSizeBytes) {
        throw Exception('Image size exceeds 10MB limit');
      }
      
      return file;
    } catch (e) {
      throw Exception('Failed to capture image: $e');
    }
  }
  
  /// Upload image to Cloudinary
  /// Returns the secure URL of the uploaded image
  Future<String> uploadImage({
    required File imageFile,
    required String folder,
    String? publicId,
  }) async {
    if (!CloudinaryConfig.isConfigured) {
      throw Exception('Cloudinary is not configured. Please set CLOUDINARY_CLOUD_NAME and CLOUDINARY_UPLOAD_PRESET in .env');
    }
    
    try {
      final CloudinaryResponse response = await _cloudinary.uploadFile(
        CloudinaryFile.fromFile(
          imageFile.path,
          folder: folder,
          publicId: publicId,
          resourceType: CloudinaryResourceType.Image,
        ),
      );
      
      return response.secureUrl;
    } catch (e) {
      throw Exception('Failed to upload image: $e');
    }
  }
  
  /// Upload event image
  Future<String> uploadEventImage(File imageFile, String eventId) async => await uploadImage(
      imageFile: imageFile,
      folder: CloudinaryConfig.eventImagesFolder,
      publicId: 'event_$eventId',
    );
  
  /// Upload user avatar
  Future<String> uploadUserAvatar(File imageFile, String userId) async => await uploadImage(
      imageFile: imageFile,
      folder: CloudinaryConfig.userAvatarsFolder,
      publicId: 'user_$userId',
    );
  
  /// Upload portfolio image
  Future<String> uploadPortfolioImage(File imageFile, String providerId) async => await uploadImage(
      imageFile: imageFile,
      folder: CloudinaryConfig.portfolioFolder,
      publicId: 'portfolio_${providerId}_${DateTime.now().millisecondsSinceEpoch}',
    );
  
  /// Delete image from Cloudinary (requires API key/secret - backend only)
  /// This should be handled by the backend for security
  Future<void> deleteImage(String publicId) async {
    // This requires API key and secret, which should NOT be exposed in the client
    // The backend should handle image deletion
    throw UnimplementedError('Image deletion should be handled by the backend');
  }
  
  /// Get optimized image URL with transformations
  String getOptimizedUrl(String imageUrl, {String? transformation}) {
    if (imageUrl.isEmpty || !imageUrl.contains('cloudinary')) {
      return imageUrl;
    }
    
    // If no transformation specified, return original
    if (transformation == null) return imageUrl;
    
    // Insert transformation into Cloudinary URL
    // Example: https://res.cloudinary.com/cloud/image/upload/v123/image.jpg
    // Becomes: https://res.cloudinary.com/cloud/image/upload/c_fill,w_300,h_300/v123/image.jpg
    final List<String> parts = imageUrl.split('/upload/');
    if (parts.length == 2) {
      return '${parts[0]}/upload/$transformation/${parts[1]}';
    }
    
    return imageUrl;
  }
  
  /// Get thumbnail URL
  String getThumbnailUrl(String imageUrl) => getOptimizedUrl(imageUrl, transformation: CloudinaryConfig.thumbnailTransform);
  
  /// Get card-sized URL
  String getCardUrl(String imageUrl) => getOptimizedUrl(imageUrl, transformation: CloudinaryConfig.cardTransform);
  
  /// Get full-sized URL
  String getFullUrl(String imageUrl) => getOptimizedUrl(imageUrl, transformation: CloudinaryConfig.fullTransform);
}

/// Provider for CloudinaryService
final Provider<CloudinaryService> cloudinaryServiceProvider = Provider<CloudinaryService>((ProviderRef<CloudinaryService> ref) => CloudinaryService());
