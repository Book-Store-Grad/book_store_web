import 'dart:io';

import 'package:book_store_web/core/constants/api_constants.dart';
import 'package:book_store_web/core/constants/app_constants.dart';
import 'package:book_store_web/features/author/repositories/author_repository.dart';
import 'package:book_store_web/network/remote/dio_helper.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../models/book.dart';

part 'author_state.dart';

class AuthorCubit extends Cubit<AuthorState> {
  AuthorCubit() : super(AuthorInitial());

  // BookSchema bookSchema =
  //     BookSchema(name: '', description: '', genre: '', price: '',authorId: 32);
  final addBookFormKey = GlobalKey<FormState>();
  AuthorRepository authorRepository = AuthorRepository();

  // Future<void> addBook() async {
  //   emit(AddBookLoadingState());
  //   Response response =
  //       await authorRepository.addBook(data: bookSchema.toJson());
  //   if (response.statusCode == 200) {
  //     emit(AddBookSuccessState());
  //     Future.delayed(
  //       const Duration(seconds: 1),
  //       () {
  //         emit(AuthorInitial());
  //       },
  //     );
  //   } else {
  //     emit(AddBookErrorState());
  //   }
  // }

  void addBookData({
    required int autorId,
    required String name,
    required String genre,
    required String description,
    required String price,
  }) {
    emit(AddBookLoadingState());
    DioHelper.postData(url: ApiConstants.book, token: token, data: {
      "name": "name",
      "description": "description",
      "genre": "genre",
      "author_id": 32,
      "price": "price"
    }).then((value) {
      if (value.statusCode == 200) {
        print("Book Data Uploaded Successfully !");
        emit(AddBookSuccessState());
      } else {
        print("Something went wrong !");
      }
    }).catchError((e) {
      emit(AddBookErrorState());
    });
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

  File? image;
  Uint8List webBookImage = Uint8List(8);

  chooseBookImage() async {
    final _pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (_pickedFile != null) {
      webBookImage = await _pickedFile.readAsBytes();
      image = File(_pickedFile.path);
    }
    emit(ChooseBookImageState());
  }

  void addBookImage({required int bookId}) async {
    emit(AddBookImageLoadingState());
    DioHelper.postData(
        containImage: true,
        url: "${ApiConstants.book}/9/image",
        token: token,
        data: {
          "book_id": 9,
          "image": await MultipartFile.fromBytes(
            webBookImage,
            filename: image!.path.split('/').last,
          ),
        }).then((value) {
      print("This is status code:${value.statusCode}");
      if (value.statusCode == 200) {
        print("This Book Image Updated Successfully !");
      } else {
        print("Somthing went wrong !");
      }
      emit(AddBookImageSuccessState());
    }).catchError((e) {
      emit(AddBookImageErrorState());
    });
  }

  Uint8List webBookFile = Uint8List(8);

  chooseFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    try {
      if (result != null) {
        webBookFile = await result.files.first.bytes!;
      } else {
        print("error in file picker function !");
      }
      emit(ChooseFileState());
    } catch (e) {
      print("This is e: $e");
    }
  }

  Future<void> addBookFile({required int bookId}) async {
    emit(AddBookFileLoadingState());
    DioHelper.postData(
        containImage: true,
        url: "${ApiConstants.book}/2/file",
        token: token,
        data: {
          "book_id": 2,
          "file": await MultipartFile.fromBytes(
            webBookFile,
            // filename: filepath!.split('/').last,
          ),
        }).then((value) {
      if (value.statusCode == 200) {
        print(
            "This is status code:  ${value.statusCode}/This is data:${value.data}");
        print("File Updated Successfully !");
      } else {
        print(
            "This is status code:  ${value.statusCode}/This is data:${value.data}");
      }
      //  print("File Path: $fileBytes");
      emit(AddBookFileSuccessState());
    }).catchError((e) {
      emit(AddBookFileErrorState());
    });
  }

  List<Book> authorBooks = [];

  Future<void> getAuthorBooks() async {
    emit(GetAuthorBooksLoadingState());
    Response response = await authorRepository.getAuthorBooks();
    try {
      if (response.statusCode == 200) {
        print("Get Author Books Success !");
        authorBooks.clear();
        response.data["content"]["books"].forEach((book) => authorBooks.add(Book.fromJson(book)));
        print(authorBooks.length);
        emit(GetAuthorBooksSuccessState());
      } else {
        print("not dooooone");
      }
    } catch (e) {
      emit(GetAuthorBooksErrorState());
      print(e.toString());
    }
  }
}
