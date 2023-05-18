part of 'author_cubit.dart';

@immutable
abstract class AuthorState {}

class AuthorInitial extends AuthorState {}

class AddBookLoadingState extends AuthorState {}

class AddBookSuccessState extends AuthorState {}

class AddBookErrorState extends AuthorState {}

class AddBookImageLoadingState extends AuthorState {}

class AddBookImageSuccessState extends AuthorState {}

class AddBookImageErrorState extends AuthorState {}

class AddBookFileLoadingState extends AuthorState {}

class AddBookFileSuccessState extends AuthorState {}

class AddBookFileErrorState extends AuthorState {}

class DeleteBookLoadingState extends AuthorState {}

class DeleteBookSuccessState extends AuthorState {}

class DeleteBookFailureState extends AuthorState {}

class ChooseBookImageState extends AuthorState {}

class ChooseFileState extends AuthorState {}