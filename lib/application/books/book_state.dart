part of 'book_bloc.dart';

@immutable
abstract class BookState {
  final List<Book> books;
  final bool isLoading;
  final bool isSuccess;

  const BookState({
    required this.books,
    required this.isLoading,
    required this.isSuccess,
  });
}

class BookInitial extends BookState {
  const BookInitial({
    super.books = const [],
    super.isLoading = false,
    super.isSuccess = false,
  });
}

class BookLoadInProgress extends BookState {
  const BookLoadInProgress({
    super.books = const [],
    super.isLoading = true,
    super.isSuccess = false,
  });
}

class BookLoadSuccess extends BookState {
  const BookLoadSuccess({
    required super.books,
    super.isLoading = false,
    super.isSuccess = true,
  });
}

class BookLoadFailure extends BookState {
  const BookLoadFailure({
    super.books = const [],
    super.isLoading = false,
    super.isSuccess = false,
  });
}
