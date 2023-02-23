import 'package:book_app/presentation/pages/books/book_page.dart';
import 'package:flutter/material.dart';

String initialRoute() => '/';

Map<String, WidgetBuilder> routes() => <String, WidgetBuilder>{
      '/': (context) => BookPage(),
    };
