import 'package:book_app/application/books/book_bloc.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class BookPage extends StatelessWidget {
  final BookBloc _bookBloc = BookBloc();

  BookPage({super.key}) {
    _bookBloc.add(BookNewLoaded());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EasySearchBar(
        title: const Text('Book App'),
        onSearch: (p0) => "",
      ),
      body: BlocConsumer<BookBloc, BookState>(
        bloc: _bookBloc,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case BookLoadInProgress:
              EasyLoading.show(status: 'loading...');
              break;
            case BookLoadSuccess:
              EasyLoading.dismiss();
              break;
          }
          return Scrollable(
            viewportBuilder: (_, position) {
              return GridView.count(
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: state.books
                    .map(
                      (e) => Container(
                        child: Text(e.title.value),
                      ),
                    )
                    .toList(),
              );
            },
          );
        },
      ),
    );
  }
}
