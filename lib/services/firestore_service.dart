import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  
  // Users collection
  CollectionReference get users => _firestore.collection('users');
  
  // Posts collection
  CollectionReference get posts => _firestore.collection('posts');
  
  // Create user document
  Future<void> createUser({
    required String uid,
    required String email,
    String? displayName,
  }) async {
    await users.doc(uid).set({
      'email': email,
      'displayName': displayName ?? '',
      'createdAt': FieldValue.serverTimestamp(),
    });
  }
  
  // Get user document
  Future<DocumentSnapshot> getUser(String uid) async {
    return await users.doc(uid).get();
  }
  
  // Update user document
  Future<void> updateUser(String uid, Map<String, dynamic> data) async {
    await users.doc(uid).update(data);
  }
  
  // Create post
  Future<DocumentReference> createPost({
    required String userId,
    required String content,
    String? imageUrl,
  }) async {
    return await posts.add({
      'userId': userId,
      'content': content,
      'imageUrl': imageUrl,
      'createdAt': FieldValue.serverTimestamp(),
      'likes': 0,
    });
  }
  
  // Get posts stream
  Stream<QuerySnapshot> getPosts() {
    return posts.orderBy('createdAt', descending: true).snapshots();
  }
}