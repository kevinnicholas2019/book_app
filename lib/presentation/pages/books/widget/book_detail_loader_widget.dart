import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:html_character_entities/html_character_entities.dart';

import 'package:book_app/application/books/book_bloc.dart';
import 'package:book_app/domain/books/book_detail.dart';
import 'package:book_app/presentation/pages/books/widget/book_detail_row_widget.dart';
import 'package:book_app/presentation/utils/retry_widget.dart';

class BookDetailLoaderWidget extends StatelessWidget {
  const BookDetailLoaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const TextStyle textStyle = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w300,
    );

    return Stack(
      children: [
        BlocBuilder<BookBloc, BookState>(
          builder: (context, state) {
            final Widget chooseWidget;

            if (state is BookDetailLoadInProgress) {
              chooseWidget = const Center(child: CircularProgressIndicator());
            } else if (state is BookDetailLoadFailure) {
              chooseWidget = RetryWidget(
                onPressed: () => BlocProvider.of<BookBloc>(context).add(
                  BookDetailPressed(book: state.currentBook!),
                ),
              );
            } else if (state is BookDetailLoadSuccess) {
              final BookDetail bookDetail = state.currentBookDetail;

              chooseWidget = Column(
                children: [
                  BookDetailRowWidget(
                    'Authors',
                    bookDetail.authors.map((e) => e.value).join(", "),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  BookDetailRowWidget(
                    'Publisher',
                    bookDetail.publisher.value,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  BookDetailRowWidget(
                    'ISBN10',
                    bookDetail.isbn10.value,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  BookDetailRowWidget(
                    'Pages',
                    bookDetail.pages.value.toString(),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  BookDetailRowWidget(
                    'Year',
                    bookDetail.year.value.toString(),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  BookDetailRowWidget(
                    'Rating',
                    [
                      for (var i = 0; i < bookDetail.rating.value; i++) '⭐',
                      for (var i = 0; i < 5 - bookDetail.rating.value; i++) '⚝',
                      bookDetail.rating.value > 0
                          ? ' (${bookDetail.rating.value}.0 rates)'
                          : ' (No Rate)',
                    ].join(""),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  BookDetailRowWidget(
                    'Description',
                    HtmlCharacterEntities.decode(
                      bookDetail.description.value,
                    ),
                  ),
                ],
              );
            } else {
              chooseWidget = const Center(child: Text('Something wrong...'));
            }

            return Container(
              clipBehavior: Clip.none,
              margin: const EdgeInsets.only(
                top: 38,
                bottom: 20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10).copyWith(
                  topLeft: Radius.zero,
                ),
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
              child: chooseWidget,
            );
          },
        ),
        Container(
          width: 135,
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.symmetric(
            horizontal: 15.0,
            vertical: 5.0,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10).copyWith(
              bottomLeft: Radius.zero,
              bottomRight: Radius.zero,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.175),
                spreadRadius: 1,
                blurRadius: 10,
              ),
            ],
            color: Colors.white,
          ),
          child: Text(
            'Book Detail',
            style: textStyle.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 35),
          color: Colors.lightGreen.withOpacity(0.85),
          width: 135 + 1,
          height: 3,
        ),
      ],
    );
  }
}
