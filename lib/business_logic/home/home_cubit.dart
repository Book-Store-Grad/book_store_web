import 'package:book_store_web/features/home/repository/home_repository.dart';
import 'package:book_store_web/models/book.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final ScrollController scrollController = ScrollController();
  final GlobalKey homeKey = GlobalKey();
  final GlobalKey businessKey = GlobalKey();
  final GlobalKey classicKey = GlobalKey();
  final GlobalKey technologyKey = GlobalKey();
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

      case HomeSections.business:
        Scrollable.ensureVisible(
          businessKey.currentContext!,
          duration: const Duration(seconds: 1),
          curve: Curves.easeOut,
        );
        break;

      case HomeSections.classic:
        Scrollable.ensureVisible(
          classicKey.currentContext!,
          duration: const Duration(seconds: 1),
          curve: Curves.easeOut,
        );
        break;

      case HomeSections.technology:
        Scrollable.ensureVisible(
          technologyKey.currentContext!,
          duration: const Duration(seconds: 1),
          curve: Curves.easeOut,
        );
        break;

      default:
        break;
    }
  }

  final TextEditingController searchController = TextEditingController();
  List<Book> searchedBooks = [];

  void searchBook() async {
    searchedBooks.clear();
    searchController.addListener(() {
      emit(SearchState());
    });
    emit(SearchLoading());
    Response response =
        await homeRepository.searchBook(query: searchController.text);
    if (response.data['content']['books'].isEmpty) {
      return emit(SearchEmptyState());
    }
    response.data['content']['books'].forEach(
      (e) => searchedBooks.add(Book.fromJson(e)),
    );
    emit(SearchSuccess(searchedBooks: searchedBooks));
  }

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

enum HomeSections { home, business, classic, technology }
