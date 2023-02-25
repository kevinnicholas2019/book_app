import 'package:book_app/presentation/pages/books/widget/book_detail_widget.dart';
import 'package:flutter/material.dart';

class BookDetailPageWidget extends StatelessWidget {
  const BookDetailPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book App Detail'),
      ),
      body: const BookDetailWidget(),
    );
  }
}
