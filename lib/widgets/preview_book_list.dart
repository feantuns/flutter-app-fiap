import 'package:flutter/material.dart';
import 'package:flutter_app_fiap/screens/home/domain/entities/preview_book_entity.dart';

class PreviewBookList extends StatelessWidget {
  const PreviewBookList({
    super.key,
    required this.title,
    required this.books,
  });

  final String title;
  final List<PreviewBookEntity> books;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SizedBox(
          width: double.infinity,
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      const SizedBox(height: 8),
      SizedBox(
        height: 220,
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(16),
          itemCount: books.length,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (_, __) => const SizedBox(width: 16),
          itemBuilder: (context, index) {
            final book = books[index];
            return Material(
              elevation: 0,
              borderRadius: BorderRadius.circular(16),
              child: Image.network(book.cover),
            );
          },
        ),
      ),
    ]);
  }
}
