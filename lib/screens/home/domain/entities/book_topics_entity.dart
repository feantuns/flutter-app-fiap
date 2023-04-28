import 'package:flutter_app_fiap/screens/home/domain/entities/preview_book_entity.dart';

class BookTopicsEntity {
  const BookTopicsEntity({
    required this.romance,
    required this.poetry,
    required this.children,
  });

  final List<PreviewBookEntity> romance;
  final List<PreviewBookEntity> poetry;
  final List<PreviewBookEntity> children;
}
