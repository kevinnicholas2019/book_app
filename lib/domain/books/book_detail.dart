import 'package:book_app/domain/books/book.dart';
import 'package:book_app/domain/books/value_objects.dart';
import 'package:book_app/domain/core/i_entities.dart';
import 'package:book_app/domain/core/i_unique_id.dart';

class BookDetail implements IEntities {
  final Book book;
  final Error error;
  final List<Author> authors;
  final Publisher publisher;
  final Isbn10 isbn10;
  final Pages pages;
  final Year year;
  final Rating rating;
  final Description description;

  BookDetail(
    this.book, {
    required this.error,
    required this.authors,
    required this.publisher,
    required this.isbn10,
    required this.pages,
    required this.year,
    required this.rating,
    required this.description,
  });

  factory BookDetail.empty(Book book) => BookDetail(
        book,
        error: Error(''),
        authors: [],
        publisher: Publisher(''),
        isbn10: Isbn10(''),
        pages: Pages(''),
        year: Year(''),
        rating: Rating(''),
        description: Description(''),
      );

  factory BookDetail.fromBook(
    Book book, {
    error,
    authors,
    publisher,
    isbn10,
    pages,
    year,
    rating,
    description,
  }) =>
      BookDetail(
        book,
        error: error,
        authors: authors,
        publisher: publisher,
        isbn10: isbn10,
        pages: pages,
        year: year,
        rating: rating,
        description: description,
      );

  @override
  IUniqueId get id => isbn10;
}
