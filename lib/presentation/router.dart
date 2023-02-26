import 'package:flutter/material.dart';

import 'package:book_app/presentation/pages/books/book_detail_page_widget.dart';
import 'package:book_app/presentation/pages/books/book_page.dart';

String initialRoute() => '/';

Map<String, WidgetBuilder> routes() => <String, WidgetBuilder>{
      '/': (context) => const BookPage(),
      '/book-detail': (context) => const BookDetailPageWidget(),
    };
