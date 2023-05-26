part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class SelectNavItemState extends HomeState {}

class SearchLoading extends HomeState {}

class SearchEmptyState extends HomeState {}

class SearchState extends HomeState {}

class SearchSuccess extends HomeState {
  final List<Book> searchedBooks;

  SearchSuccess({required this.searchedBooks});
}

class ClearSearchState extends HomeState {}

class GetAllBooksLoadingState extends HomeState {}

class GetAllBooksSuccessState extends HomeState {}
