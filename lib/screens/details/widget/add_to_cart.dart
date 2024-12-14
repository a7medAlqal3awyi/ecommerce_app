import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants.dart';
import '../../../core/helper/spacing.dart';
import '../../../models/product.dart';
import '../../../provider/cart_provider.dart';

class AddToCart extends StatefulWidget {
  final Product product;

  const AddToCart({super.key, required this.product});

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    final provider =CartProvider.of(context);

    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
      child: Container(
        height: 70.h,
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(30.r)),
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          children: [
            Container(
              height: 40.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.r),
                border: Border.all(
                  color: Colors.white,
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        if (currentIndex != 1) {
                          setState(() {
                            currentIndex--;
                          });
                        }
                      },
                      icon: const Icon(
                        Icons.remove,
                        color: Colors.white,
                      )),
                  horizontalSpacing(10),
                  Text(
                    "$currentIndex",
                    style: TextStyle(color: Colors.white, fontSize: 20.sp),
                  ),
                  horizontalSpacing(10),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          currentIndex++;
                        });
                      },
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                      )),
                ],
              ),
            ),
            const Spacer(),
            GestureDetector(

              onTap: (){
                provider.toggleCart(widget.product);
                const snackBar = SnackBar(
                  content: Text(
                    "Successfully added!",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                  duration: Duration(seconds: 1),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: Container(
                height: 45.h,
                width: 200,
                decoration: BoxDecoration(
                    color: kprimaryColor,
                    borderRadius: BorderRadius.circular(30.r)),
                child: Center(
                  child: Text(
                    "Add to Cart",
                    style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
