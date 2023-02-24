import 'package:book_app/domain/books/book.dart';
import 'package:book_app/presentation/pages/books/widget/book_detail_widget.dart';
import 'package:flutter/material.dart';

class BookDetailPageWidget extends StatelessWidget {
  final Book _book;
  const BookDetailPageWidget({super.key, book}) : _book = book;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book App Detail'),
      ),
      body: BookDetailWidget(
        book: _book,
      ),
    );
  }
}
