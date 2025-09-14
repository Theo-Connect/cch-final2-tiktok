import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../services/firestore_service.dart';
import '../models/post_model.dart';

final firestoreServiceProvider = Provider<FirestoreService>((ref) {
  return FirestoreService();
});

final postsStreamProvider = StreamProvider<List<PostModel>>((ref) {
  final firestoreService = ref.watch(firestoreServiceProvider);
  
  return firestoreService.getPosts().map((snapshot) {
    return snapshot.docs.map((doc) {
      return PostModel.fromMap(doc.data() as Map<String, dynamic>, doc.id);
    }).toList();
  });
});

final userDocumentProvider = FutureProvider.family<DocumentSnapshot, String>((ref, uid) {
  final firestoreService = ref.watch(firestoreServiceProvider);
  return firestoreService.getUser(uid);
});