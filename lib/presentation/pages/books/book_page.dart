import 'package:book_app/application/books/book_bloc.dart';
import 'package:book_app/presentation/pages/books/widget/book_widget.dart';
import 'package:breakpoint/breakpoint.dart';
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
            case BookLoadFailure:
              EasyLoading.dismiss();
              return Center(
                child: TextButton(
                  style: ButtonStyle(
                    iconColor: MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    ),
                  ),
                  onPressed: () {
                    _bookBloc.add(BookNewLoaded());
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text(
                        'Retry',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Icon(Icons.refresh),
                    ],
                  ),
                ),
              );
            case BookLoadSuccess:
              EasyLoading.dismiss();
              break;
          }

          return LayoutBuilder(builder: (_, constraints) {
            final breakpoint = Breakpoint.fromConstraints(constraints);
            return Container(
              padding: EdgeInsets.all(breakpoint.gutters),
              child: GridView.builder(
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
              ),
            );
          });
        },
      ),
    );
  }
}
