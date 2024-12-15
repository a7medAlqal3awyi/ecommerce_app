import 'package:e_commerce/constants.dart';
import 'package:e_commerce/core/helper/spacing.dart';
import 'package:e_commerce/core/widgets/general_app_bar.dart';
import 'package:e_commerce/provider/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    return Scaffold(
      backgroundColor: kcontentColor,
      body: SafeArea(
        child: Column(
          children: [
            GeneralAppBar(title: "Favorite"),
            verticalSpacing(10),
            provider.favorite.isEmpty ?
                  Center(child: Lottie.asset("assets/animation/animat1.json"))
                :
            Expanded(
              child: ListView.builder(
                  itemCount: provider.favorite.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        height: 100.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Container(
                                width: 90.w,
                                height: 90.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.r),
                                  color: kcontentColor,
                                  image: DecorationImage(
                                    image: AssetImage(
                                        provider.favorite[index].image),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 16.h, left: 4.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    provider.favorite[index].title,
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  verticalSpacing(10),
                                  Text(
                                    provider.favorite[index].category,
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey),
                                  ),
                                  verticalSpacing(10),
                                  Text(
                                    "\$${provider.favorite[index].price}",
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Spacer(),
                            Padding(
                              padding: EdgeInsets.only(top: 10.h),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.delete),
                                    color: Colors.red,
                                    onPressed: () {
                                      provider.toggleFavorite(
                                          provider.favorite[index]);
                                    },
                                  ),
                                ],
                              ),
                            ),
                            horizontalSpacing(10),
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
