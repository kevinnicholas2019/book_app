import 'dart:async';

import 'package:book_app/domain/books/book_detail.dart';
import 'package:book_app/domain/books/book.dart';
import 'package:book_app/domain/books/i_book_repository.dart';
import 'package:book_app/infrastructure/books/book_detail_dto.dart';
import 'package:book_app/infrastructure/books/book_dto.dart';
import 'package:dio/dio.dart';

class BookApi implements IBookRepository {
  static const String urlRoot = 'https://api.itbook.store/1.0';
  static const Map<String, String> urls = <String, String>{
    'getAllNewBook': '$urlRoot/new/',
    'getBookByBookName': '$urlRoot/search/BOOK_NAME_PARAM',
    'getDetailBook': '$urlRoot/books/ISBN_PARAM',
  };

  @override
  Future<List<Book>> getAllNewBook() async {
    try {
      final dio = Dio();
      final Response<Map<String, dynamic>> response =
          await dio.get(urls['getAllNewBook']!);
      return ResponseBookDto.fromJson(response.data!)
          .books
          .map((e) => e.toDomain())
          .toList();
    } on Exception catch (e) {
      print("Error: ${e.toString()}");
      return <Book>[];
    }
  }

  @override
  Future<List<Book>> getBookByBookName(String paramSearch) async {
    try {
      final dio = Dio();
      final Response<Map<String, dynamic>> response = await dio.get(
          urls['getBookByBookName']!
              .replaceAll("BOOK_NAME_PARAM", paramSearch));
      return ResponseBookDto.fromJson(response.data!)
          .books
          .map((e) => e.toDomain())
          .toList();
    } on Exception catch (e) {
      print("Error: ${e.toString()}");
      return <Book>[];
    }
  }

  @override
  Future<BookDetail> getDetailBook(String isbn) async {
    try {
      final dio = Dio();
      final Response<Map<String, dynamic>> response =
          await dio.get(urls['getDetailBook']!.replaceAll("ISBN_PARAM", isbn));
      return BookDetailDto.fromJson(response.data!).toDomain();
    } on Exception catch (e) {
      print("Error: ${e.toString()}");
      return BookDetail.empty();
    }
  }
}
