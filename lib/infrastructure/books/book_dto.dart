import 'package:book_app/domain/books/book.dart';
import 'package:book_app/domain/books/value_objects.dart';

class ResponseBookDto {
  final int total;
  final List<BookDto> books;

  ResponseBookDto._({
    required this.total,
    required this.books,
  });

  factory ResponseBookDto.fromJson(Map<String, dynamic> json) =>
      ResponseBookDto._(
        total: int.parse(json['total'] as String),
        books: (json['books'] as List).map((e) => BookDto.fromJson(e)).toList(),
      );
}

class BookDto {
  final String title;
  final String subtitle;
  final String isbn13;
  final String price;
  final String image;
  final String url;

  BookDto({
    required this.title,
    required this.subtitle,
    required this.isbn13,
    required this.price,
    required this.image,
    required this.url,
  });

  factory BookDto.fromJson(Map<String, dynamic> json) => BookDto(
        title: json['title'] as String,
        subtitle: json['subtitle'] as String,
        isbn13: json['isbn13'] as String,
        price: json['price'] as String,
        image: json['image'] as String,
        url: json['url'] as String,
      );

  Book toDomain() => Book(
        isbn13: Isbn13(isbn13),
        title: Title(title),
        subtitle: Subtitle(subtitle),
        price: Price(price),
        imageUrl: ImageUrl(image),
        url: Url(url),
      );
}
