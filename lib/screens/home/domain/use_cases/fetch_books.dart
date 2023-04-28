import 'package:flutter_app_fiap/screens/home/domain/entities/book_topics_entity.dart';

abstract class FetchBooks {
  Future<BookTopicsEntity> execute();
}
