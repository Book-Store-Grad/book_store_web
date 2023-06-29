part of 'book_cubit.dart';

@immutable
abstract class BookState {}

class BookInitial extends BookState {}

class GetBookLoadingState extends BookState {}

class GetBookSuccessState extends BookState {
  final Book? book;

  GetBookSuccessState({required this.book});
}

class GetBookFileLoadingState extends BookState {}

class GetBookFileSuccessState extends BookState {}

class GetBookFileErrorState extends BookState {}
