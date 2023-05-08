part of 'book_cubit.dart';

@immutable
abstract class BookState {}

class BookInitial extends BookState {}

class GetBookLoadingState extends BookState {}

class GetBookSuccessState extends BookState {
  final Book? book;

  GetBookSuccessState({required this.book});
}
