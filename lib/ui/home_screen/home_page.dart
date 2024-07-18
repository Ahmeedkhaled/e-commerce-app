import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled13/my_theme.dart';
import 'package:untitled13/ui/home_screen/cubit/home_screen_view_model.dart';
import 'package:untitled13/ui/home_screen/cubit/home_screnn_states.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  static const String routeName = "home_page";
  HomeScreenViewModel viewModel = HomeScreenViewModel();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeScreenViewModel, HomeScreenState>(
      bloc: viewModel,
      listener: (context, state) {},
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            bottomNavigationBar: Theme(
              data:
                  Theme.of(context).copyWith(canvasColor: MyTheme.primaryColor),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(25),
                  topLeft: Radius.circular(25),
                ),
                child: BottomNavigationBar(
                  currentIndex: viewModel.selectIndex,
                  onTap: (index) {
                    viewModel.changeBottomNavBar(index);
                  },
                  items: [
                    BottomNavigationBarItem(
                        icon: viewModel.selectIndex == 0
                            ? selectedItem("assets/images/Frame76.png")
                            : unselectedItem("assets/images/Frame76.png"),
                        label: ""),
                    BottomNavigationBarItem(
                        icon: viewModel.selectIndex == 1
                            ? selectedItem("assets/images/list.png")
                            : unselectedItem("assets/images/list.png"),
                        label: ""),
                    BottomNavigationBarItem(
                        icon: viewModel.selectIndex == 2
                            ? selectedItem("assets/images/Frame79.png")
                            : unselectedItem("assets/images/Frame79.png"),
                        label: ""),
                    BottomNavigationBarItem(
                        icon: viewModel.selectIndex == 3
                            ? selectedItem("assets/images/Frame80.png")
                            : unselectedItem("assets/images/Frame80.png"),
                        label: ""),
                  ],
                ),
              ),
            ),
            body: viewModel.tabs[viewModel.selectIndex],
          ),
        );
      },
    );
  }

  Widget selectedItem(String image) {
    return CircleAvatar(
        backgroundColor: Colors.white,
        child: ImageIcon(
          AssetImage(image),
          size: 50,
        ));
  }

  Widget unselectedItem(String image) {
    return ImageIcon(
      AssetImage(image),
      size: 50,
    );
  }
}
