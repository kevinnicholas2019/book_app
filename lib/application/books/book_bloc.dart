import 'package:bloc/bloc.dart';
import 'package:book_app/domain/books/book.dart';
import 'package:book_app/domain/books/i_book_repository.dart';
import 'package:meta/meta.dart';

part 'book_event.dart';
part 'book_state.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  static final IBookRepository _bookRepository = IBookRepository();

  BookBloc() : super(BookInitial()) {
    on<BookNewLoaded>((event, emit) async {
      emit(BookLoadInProgress());
      final books = await _bookRepository.getAllNewBook();
      emit(BookLoadSuccess(books: books));
    });
    // on<BookDetailPressed>((event, emit) {
    //   emit(BookLoadInProgress());
    //   emit(BookLoadSuccess());
    // });
    // on<BookSearch>((event, emit) {
    //   // TODO: implement event handler
    // });
  }
}
