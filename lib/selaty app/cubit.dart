import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

// Define your Cubit state class (e.g., TabIndexState).
class TabIndexState {
  final int currentIndex;

  TabIndexState(this.currentIndex);
}

class TabCubit extends Cubit<TabIndexState> {
  TabCubit() : super(TabIndexState(0));
  final PersistentTabController controller =
      PersistentTabController(initialIndex: 0);

  void updateTabIndex(int index) {
    controller.jumpToTab(index);
    emit(TabIndexState(index));
  }
}
