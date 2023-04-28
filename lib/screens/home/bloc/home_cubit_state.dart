import 'package:flutter_app_fiap/screens/home/domain/entities/book_topics_entity.dart';

class HomeCubitState {
  const HomeCubitState({
    required this.bookByTopics,
  });

  final BookTopicsEntity bookByTopics;

  HomeCubitState copyWith({
    BookTopicsEntity? bookByTopics,
  }) =>
      HomeCubitState(bookByTopics: bookByTopics ?? this.bookByTopics);
}
