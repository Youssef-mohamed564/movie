import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app/common/app_assets.dart';
import 'package:movie_app/common/app_colors.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Padding(padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColor.grayColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              style: TextStyle(color: AppColor.white),
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(color: AppColor.white,fontSize: 20),
                prefixIcon: Image.asset(AppAssets.iconSearch,color: AppColor.white,),
              ),
            ),
          ),
          SizedBox(height: 50,),
          Expanded(child: Center(child:
            Lottie.asset(AppAnimations.popCorn),

          ))
        ],
      ),)),
    );
  }
}
