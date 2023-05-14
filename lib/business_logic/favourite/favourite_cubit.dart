import 'package:bloc/bloc.dart';
import 'package:book_store_web/features/favorites/repository/favorite_repository.dart';
import 'package:book_store_web/models/favourite.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit() : super(FavouriteInitial());

  FavRepository favRepository = FavRepository();

  List<Favourite> favItems = [];

  Future<void> getAllFavItems() async {
    emit(GetAllFavouriteLoading());
    Response response = await favRepository.getAllFavourites();
    favItems.clear();
    response.data["content"]["favorites"].forEach(
      (e) => favItems.add(Favourite.fromJson(e)),
    );
    for (var favId in favItems) {
      print("This is fav ID: $favId.favId");
    }
    emit(GetAllFavouriteSuccess());
  }

  Future<void> addToFavourite({
    required int bookId,
  }) async {
    emit(AddToFavouriteLoading());
    Response response = await favRepository.addToFav(bookId: bookId);
    if (response.statusCode == 200) {
      print("add to Fav done");
      emit(AddToFavouriteSuccess());
    }
  }

  Future<void> removeFromFav({
    required int favId,
  }) async {
    emit(RemoveFromFavouriteLoading());
    try {
      Response response = await favRepository.removeFromFav(favId: favId);
      if (response.statusCode == 200) {
        favItems.removeWhere((element) => element.favId == favId);
        emit(RemoveFromFavouriteSuccess());
      }
    } catch (e) {
      emit(RemoveFromFavouriteError());
    }
  }
}
