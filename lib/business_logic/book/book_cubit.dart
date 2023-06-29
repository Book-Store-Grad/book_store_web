

import 'package:bloc/bloc.dart';
import 'package:book_store_web/core/constants/api_constants.dart';
import 'package:book_store_web/features/book/repository/book_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import '../../core/constants/app_constants.dart';
import '../../models/book.dart';
import '../../network/remote/dio_helper.dart';

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


  void getBookFile({required int bookId, required String bName}) async {
    emit(GetBookLoadingState());
    DioHelper.downloadFile(
      url: '${ApiConstants.book}/$bookId/file',
      token: token,
      path: '/storage/emulated/0/Download/$bName.pdf',
    ).then((value) {
      if (value.statusCode == 200) {
        print('Book File Downloaded get Successfully !');
        print(value.statusCode);
        print(value.data);
      }
      emit(GetBookFileSuccessState());
    }).catchError((onError) {
      emit(GetBookFileErrorState());
      print(onError.toString());
    });
  }
}

