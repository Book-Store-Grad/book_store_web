import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(GlobalInitial());

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
}

enum HomeSections { home, linguistics, selfDevelopment, technologies }
