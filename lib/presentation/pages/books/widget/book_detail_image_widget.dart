import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BookDetailImageWidget extends StatelessWidget {
  final String imageUrl;

  const BookDetailImageWidget({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fitHeight,
          image: CachedNetworkImageProvider(
            imageUrl,
          ),
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
    );
  }
}
