import 'package:flutter/material.dart';
import 'package:movie_app/screens/home_screen/tabs/profile_tab.dart';
import 'package:movie_app/screens/home_screen/tabs/home_tab.dart';
import 'package:movie_app/screens/home_screen/tabs/explore_tab.dart';
import 'package:movie_app/screens/home_screen/tabs/search_tab.dart';
import 'package:movie_app/common/app_assets.dart';
import 'package:movie_app/common/app_colors.dart';

class HomeProfileTab extends StatefulWidget {
  static const String routeName = 'homeProfileTab';
  const HomeProfileTab({super.key});

  @override
  State<HomeProfileTab> createState() => _HomeProfileTabState();
}

class _HomeProfileTabState extends State<HomeProfileTab> {
  int selectedIndex = 0;

  // Tab order must match the BottomNavigationBar order:
  // 0: Home, 1: Search, 2: Browse, 3: Profile
  final List<Widget> tabsBodyList = [
    HomeTab(), // index 0: Home
    SearchTab(), // index 1: Search
    ExploreTab(), // index 2: Browse
    ProfileTab(), // index 3: Profile
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: AppColor.black,
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(canvasColor: AppColor.black),
          child: Padding(
            padding: EdgeInsets.only(
                left: width * 0.015,
                right: width * 0.015,
                bottom: height * 0.005),
            child: ClipRRect(
              borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(10), right: Radius.circular(10)),
              child: BottomNavigationBar(
                selectedItemColor: AppColor.yellow,
                unselectedItemColor: AppColor.white,
                type: BottomNavigationBarType.fixed,
                showUnselectedLabels: false,
                showSelectedLabels: true,
                currentIndex: selectedIndex,
                onTap: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                items: [
                  BottomNavigationBarItem(
                    icon: buildItemInBottomNavBar(
                        index: 0, imageName: AppAssets.hometab),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: buildItemInBottomNavBar(
                        index: 1, imageName: AppAssets.searchtab),
                    label: 'Search',
                  ),
                  BottomNavigationBarItem(
                    icon: buildItemInBottomNavBar(
                        index: 2, imageName: AppAssets.browsetab),
                    label: 'Browse',
                  ),
                  BottomNavigationBarItem(
                    icon: buildItemInBottomNavBar(
                        index: 3, imageName: AppAssets.profiletab),
                    label: 'Profile',
                  ),
                ],
              ),
            ),
          ),
        ),
        body: tabsBodyList[selectedIndex]);
  }

  Widget buildItemInBottomNavBar(
      {required int index, required String imageName}) {
    return selectedIndex == index
        ? Container(
            child: ImageIcon(AssetImage(imageName)),
          )
        : ImageIcon(AssetImage(imageName));
  }
}
