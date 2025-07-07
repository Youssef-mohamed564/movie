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
        body: ListView(children: [
          Column(
            children: [
              Stack(
                children: [
                  Image.asset(
                    AppAssets.tempBackground,
                  ),
                  Image.asset(AppAssets.gradient),
                  Positioned(
                      left: width * .07,
                      child: Image.asset(AppAssets.watchNow)),
                  Padding(
                    padding: EdgeInsets.only(top: height * .15),
                    child: Center(
                      child: CarouselSlider(
                        options: CarouselOptions(
                            height: height * .4, enlargeCenterPage: true),
                        items: [1, 2, 3, 4, 5].map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return MovieCard(widthOfW: width*.5,);
                            },
                          );
                        }).toList(),
                      ),
                    ),
                  )
                ],
              ),
              const Padding(
                padding:
                    EdgeInsets.only(top: 8.0, right: 8, left: 8, bottom: 2),
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
              ),
              SizedBox(
                height: height * .3,
                width: width * .95,
                child: ListView.builder(
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MovieCard(widthOfW: width*.35,),
                  ),
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
