part of 'book_bloc.dart';

@immutable
abstract class BookState {
  final List<Book> books;
  final bool isLoading;
  final bool isSuccess;
  final Book? currentBook;

  const BookState({
    this.books = const [],
    this.isLoading = false,
    this.isSuccess = false,
    this.currentBook,
  });
}

class BookInitial extends BookState {
  const BookInitial();
}

class BookLoadInProgress extends BookState {
  const BookLoadInProgress({
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

//Detail books
class BookDetailInitial extends BookState {
  const BookDetailInitial({required super.currentBook});
}

class BookDetailLoadInProgress extends BookState {
  const BookDetailLoadInProgress({
    required super.books,
    required super.currentBook,
    super.isLoading = true,
    super.isSuccess = false,
  });
}

class BookDetailLoadSuccess extends BookState {
  final BookDetail currentBookDetail;

  const BookDetailLoadSuccess({
    required super.books,
    required this.currentBookDetail,
    required super.currentBook,
    super.isLoading = false,
    super.isSuccess = true,
  });
}

class BookDetailLoadFailure extends BookState {
  const BookDetailLoadFailure({
    required super.books,
    required super.currentBook,
    super.isLoading = false,
    super.isSuccess = false,
  });
}
