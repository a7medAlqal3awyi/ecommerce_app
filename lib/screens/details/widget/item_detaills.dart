import 'package:e_commerce/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants.dart';
import '../../../core/helper/spacing.dart';

class ItemDetails extends StatelessWidget {
  final Product product;
  const ItemDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.title,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20.sp),
        ),
        verticalSpacing(10),
        Row(
          mainAxisAlignment:MainAxisAlignment.spaceBetween ,
          children: [
            Text(
              "\$${product.price}",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 18.sp),
            ),
            Text(
              "Seller: ${product.seller}",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 18.sp),
            ),
          ],
        ),
        verticalSpacing(10),
        Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: 6.w, vertical: 2.h),
              decoration: BoxDecoration(
                color: kprimaryColor,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.white,
                  ),
                  Text(
                    "${product.rate}",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp),
                  ),
                ],
              ),
            ),
            horizontalSpacing(10),
            Text(
              product.review,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16.sp,
              ),
            ),
          ],
        ),
        verticalSpacing(10),

      ],
    );
  }
}
