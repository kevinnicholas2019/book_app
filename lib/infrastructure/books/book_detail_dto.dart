import 'package:book_app/domain/books/book.dart';
import 'package:book_app/domain/books/book_detail.dart';
import 'package:book_app/domain/books/value_objects.dart';
import 'package:book_app/infrastructure/books/book_dto.dart';

class BookDetailDto extends BookDto {
  final String error;
  final String authors;
  final String publisher;
  final String isbn10;
  final String pages;
  final String year;
  final String rating;
  final String description;

  BookDetailDto({
    required this.error,
    required this.authors,
    required this.publisher,
    required this.isbn10,
    required this.pages,
    required this.year,
    required this.rating,
    required this.description,
    required super.title,
    required super.subtitle,
    required super.isbn13,
    required super.price,
    required super.image,
    required super.url,
  });

  factory BookDetailDto.fromJson(Map<String, dynamic> json) => BookDetailDto(
        error: json['error'] as String,
        authors: json['authors'] as String,
        publisher: json['publisher'] as String,
        isbn10: json['isbn10'] as String,
        pages: json['pages'] as String,
        year: json['year'] as String,
        rating: json['rating'] as String,
        description: json['description'] as String,
        title: json['title'] as String,
        subtitle: json['subtitle'] as String,
        isbn13: json['isbn13'] as String,
        price: json['price'] as String,
        image: json['image'] as String,
        url: json['url'] as String,
      );

  BookDetail toDomainAsBookDetail() => BookDetail(
        Book(
          isbn13: Isbn13(isbn13),
          title: Title(title),
          subtitle: Subtitle(subtitle),
          price: Price(price),
          imageUrl: ImageUrl(image),
          url: Url(url),
        ),
        error: Error(error),
        authors: authors.split(",").map((e) => Author(e)).toList(),
        publisher: Publisher(publisher),
        isbn10: Isbn10(isbn10),
        pages: Pages(pages),
        year: Year(year),
        rating: Rating(rating),
        description: Description(description),
      );
}
