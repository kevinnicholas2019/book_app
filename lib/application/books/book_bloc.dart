import 'package:book_app/domain/books/book.dart';
import 'package:book_app/domain/books/book_detail.dart';
import 'package:book_app/domain/books/i_book_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'book_event.dart';
part 'book_state.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  static final IBookRepository _bookRepository = IBookRepository();

  BookBloc() : super(const BookInitial()) {
    on<BookNewLoaded>((event, emit) async {
      emit(const BookLoadInProgress());
      final books = await _bookRepository.getAllNewBook();
      emit(
        books == null ? const BookLoadFailure() : BookLoadSuccess(books: books),
      );
    });
    on<BookDetailPressed>((event, emit) async {
      final books = state.books;
      emit(BookDetailLoadInProgress(books: books, currentBook: event.book));
      final bookDetail =
          await _bookRepository.getDetailBook(event.book.isbn13.value);
      emit(
        bookDetail == null
            ? BookDetailLoadFailure(books: books, currentBook: event.book)
            : BookDetailLoadSuccess(
                books: books,
                currentBook: event.book,
                currentBookDetail: bookDetail,
              ),
      );
    });
    // on<BookSearch>((event, emit) {
    //   // TODO: implement event handler
    // });
  }
}
