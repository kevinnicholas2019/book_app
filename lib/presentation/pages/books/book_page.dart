import 'package:book_app/application/books/book_bloc.dart';
import 'package:book_app/presentation/pages/books/widget/book_widget.dart';
import 'package:book_app/presentation/utils/retry_widget.dart';
import 'package:breakpoint/breakpoint.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class BookPage extends StatelessWidget {
  const BookPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bookBloc = BlocProvider.of<BookBloc>(context);
    bookBloc.add(BookNewLoaded());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Book App'),
      ),
      body: BlocBuilder<BookBloc, BookState>(
        bloc: bookBloc,
        builder: (context, state) {
          switch (state.runtimeType) {
            case BookLoadInProgress:
              EasyLoading.show(status: 'loading...');
              break;
            case BookLoadFailure:
              EasyLoading.dismiss();
              return Center(
                child: RetryWidget(
                  onPressed: () => bookBloc.add(BookNewLoaded()),
                ),
              );
            case BookLoadSuccess:
              EasyLoading.dismiss();
              break;
          }

          return LayoutBuilder(builder: (_, constraints) {
            final breakpoint = Breakpoint.fromConstraints(constraints);
            return GridView.builder(
              padding: EdgeInsets.all(breakpoint.gutters),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: (breakpoint.columns / 6).ceil() + 1,
                crossAxisSpacing: breakpoint.gutters,
                mainAxisSpacing: breakpoint.gutters,
                mainAxisExtent: 375,
              ),
              itemCount: state.books.length,
              itemBuilder: (_, index) {
                return BookWidget(book: state.books[index]);
              },
            );
          });
        },
      ),
    );
  }
}
