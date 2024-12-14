import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            style: IconButton.styleFrom(
                backgroundColor: kcontentColor, padding: EdgeInsets.all(12.h)),
            onPressed: () {},
            icon: Image.asset(height: 20, "assets/images/icon.png")),
        IconButton(
            style: IconButton.styleFrom(
                backgroundColor: kcontentColor, padding: EdgeInsets.all(12.h)),
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_outlined,
              size: 30,
            )),
      ],
    );
  }
}
