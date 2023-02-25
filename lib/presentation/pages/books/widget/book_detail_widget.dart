import 'package:book_app/application/books/book_bloc.dart';
import 'package:book_app/presentation/pages/books/widget/book_detail_image_widget.dart';
import 'package:book_app/presentation/pages/books/widget/book_detail_loader_widget.dart';
import 'package:book_app/presentation/pages/books/widget/book_detail_row_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class BookDetailWidget extends StatelessWidget {
  const BookDetailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookBloc, BookState>(
      builder: (context, state) {
        final book = state.currentBook;

        if (book == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return Container(
          color: Colors.white38,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Container(
                  color: Colors.white70,
                  child: ListView(
                    children: [
                      BookDetailImageWidget(imageUrl: book.imageUrl.value),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.175),
                                spreadRadius: 1,
                                blurRadius: 10,
                              ),
                            ],
                            color: Colors.white,
                          ),
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            children: [
                              BookDetailRowWidget(
                                'Title',
                                book.title.value,
                                valueTextStyle: BookDetailRowWidget
                                    .defaulTextStyle
                                    .copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              BookDetailRowWidget(
                                'Price',
                                "\$ ${book.price.value.toStringAsFixed(2)}",
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              BookDetailRowWidget(
                                'ISBN13',
                                book.isbn13.value,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        child: BookDetailLoaderWidget(),
                      ),
                    ],
                  ),
                ),
              ),
              SafeArea(
                child: SizedBox(
                  height: 45,
                  child: TextButton(
                    onPressed: () async {
                      await launchUrl(
                        Uri.parse(book.url.value),
                        mode: LaunchMode.externalApplication,
                      );
                    },
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        Colors.blue,
                      ),
                      overlayColor: MaterialStatePropertyAll(
                        Colors.black12,
                      ),
                      foregroundColor: MaterialStatePropertyAll(
                        Colors.white,
                      ),
                      textStyle: MaterialStatePropertyAll(
                        TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    child: const Text('Buy'),
                  ),
                ),
              ),
            ],
          ),
        );

        // if (state is BookDetailLoadInProgress) {
        //   return const Center(
        //     child: CircularProgressIndicator(),
        //   );
        // } else if (state is BookDetailLoadSuccess) {
        //   final book = state.currentBook!;
        //   final bookDetail = state.currentBookDetail;

        // }

        // return Center(
        //   child: RetryWidget(
        //     onPressed: () => BlocProvider.of<BookBloc>(context)
        //         .add(BookDetailPressed(book: currentBook)),
        //   ),
        // );
      },
    );
  }
}
