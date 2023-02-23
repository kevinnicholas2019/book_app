import 'package:book_app/domain/books/value_objects.dart';
import 'package:book_app/domain/core/i_entities.dart';
import 'package:book_app/domain/core/i_unique_id.dart';

class Book implements IEntities {
  final Isbn13 isbn13;
  final Title title;
  final Subtitle subtitle;
  final Price price;
  final ImageUrl imageUrl;
  final Url url;

  const Book({
    required this.isbn13,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.imageUrl,
    required this.url,
  });

  factory Book.empty() => Book(
        isbn13: Isbn13(''),
        title: Title(''),
        subtitle: Subtitle(''),
        price: Price('\$0.0'),
        imageUrl: ImageUrl(''),
        url: Url(''),
      );

  @override
  IUniqueId get id => isbn13;
}
