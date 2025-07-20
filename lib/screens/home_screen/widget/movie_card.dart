import 'package:flutter/material.dart';

import '../../../common/app_colors.dart';
import 'package:movie_app/model/movies_response.dart';

class MovieCard extends StatelessWidget {
  List<Movies>movies =[];
  final Movies movie;

  double topW;
  MovieCard({
    super.key,
     required this.movie,
    required this.topW
  });
  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return  Container(
                clipBehavior: Clip.antiAlias,
                width: topW,
                height: height * .4,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15)),
                child: Stack(
                  children: [
                    Image.network(movie.mediumCoverImage ?? ''),
                    Positioned(
                      top: 6.0,
                      left: 6.0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        width: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9),
                            color: Colors.black.withOpacity(.5)),
                        child: Row(
                          children: [
                            Text(
                              movie.rating.toString() ,
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.white),
                            ),
                            const Icon(
                              Icons.star,
                              color: AppColor.yellow,
                              size: 20,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ));
          }
        }


