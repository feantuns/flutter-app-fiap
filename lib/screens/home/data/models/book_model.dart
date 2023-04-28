import 'package:flutter_app_fiap/screens/home/domain/entities/preview_book_entity.dart';

class BookModel {
  const BookModel({
    required this.id,
    required this.cover,
  });

  final int id;
  final String cover;

  factory BookModel.fromMap(Map<String, dynamic> map) => BookModel(
        id: map['id'],
        cover: map['formats']['image/jpeg'],
      );

  PreviewBookEntity toEntity() => PreviewBookEntity(id: id, cover: cover);
}
