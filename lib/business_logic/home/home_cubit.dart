import 'package:book_store_web/features/home/repository/home_repository.dart';
import 'package:book_store_web/models/book.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final ScrollController scrollController = ScrollController();
  final GlobalKey homeKey = GlobalKey();
  final GlobalKey linguisticsKey = GlobalKey();
  final GlobalKey selfDevelopmentKey = GlobalKey();
  final GlobalKey technologiesKey = GlobalKey();
  int selectedNavItemIndex = 0;

  void selectNavItem(int index, HomeSections section) {
    selectedNavItemIndex = index;
    emit(SelectNavItemState());
    switch (section) {
      case HomeSections.home:
        scrollController.animateTo(
          0,
          duration: const Duration(seconds: 1),
          curve: Curves.easeOut,
        );
        break;

      case HomeSections.linguistics:
        Scrollable.ensureVisible(
          linguisticsKey.currentContext!,
          duration: const Duration(seconds: 1),
          curve: Curves.easeOut,
        );
        break;

      case HomeSections.selfDevelopment:
        Scrollable.ensureVisible(
          selfDevelopmentKey.currentContext!,
          duration: const Duration(seconds: 1),
          curve: Curves.easeOut,
        );
        break;

      case HomeSections.technologies:
        Scrollable.ensureVisible(
          technologiesKey.currentContext!,
          duration: const Duration(seconds: 1),
          curve: Curves.easeOut,
        );
        break;

      default:
        break;
    }
  }

  final TextEditingController searchController = TextEditingController();

  void onSearchTextChanged() {
    emit(SearchState());
  }

  void clearSearch() {
    searchController.clear();
    emit(ClearSearchState());
  }

  // ----------------------------------------------------------------------------

  // Repository
  HomeRepository homeRepository = HomeRepository();
  List<Book> books = [];

  // Get All Books
  Future<void> getAlLBooks() async {
    emit(GetAllBooksLoadingState());
    Response response = await homeRepository.getAllBooks();
    for (var jsonBook in response.data["content"]["books"]) {
      books.add(
        Book.fromJson(jsonBook),
      );
    }
    emit(GetAllBooksSuccessState());
  }
}

enum HomeSections { home, linguistics, selfDevelopment, technologies }
