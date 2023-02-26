import 'dart:async';

import 'package:book_app/domain/books/book_detail.dart';
import 'package:book_app/domain/books/book.dart';
import 'package:book_app/domain/books/i_book_repository.dart';
import 'package:book_app/infrastructure/books/book_detail_dto.dart';
import 'package:book_app/infrastructure/books/book_dto.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class BookApi implements IBookRepository {
  static final Dio _dio = Dio()
    ..options.headers = {
      'Content-Type': 'application/json',
    };

  static const String _urlRoot = 'https://api.itbook.store/1.0';
  static const Map<String, String> _urls = <String, String>{
    'getAllNewBook': '$_urlRoot/new',
    'getBookByBookName': '$_urlRoot/search/BOOK_NAME_PARAM',
    'getDetailBook': '$_urlRoot/books/ISBN_PARAM',
  };

  const BookApi();

  @override
  Future<List<Book>?> getAllNewBook() async {
    try {
      final response = await _dio.get(_urls['getAllNewBook']!);

      if (response.statusCode == 200) {
        return ResponseBookDto.fromJson(response.data!)
            .books
            .map((e) => e.toDomain())
            .toList();
      } else {
        throw Exception(response.statusCode);
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print("Error: ${e.toString()}");
      }
    }

    return null;
  }

  @override
  Future<List<Book>?> getBookByBookName(String paramSearch) async {
    try {
      final Response<Map<String, dynamic>> response = await _dio.get(
          _urls['getBookByBookName']!
              .replaceAll("BOOK_NAME_PARAM", paramSearch));
      return ResponseBookDto.fromJson(response.data!)
          .books
          .map((e) => e.toDomain())
          .toList();
    } on Exception catch (e) {
      if (kDebugMode) {
        print("Error: ${e.toString()}");
      }
    }

    return null;
  }

  @override
  Future<BookDetail?> getDetailBook(String isbn) async {
    try {
      final Response<Map<String, dynamic>> response = await _dio
          .get(_urls['getDetailBook']!.replaceAll("ISBN_PARAM", isbn));
      return BookDetailDto.fromJson(response.data!).toDomainAsBookDetail();
    } on Exception catch (e) {
      if (kDebugMode) {
        print("Error: ${e.toString()}");
      }
    }

    return null;
  }
}
