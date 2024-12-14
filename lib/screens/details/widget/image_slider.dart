import 'package:flutter/material.dart';

class MyImageSlider extends StatelessWidget {
  final void Function(int)? onChange;
  final String image;

  const MyImageSlider({super.key, this.onChange, required this.image});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: PageView.builder(
        onPageChanged: onChange,
        itemBuilder: (context, index) {
          return Hero(
            tag: image,
            child: Image.asset(image),
          );
        },
      ),
    );
  }
}
