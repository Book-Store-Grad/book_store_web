part of 'favourite_cubit.dart';

@immutable
abstract class FavouriteState {}

class FavouriteInitial extends FavouriteState {}

class GetAllFavouriteLoading extends FavouriteState {}

class GetAllFavouriteSuccess extends FavouriteState {}

class GetAllFavouriteError extends FavouriteState {}

class AddToFavouriteLoading extends FavouriteState {}

class AddToFavouriteSuccess extends FavouriteState {}

class AddToFavouriteError extends FavouriteState {}

class RemoveFromFavouriteLoading extends FavouriteState {}

class RemoveFromFavouriteSuccess extends FavouriteState {}

class RemoveFromFavouriteError extends FavouriteState {}

class FavouriteRefresh extends FavouriteState {}
