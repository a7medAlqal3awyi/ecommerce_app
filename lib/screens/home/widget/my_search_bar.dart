import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants.dart';
import '../../../core/helper/spacing.dart';

class MySearchBAR extends StatelessWidget {
  const MySearchBAR({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.r),
        color: kcontentColor,
      ),
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
      child: Row(
        children: [
          const Icon(
            Icons.search,
            color: Colors.grey,
            size: 30,
          ),
          horizontalSpacing(10),
          const Flexible(
            flex: 4,
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Search...", border: InputBorder.none),
            ),
          ),
         
         Container(
           width: 1.2.w,
           height: 22.h,
           color: Colors.grey,
         ),
           horizontalSpacing(4),
           IconButton(
            onPressed: (){},
            icon:const Icon( Icons.tune,
              color: Colors.grey,
              size: 30,) ,

          ),

        ],
      ),
    );
  }
}
