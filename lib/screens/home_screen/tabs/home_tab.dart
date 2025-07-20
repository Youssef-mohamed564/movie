import 'package:flutter/material.dart';
import 'package:movie_app/api/api_maneger.dart';
import 'package:movie_app/common/app_assets.dart';
import 'package:movie_app/common/app_colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:movie_app/screens/home_screen/widget/movie_card.dart';
import 'package:movie_app/screens/home_screen/widget/view_model.dart';
import 'package:provider/provider.dart';

import '../../../common/App Styles.dart';
import '../../../model/movies_response.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  late Future<MoviesResponce?> futureMovies;

  @override
  void initState() {
    super.initState();
    futureMovies = ApiManager.getMovies();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    MoviesListProvider moviesListProvider = MoviesListProvider();
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
                    padding: EdgeInsets.only(top: height * .17),
                    child: Center(
                      child: CarouselSlider(
                        disableGesture: false,
                        options: CarouselOptions(
                            clipBehavior: Clip.antiAlias,
                            animateToClosest: true,
                            height: height * .6,
                            enlargeCenterPage: true),
                        items: //todo
                            List.generate(150, (index) => index + 1).map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return FutureBuilder(
                                  future: ApiManager.getMovies(),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return const Center(
                                          child: CircularProgressIndicator());
                                    } else if (snapshot.hasError) {
                                      return Column(children: [
                                        Text(
                                          snapshot.error.toString(),
                                          style: AppStyles.semi20White,
                                        ),
                                        ElevatedButton(
                                            onPressed: () {
                                              ApiManager.getMovies();
                                              setState(() {});
                                            },
                                            child: Text('Try Again',
                                                style: AppStyles.semi20White))
                                      ]);
                                    } else if (snapshot.data?.status != 'ok') {
                                      return Column(children: [
                                        Text(
                                          snapshot.data!.statusMessage!,
                                          style: AppStyles.semi20White,
                                        ),
                                        ElevatedButton(
                                            onPressed: () {
                                              ApiManager.getMovies();
                                              setState(() {});
                                            },
                                            child: Text(
                                              'Try Again',
                                              style: AppStyles.semi20White,
                                            ))
                                      ]);
                                    } else {
                                      var moviesList =
                                          snapshot.data?.data?.movies ?? [];

                                      return MovieCard(
                                        topW: width * .5,
                                        movie: moviesList[i],
                                      );
                                    }
                                  });
                            },
                          );
                        }).toList(),
                      ),
                    ),
                  )
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(right: 8, left: 8, bottom: 2),
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
                  itemCount: 100,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FutureBuilder(
                        future: ApiManager.getMovies(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Column(children: [
                              Text(
                                snapshot.error.toString(),
                                style: AppStyles.semi20White,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    ApiManager.getMovies();
                                    setState(() {});
                                  },
                                  child: Text('Try Again',
                                      style: AppStyles.semi20White))
                            ]);
                          } else if (snapshot.data?.status != 'ok') {
                            return Column(children: [
                              Text(
                                snapshot.data!.statusMessage!,
                                style: AppStyles.semi20White,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    ApiManager.getMovies();
                                    setState(() {});
                                  },
                                  child: Text(
                                    'Try Again',
                                    style: AppStyles.semi20White,
                                  ))
                            ]);
                          } else {
                            var moviesList = snapshot.data?.data?.movies ?? [];

                            return MovieCard(
                              topW: width * .4,
                              movie: moviesList[index],
                            );
                          }
                        }),
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
