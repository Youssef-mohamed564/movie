import 'package:flutter/material.dart';
import 'package:movie_app/common/app_assets.dart';
import 'package:movie_app/common/app_colors.dart';
import 'package:movie_app/screens/home_screen/tabs/profile_tab.dart';
import 'package:movie_app/screens/home_screen/tabs/home_tab.dart';
import 'package:movie_app/screens/home_screen/tabs/explore_tab.dart';
import 'package:movie_app/screens/home_screen/tabs/search_tab.dart';
import 'package:movie_app/screens/home_screen/widget/view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/HomeScreen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> tabs = [
    HomeTab(),
    SearchTab(),
    ExploreTab(),
    ProfileTab(),
  ];
  int index = 0;
  @override
  Widget build(BuildContext context) {
   // final viewModel = Provider.of<ViewModel>(context);
    return Scaffold(
      backgroundColor: AppColor.black,

      body: tabs[index],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          child: BottomNavigationBar(
              backgroundColor: AppColor.grayColor,
              type: BottomNavigationBarType.fixed,
              onTap: (value) {
                print('xx$value');
                index = value;
                setState(() {});
              },
              currentIndex: index,
              items: [
                BottomNavigationBarItem(
                    activeIcon: Image.asset(
                      AppAssets.iconHome,
                      color: AppColor.yellowBg,
                    ),
                    icon: Image.asset(AppAssets.iconHome),
                    label: ''),
                BottomNavigationBarItem(
                    activeIcon: Image.asset(
                      AppAssets.iconSearch,
                      color: AppColor.yellowBg,
                    ),
                    icon: Image.asset(AppAssets.iconSearch),
                    label: ''),
                BottomNavigationBarItem(
                    activeIcon: Image.asset(
                      AppAssets.iconExplore,
                      color: AppColor.yellowBg,
                    ),
                    icon: Image.asset(AppAssets.iconExplore),
                    label: ''),
                BottomNavigationBarItem(
                    activeIcon: Image.asset(
                      AppAssets.iconProfiel,
                      color: AppColor.yellowBg,
                    ),
                    icon: Image.asset(AppAssets.iconProfiel),
                    label: ''),
              ]),
        ),
      ),
    );
  }
}
