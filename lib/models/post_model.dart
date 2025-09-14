class PostModel {
  final String id;
  final String userId;
  final String content;
  final String? imageUrl;
  final int likes;
  final DateTime createdAt;

  PostModel({
    required this.id,
    required this.userId,
    required this.content,
    this.imageUrl,
    required this.likes,
    required this.createdAt,
  });

  factory PostModel.fromMap(Map<String, dynamic> map, String id) {
    return PostModel(
      id: id,
      userId: map['userId'] ?? '',
      content: map['content'] ?? '',
      imageUrl: map['imageUrl'],
      likes: map['likes'] ?? 0,
      createdAt: map['createdAt']?.toDate() ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'content': content,
      'imageUrl': imageUrl,
      'likes': likes,
      'createdAt': createdAt,
    };
  }

  PostModel copyWith({
    String? userId,
    String? content,
    String? imageUrl,
    int? likes,
    DateTime? createdAt,
  }) {
    return PostModel(
      id: id,
      userId: userId ?? this.userId,
      content: content ?? this.content,
      imageUrl: imageUrl ?? this.imageUrl,
      likes: likes ?? this.likes,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}