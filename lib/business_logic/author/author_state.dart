part of 'author_cubit.dart';

@immutable
abstract class AuthorState {}

class AuthorInitial extends AuthorState {}

class AddBookLoadingState extends AuthorState {}

class AddBookSuccessState extends AuthorState {

  AddBookSuccessState();
}

class AddBookFailureState extends AuthorState {}
