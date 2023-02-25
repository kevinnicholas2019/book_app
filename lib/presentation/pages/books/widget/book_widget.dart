import 'package:book_app/application/books/book_bloc.dart';
import 'package:book_app/domain/books/book.dart';
import 'package:book_app/presentation/pages/books/book_detail_page_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookWidget extends StatelessWidget {
  final Book _book;

  const BookWidget({super.key, required book}) : _book = book;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      autofocus: true,
      onTap: () async {
        BlocProvider.of<BookBloc>(context).add(BookDetailPressed(book: _book));
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const BookDetailPageWidget(),
          ),
        );
      },
      child: Ink(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 1.0,
              blurRadius: 10,
            ),
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                height: 225,
                child: CachedNetworkImage(
                  imageUrl: _book.imageUrl.value,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.lightGreen.withOpacity(0.5),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: Center(
                  child: Text(
                    _book.title.value.length <= 60
                        ? _book.title.value.trim()
                        : "${_book.title.value.substring(0, 60 - 3)}...",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
