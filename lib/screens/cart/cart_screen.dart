import 'package:e_commerce/constants.dart';
import 'package:e_commerce/core/helper/spacing.dart';
import 'package:e_commerce/provider/cart_provider.dart';
import 'package:e_commerce/screens/cart/widget/check_out.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../core/widgets/general_app_bar.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);
    GestureDetector productQuantity(IconData icon, int index) =>
        GestureDetector(
          child: Icon(
            icon,
            size: 20,
          ),
          onTap: () {
            setState(() {
              icon == Icons.add
                  ? provider.incrementQnt(index)
                  : provider.decrementQnt(index);
            });
          },
        );
    return Scaffold(
      backgroundColor: kcontentColor,
      bottomSheet: provider.cart.isEmpty ? SizedBox.shrink(): CheckOutBox(),
      body: SafeArea(
        child: Column(
          children: [
            verticalSpacing(10),
             GeneralAppBar(
               title: "My Cart",
            ),
            provider.cart.isEmpty ?
            Center(child: Lottie.asset("assets/animation/animat1.json"))
                :
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.w),
                        child: Container(
                          width: double.infinity,
                          height: 120.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 10.w,
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: kcontentColor,
                                    borderRadius: BorderRadius.circular(20.r),
                                  ),
                                  width: 100.w,
                                  height: 100.h,
                                  child: Image.asset(
                                    provider.cart[index].image,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10.w,
                                  vertical: 12.h,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      provider.cart[index].title,
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    verticalSpacing(10),
                                    Text(
                                      provider.cart[index].category,
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    verticalSpacing(10),
                                    Text(
                                      "\$${provider.cart[index].price}",
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 12,
                        right: 15,
                        child: Padding(
                          padding: EdgeInsets.only(top: 12.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    provider.cart.removeAt(index);

                                    setState(() {});
                                  },
                                  icon: Icon(
                                    Icons.delete_forever_outlined,
                                    color: kprimaryColor,
                                    size: 20,
                                  )),
                              verticalSpacing(20),
                              Container(
                                height: 40.h,
                                padding: EdgeInsets.all(5.w),
                                decoration: BoxDecoration(
                                  color: kcontentColor,
                                  borderRadius: BorderRadius.circular(20.r),
                                ),
                                child: Row(
                                  children: [
                                    horizontalSpacing(10),
                                    productQuantity(Icons.remove, index),
                                    horizontalSpacing(10),
                                    Text(
                                      provider.cart[index].quantity.toString(),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    horizontalSpacing(10),
                                    productQuantity(Icons.add, index),
                                    horizontalSpacing(10),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  );
                },
                itemCount: provider.cart.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
