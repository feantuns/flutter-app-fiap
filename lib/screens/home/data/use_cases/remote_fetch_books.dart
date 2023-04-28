import 'dart:convert';

import 'package:flutter_app_fiap/screens/home/data/models/book_model.dart';
import 'package:http/http.dart';
import 'package:flutter_app_fiap/screens/home/domain/entities/book_topics_entity.dart';
import 'package:flutter_app_fiap/screens/home/domain/entities/preview_book_entity.dart';
import 'package:flutter_app_fiap/screens/home/domain/use_cases/fetch_books.dart';

class RemoteFetchBooks extends FetchBooks {
  Future<List<PreviewBookEntity>> getBooksByTopic(String topic) async {
    try {
      final uri = Uri.parse('https://gutendex.com/books/?topic=$topic');
      final response = await Client().get(uri);
      final responseJson = jsonDecode(response.body);

      return responseJson['results']
          .map<PreviewBookEntity>((map) => BookModel.fromMap(map).toEntity())
          .toList();
    } catch (e) {
      return [];
    }
  }

  @override
  Future<BookTopicsEntity> execute() async {
    try {
      var books = await Future.wait([
        getBooksByTopic('romance'),
        getBooksByTopic('poetry'),
        getBooksByTopic('children'),
      ]);
      return BookTopicsEntity(
        romance: books[0],
        poetry: books[1],
        children: books[2],
      );
    } catch (e) {
      return const BookTopicsEntity(
        romance: [],
        poetry: [],
        children: [],
      );
    }
  }
}
