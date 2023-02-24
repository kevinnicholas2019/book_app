import 'package:book_app/domain/books/book.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BookDetailWidget extends StatelessWidget {
  final Book _book;
  const BookDetailWidget({super.key, book}) : _book = book;

  @override
  Widget build(BuildContext context) {
    const TextStyle textStyle = TextStyle(
      fontSize: 18,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Container(
            color: Colors.white70,
            child: ListView(
              children: [
                Container(
                  width: double.infinity,
                  height: 400,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: CachedNetworkImageProvider(
                        _book.imageUrl.value,
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        spreadRadius: 1,
                        blurRadius: 10,
                      ),
                    ],
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Expanded(
                            flex: 2,
                            child: Text(
                              'Title: ',
                              style: textStyle,
                            ),
                          ),
                          Expanded(
                            flex: 8,
                            child: Text(
                              _book.title.value,
                              style: textStyle.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Expanded(
                            flex: 2,
                            child: Text(
                              'Price: ',
                              style: textStyle,
                            ),
                          ),
                          Expanded(
                            flex: 8,
                            child: Text(
                              "\$ ${_book.price.value.toStringAsFixed(2)}",
                              style: textStyle,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Expanded(
                            flex: 2,
                            child: Text(
                              'ISBN13: ',
                              style: textStyle,
                            ),
                          ),
                          Expanded(
                            flex: 8,
                            child: Text(
                              _book.isbn13.value,
                              style: textStyle,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: SafeArea(
            child: TextButton(
              onPressed: () async {
                await launchUrl(Uri.parse(_book.url.value));
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
    );
  }
}
