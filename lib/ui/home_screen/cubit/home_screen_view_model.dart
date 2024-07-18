import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled13/ui/home_screen/cubit/home_screnn_states.dart';
import 'package:untitled13/ui/tabs/favorite/favorite_tab.dart';
import 'package:untitled13/ui/tabs/home/home_tab.dart';
import 'package:untitled13/ui/tabs/list/list_tab.dart';
import 'package:untitled13/ui/tabs/profile/profile_tab.dart';

class HomeScreenViewModel extends Cubit<HomeScreenState> {
  HomeScreenViewModel() : super(HomeScreenInitialState());
  int selectIndex = 0;
  List<Widget> tabs = [
    HomeTab(),
    ListTab(),
    const FavoriteTab(),
    const ProfileTab()
  ];
  void changeBottomNavBar(int newSelectedIndex) {
    HomeScreenInitialState();
    selectIndex = newSelectedIndex;
    emit(ChangeNavigationBar());
  }
}
