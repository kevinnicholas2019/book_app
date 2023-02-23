import 'package:book_app/domain/core/i_unique_id.dart';
import 'package:book_app/domain/core/i_value_objects.dart';

class Error implements IValueObject<int> {
  @override
  final int value;

  factory Error(String input) {
    return Error._(int.parse(input));
  }

  const Error._(this.value);
}

class Title implements IValueObject<String> {
  @override
  final String value;

  factory Title(String input) {
    return Title._(input);
  }

  const Title._(this.value);
}

class Subtitle implements IValueObject<String> {
  @override
  final String value;

  factory Subtitle(String input) {
    return Subtitle._(input);
  }

  const Subtitle._(this.value);
}

class Isbn10 implements IValueObject<String>, IUniqueId {
  @override
  final String value;

  factory Isbn10(String input) {
    return Isbn10._(input);
  }

  const Isbn10._(this.value);
}

class Isbn13 implements IValueObject<String>, IUniqueId {
  @override
  final String value;

  factory Isbn13(String input) {
    return Isbn13._(input);
  }

  const Isbn13._(this.value);
}

class Price implements IValueObject<double> {
  @override
  final double value;

  factory Price(String input) {
    return Price._(double.parse(input.replaceFirst("\$", "")));
  }

  const Price._(this.value);
}

class ImageUrl implements IValueObject<String> {
  @override
  final String value;

  factory ImageUrl(String input) {
    return ImageUrl._(input);
  }

  const ImageUrl._(this.value);
}

class Url implements IValueObject<String> {
  @override
  final String value;

  factory Url(String input) {
    return Url._(input);
  }

  const Url._(this.value);
}

class Publisher implements IValueObject<String> {
  @override
  final String value;

  factory Publisher(String input) {
    return Publisher._(input);
  }

  const Publisher._(this.value);
}

class Author implements IValueObject<String> {
  @override
  final String value;

  factory Author(String input) {
    return Author._(input);
  }

  const Author._(this.value);
}

class Language implements IValueObject<String> {
  @override
  final String value;

  factory Language(String input) {
    return Language._(input);
  }

  const Language._(this.value);
}

class Pages implements IValueObject<int> {
  @override
  final int value;

  factory Pages(String input) {
    return Pages._(int.parse(input));
  }

  const Pages._(this.value);
}

class Year implements IValueObject<int> {
  @override
  final int value;

  factory Year(String input) {
    return Year._(int.parse(input));
  }

  const Year._(this.value);
}

class Rating implements IValueObject<int> {
  @override
  final int value;

  factory Rating(String input) {
    return Rating._(int.parse(input));
  }

  const Rating._(this.value);
}

class Description implements IValueObject<String> {
  @override
  final String value;

  factory Description(String input) {
    return Description._(input);
  }

  const Description._(this.value);
}

class Pdf implements IValueObject<Map<String, String>> {
  @override
  final Map<String, String> value;

  factory Pdf(Map<String, String> input) {
    return Pdf._(input);
  }

  const Pdf._(this.value);
}
