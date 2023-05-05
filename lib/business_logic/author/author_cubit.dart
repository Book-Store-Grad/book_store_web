import 'package:book_store_web/features/author/repositories/author_repository.dart';
import 'package:book_store_web/schemas/book_schema.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'author_state.dart';

class AuthorCubit extends Cubit<AuthorState> {
  AuthorCubit() : super(AuthorInitial());

  BookSchema bookSchema =
      BookSchema(name: '', description: '', category: '', price: '');
  final addBookFormKey = GlobalKey<FormState>();
  AuthorRepository authorRepository = AuthorRepository();

  Future<void> addBook() async {
    emit(AddBookLoadingState());
    Response response =
        await authorRepository.addBook(data: bookSchema.toJson());
    if (response.statusCode == 200) {
      emit(AddBookSuccessState());
      Future.delayed(
        const Duration(seconds: 1),
        () {
          emit(AuthorInitial());
        },
      );
    } else if (response.statusCode == 400) {
      emit(AddBookFailureState());
    }
  }

  Future<void> deleteBook({
    required int id,
  }) async {
    emit(DeleteBookLoadingState());
    Response response = await authorRepository.deleteBook(id: id);
    print(response.data);
    if (response.statusCode == 200) {
      emit(DeleteBookSuccessState());
      Future.delayed(
        const Duration(seconds: 2),
        () {
          emit(AuthorInitial());
        },
      );
    } else if (response.statusCode == 400) {
      emit(DeleteBookFailureState());
    }
  }
}
