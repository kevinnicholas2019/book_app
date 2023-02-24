import 'package:book_app/application/books/book_bloc.dart';
import 'package:book_app/presentation/router.dart';
import 'package:book_app/presentation/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Book App',
        theme: theme(),
        initialRoute: initialRoute(),
        routes: routes(),
        builder: EasyLoading.init(),
      ),
    );
  }
}
