import 'package:book_store_web/core/utils/string_capitalize.dart';
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

  // ---------------------------------------------------------------------------

  void getCategoryBook(String categoryName) async {
    emit(GetCategoryBooksLoading());
    await getAlLBooks();
    switch (categoryName.capitalize()) {
      case 'Business':
        print(businessBooks);
        emit(GetCategoryBooksSuccessState(categoryBooks: businessBooks));
        break;
      case 'Entertainment':
        emit(GetCategoryBooksSuccessState(categoryBooks: entertainmentBooks));
        break;
      case 'Fiction':
      emit(GetCategoryBooksSuccessState(categoryBooks: fictionBooks));
        break;
      case 'Political':
      emit(GetCategoryBooksSuccessState(categoryBooks: politicalBooks));
        break;
      case 'Technology':
      emit(GetCategoryBooksSuccessState(categoryBooks: technologyBooks));
        break;
      case 'Education':
      emit(GetCategoryBooksSuccessState(categoryBooks: educationBooks));
        break;
      case 'History':
      emit(GetCategoryBooksSuccessState(categoryBooks: historyBooks));
        break;
      case 'Science':
      emit(GetCategoryBooksSuccessState(categoryBooks: scienceBooks));
        break;
      case 'Classic':
      emit(GetCategoryBooksSuccessState(categoryBooks: classicBooks));
        break;
    }
  }

  // ---------------------------------------------------------------------------

  // Repository
  HomeRepository homeRepository = HomeRepository();
  List<Book> books = [];
  List<Book> businessBooks = [];
  List<Book> classicBooks = [];
  List<Book> technologyBooks = [];
  List<Book> educationBooks = [];
  List<Book> historyBooks = [];
  List<Book> fictionBooks = [];
  List<Book> politicalBooks = [];
  List<Book> scienceBooks = [];
  List<Book> entertainmentBooks = [];


  // Get All Books
  Future<void> getAlLBooks() async {
    emit(GetAllBooksLoadingState());
    Response response = await homeRepository.getAllBooks();
    for (var jsonBook in response.data["content"]["books"]) {
      books.add(
        Book.fromJson(jsonBook),
      );
    }
    for(Book book in books) {
      if (book.category == 'Business') {businessBooks.add(book);}
      else if (book.category == 'Entertainment') {educationBooks.add(book);}
      else if (book.category == 'Fiction') {fictionBooks.add(book);}
      else if (book.category == 'Political') {politicalBooks.add(book);}
      else if (book.category == 'Technology') {technologyBooks.add(book);}
      else if (book.category == 'Education') {educationBooks.add(book);}
      else if (book.category == 'History') {historyBooks.add(book);}
      else if (book.category == 'Science') {scienceBooks.add(book);}
      else if (book.category == 'Classic') {classicBooks.add(book);}
    }
    emit(GetAllBooksSuccessState());
  }
}

enum HomeSections { home, business, classic, technology }
