
import 'dart:html';

import 'package:bloc/bloc.dart';
import 'package:book_store_web/features/book/repository/book_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import '../../core/constants/api_constants.dart';
import '../../models/book.dart';

part 'book_state.dart';

class BookCubit extends Cubit<BookState> {
  BookCubit() : super(BookInitial());

  // Repository
  BookRepository bookRepository = BookRepository();

  // Get A Book
  Future<void> getBook({
    required int id,
  }) async {
    emit(GetBookLoadingState());
    Response response = await bookRepository.getBook(id: id);
    Book book = Book.fromJson(response.data["content"]["book"]);
    emit(
      GetBookSuccessState(book: book),
    );
  }

  // Get Book File
  Future<void> getBookFile({
    required int bookId,
  }) async {
    emit(GetBookFileLoadingState());
    // Response response = await bookRepository.getBookFile(bookId: bookId);
    emit(GetBookFileSuccessState());
  }
}
