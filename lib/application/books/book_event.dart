part of 'book_bloc.dart';

@immutable
abstract class BookEvent {}

class BookNewLoaded extends BookEvent {}

class BookDetailPressed extends BookEvent {
  final Book book;

  BookDetailPressed({
    required this.book,
  });
}

class BookSearch extends BookEvent {}
