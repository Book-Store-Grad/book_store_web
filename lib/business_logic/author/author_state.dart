part of 'author_cubit.dart';

@immutable
abstract class AuthorState {}

class AuthorInitial extends AuthorState {}

class AddBookLoadingState extends AuthorState {}

class AddBookSuccessState extends AuthorState {}

class AddBookFailureState extends AuthorState {}

class DeleteBookLoadingState extends AuthorState {}

class DeleteBookSuccessState extends AuthorState {}

class DeleteBookFailureState extends AuthorState {}
