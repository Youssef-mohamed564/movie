import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/common/app_assets.dart';
import 'package:movie_app/common/app_colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:movie_app/screens/home_screen/widget/movie_card.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.black,
        body: Column(
          children: [
            Stack(
              children: [
                Image.asset(AppAssets.tempBackground),
                Image.asset(AppAssets.gradient),
                Positioned(
                    left: width * .07, child: Image.asset(AppAssets.watchNow)),
                Padding(
                  padding: EdgeInsets.only(top: height * .15),
                  child: Center(
                    child: CarouselSlider(
                      options: CarouselOptions(
                          height: height * .3, enlargeCenterPage: true),
                      items: [1, 2, 3, 4, 5].map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return MovieCard();
                          },
                        );
                      }).toList(),
                    ),
                  ),
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Action ',
                    style: TextStyle(
                        color: AppColor.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 20),
                  ),
                  Row(
                    children: [
                      Text(
                        'See More',
                        style: TextStyle(
                            color: AppColor.yellow,
                            fontWeight: FontWeight.w400,
                            fontSize: 16),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: AppColor.yellow,
                        size: 15,
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
