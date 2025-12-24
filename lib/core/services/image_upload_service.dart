import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import '../network/api_client.dart';

/// Service for handling image uploads via backend API
class ImageUploadService {
  final Dio _dio;
  final ImagePicker _imagePicker = ImagePicker();
  
  ImageUploadService(this._dio);
  
  /// Maximum file size (10MB)
  static const int maxFileSizeBytes = 10 * 1024 * 1024;
  
  /// Pick image from gallery
  Future<File?> pickImageFromGallery() async {
    try {
      final XFile? image = await _imagePicker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1920,
        maxHeight: 1920,
        imageQuality: 85,
      );
      
      if (image == null) return null;
      
      final file = File(image.path);
      
      // Check file size
      final fileSize = await file.length();
      if (fileSize > maxFileSizeBytes) {
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
      final XFile? image = await _imagePicker.pickImage(
        source: ImageSource.camera,
        maxWidth: 1920,
        maxHeight: 1920,
        imageQuality: 85,
      );
      
      if (image == null) return null;
      
      final file = File(image.path);
      
      // Check file size
      final fileSize = await file.length();
      if (fileSize > maxFileSizeBytes) {
        throw Exception('Image size exceeds 10MB limit');
      }
      
      return file;
    } catch (e) {
      throw Exception('Failed to capture image: $e');
    }
  }
  
  /// Upload single image to backend
  /// Returns the Cloudinary URL
  Future<String> uploadImage({
    required File imageFile,
    String type = 'event', // event | profile | vendor | resource | general
  }) async {
    try {
      print('📤 Uploading image to backend...');
      print('📁 File: ${imageFile.path}');
      print('🏷️ Type: $type');
      
      // Create form data
      final formData = FormData.fromMap({
        'image': await MultipartFile.fromFile(
          imageFile.path,
          filename: imageFile.path.split('/').last,
        ),
      });
      
      // Upload to backend
      final response = await _dio.post(
        '/upload/image',
        data: formData,
        queryParameters: {'type': type},
        options: Options(
          headers: {
            'Content-Type': 'multipart/form-data',
          },
        ),
      );
      
      print('✅ Upload successful');
      print('📦 Response: ${response.data}');
      
      if (response.statusCode == 200 && response.data['success'] == true) {
        final imageUrl = response.data['data']['imageUrl'] as String;
        print('🖼️ Image URL: $imageUrl');
        return imageUrl;
      } else {
        throw Exception('Upload failed: ${response.data['message'] ?? 'Unknown error'}');
      }
    } on DioException catch (e) {
      print('❌ Upload failed: ${e.message}');
      if (e.response != null) {
        print('📦 Error response: ${e.response?.data}');
        throw Exception('Upload failed: ${e.response?.data['message'] ?? e.message}');
      }
      throw Exception('Upload failed: ${e.message}');
    } catch (e) {
      print('💥 Unexpected error: $e');
      throw Exception('Failed to upload image: $e');
    }
  }
  
  /// Upload multiple images to backend
  /// Returns list of Cloudinary URLs
  Future<List<String>> uploadMultipleImages({
    required List<File> imageFiles,
    String type = 'event',
  }) async {
    try {
      print('📤 Uploading ${imageFiles.length} images to backend...');
      
      // Create form data with multiple files
      final formData = FormData.fromMap({
        'images': imageFiles.map((file) async => await MultipartFile.fromFile(
          file.path,
          filename: file.path.split('/').last,
        )).toList(),
      });
      
      // Upload to backend
      final response = await _dio.post(
        '/upload/images',
        data: formData,
        queryParameters: {'type': type},
        options: Options(
          headers: {
            'Content-Type': 'multipart/form-data',
          },
        ),
      );
      
      print('✅ Upload successful');
      
      if (response.statusCode == 200 && response.data['success'] == true) {
        final images = response.data['data']['images'] as List;
        final imageUrls = images.map((img) => img['imageUrl'] as String).toList();
        print('🖼️ Uploaded ${imageUrls.length} images');
        return imageUrls;
      } else {
        throw Exception('Upload failed: ${response.data['message'] ?? 'Unknown error'}');
      }
    } on DioException catch (e) {
      print('❌ Upload failed: ${e.message}');
      throw Exception('Upload failed: ${e.message}');
    } catch (e) {
      print('💥 Unexpected error: $e');
      throw Exception('Failed to upload images: $e');
    }
  }
  
  /// Delete image from backend
  Future<void> deleteImage(String publicId) async {
    try {
      print('🗑️ Deleting image: $publicId');
      
      final response = await _dio.delete(
        '/upload/image',
        data: {'publicId': publicId},
      );
      
      if (response.statusCode == 200 && response.data['success'] == true) {
        print('✅ Image deleted successfully');
      } else {
        throw Exception('Delete failed: ${response.data['message'] ?? 'Unknown error'}');
      }
    } on DioException catch (e) {
      print('❌ Delete failed: ${e.message}');
      throw Exception('Delete failed: ${e.message}');
    } catch (e) {
      print('💥 Unexpected error: $e');
      throw Exception('Failed to delete image: $e');
    }
  }
  
  /// Upload event image
  Future<String> uploadEventImage(File imageFile) async {
    return await uploadImage(imageFile: imageFile, type: 'event');
  }
  
  /// Upload profile image
  Future<String> uploadProfileImage(File imageFile) async {
    return await uploadImage(imageFile: imageFile, type: 'profile');
  }
  
  /// Upload vendor image
  Future<String> uploadVendorImage(File imageFile) async {
    return await uploadImage(imageFile: imageFile, type: 'vendor');
  }
  
  /// Upload resource image
  Future<String> uploadResourceImage(File imageFile) async {
    return await uploadImage(imageFile: imageFile, type: 'resource');
  }
}

/// Provider for ImageUploadService
final imageUploadServiceProvider = Provider<ImageUploadService>((ref) {
  final dio = ref.watch(dioProvider);
  return ImageUploadService(dio);
});
