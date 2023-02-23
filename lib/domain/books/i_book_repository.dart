import 'package:book_app/domain/books/book.dart';
import 'package:book_app/domain/books/book_detail.dart';
import 'package:book_app/infrastructure/books/book_api.dart';

abstract class IBookRepository {
  Future<List<Book>?> getAllNewBook();
  Future<BookDetail?> getDetailBook(String isbn);
  Future<List<Book>?> getBookByBookName(String paramSearch);

  factory IBookRepository() => BookApi();
}
