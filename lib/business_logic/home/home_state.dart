part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class SelectNavItemState extends HomeState {}

class SearchState extends HomeState {}

class ClearSearchState extends HomeState {}

class GetAllBooksLoadingState extends HomeState {}

class GetAllBooksSuccessState extends HomeState {}



