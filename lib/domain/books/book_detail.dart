import 'package:book_app/domain/books/book.dart';
import 'package:book_app/domain/books/value_objects.dart';
import 'package:book_app/domain/core/i_entities.dart';

class BookDetail extends Book implements IEntities {
  final Error error;
  final List<Author> authors;
  final Publisher publisher;
  final Isbn10 isbn10;
  final Pages pages;
  final Year year;
  final Rating rating;
  final Description description;

  BookDetail({
    required this.error,
    required this.authors,
    required this.publisher,
    required this.isbn10,
    required this.pages,
    required this.year,
    required this.rating,
    required this.description,
    required super.isbn13,
    required super.title,
    required super.subtitle,
    required super.price,
    required super.imageUrl,
    required super.url,
  });

  factory BookDetail.empty() => BookDetail(
        error: Error(''),
        authors: [],
        publisher: Publisher(''),
        isbn10: Isbn10(''),
        pages: Pages(''),
        year: Year(''),
        rating: Rating(''),
        description: Description(''),
        isbn13: Isbn13(''),
        title: Title(''),
        subtitle: Subtitle(''),
        price: Price(''),
        imageUrl: ImageUrl(''),
        url: Url(''),
      );
}
