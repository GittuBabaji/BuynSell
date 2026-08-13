import 'dart:io';

/// StorageService handles image uploads, downloads, and storage management
/// for product images and profile pictures.
class StorageService {
  StorageService();

  /// Uploads a single image file to cloud or local storage.
  Future<String> uploadImage(File file, String path) async {
    // TODO: Implement uploadImage to cloud storage
    throw UnimplementedError('uploadImage() has not been implemented.');
  }

  /// Deletes an image file from storage given its path or URL.
  Future<bool> deleteImage(String pathOrUrl) async {
    // TODO: Implement deleteImage from storage
    throw UnimplementedError('deleteImage() has not been implemented.');
  }

  /// Retrieves the public download URL for a file stored at a path.
  Future<String> getDownloadUrl(String path) async {
    // TODO: Implement getDownloadUrl
    throw UnimplementedError('getDownloadUrl() has not been implemented.');
  }

  /// Uploads multiple image files concurrently or sequentially and returns list of URLs.
  Future<List<String>> uploadMultipleImages(List<File> files, String folderPath) async {
    // TODO: Implement uploadMultipleImages
    throw UnimplementedError('uploadMultipleImages() has not been implemented.');
  }
}
