import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  
  // Upload image to Firebase Storage
  Future<String> uploadImage({
    required File file,
    required String path,
  }) async {
    try {
      final ref = _storage.ref().child(path);
      final uploadTask = ref.putFile(file);
      final snapshot = await uploadTask;
      final downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      throw Exception('Failed to upload image: $e');
    }
  }
  
  // Upload profile image
  Future<String> uploadProfileImage({
    required File file,
    required String userId,
  }) async {
    final path = 'profile_images/$userId/${DateTime.now().millisecondsSinceEpoch}.jpg';
    return await uploadImage(file: file, path: path);
  }
  
  // Upload post image
  Future<String> uploadPostImage({
    required File file,
    required String userId,
  }) async {
    final path = 'post_images/$userId/${DateTime.now().millisecondsSinceEpoch}.jpg';
    return await uploadImage(file: file, path: path);
  }
  
  // Delete file from storage
  Future<void> deleteFile(String url) async {
    try {
      final ref = _storage.refFromURL(url);
      await ref.delete();
    } catch (e) {
      throw Exception('Failed to delete file: $e');
    }
  }
}