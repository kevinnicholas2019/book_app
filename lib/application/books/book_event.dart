part of 'book_bloc.dart';

@immutable
abstract class BookEvent {}

class BookNewLoaded extends BookEvent {}

class BookDetailPressed extends BookEvent {}

class BookSearch extends BookEvent {}
