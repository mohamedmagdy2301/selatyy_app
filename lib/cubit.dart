import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

// Define your Cubit state class (e.g., TabIndexState).
class TabIndexState {
  final int currentIndex;

  TabIndexState(this.currentIndex);
}

// Define the Cubit class, responsible for handling the tab index state.
class TabCubit extends Cubit<TabIndexState> {
  TabCubit() : super(TabIndexState(2)); // Default to index 2 (Home)
  final PersistentTabController controller =
      PersistentTabController(initialIndex: 2);

  void updateTabIndex(int index) {
    controller.jumpToTab(index);
    emit(TabIndexState(index)); // Emit a new state with the updated index
  }
}
