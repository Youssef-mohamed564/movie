import 'package:flutter/material.dart';
import 'package:movie_app/common/app_assets.dart';
import 'package:movie_app/screens/home_screen/widget/movie_model.dart';

import '../../../common/app_colors.dart';

class MovieCard extends StatelessWidget {
   MovieCard({super.key,});
//Movie movies;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
        width: width * .4,
        margin: EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(),
        child: Stack(
          children: [
            Image.asset(AppAssets.tempBackground),
            Positioned(top: 6,left: 6,
              child: Container(padding: EdgeInsets.symmetric(horizontal: 4),
                width: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                    color: Colors.black.withOpacity(.5)),
                child: Row(
                  children: [Text('7.7',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: AppColor.white),), Icon(Icons.star,color: AppColor.yellow,size: 20,)],
                ),
              ),
            )
          ],
        ));
  }
}
