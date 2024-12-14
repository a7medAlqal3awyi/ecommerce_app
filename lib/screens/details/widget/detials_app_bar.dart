import 'package:e_commerce/constants.dart';
import 'package:e_commerce/core/helper/exetention.dart';
import 'package:e_commerce/models/product.dart';
import 'package:flutter/material.dart';

import '../../../core/helper/spacing.dart';
import '../../../provider/favorite_provider.dart';

class DetailsAppBar extends StatelessWidget {
  final Product product;

  const DetailsAppBar({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor: Colors.white,
              padding: const EdgeInsets.all(15),
            ),
            onPressed: () {
              context.pop();
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          horizontalSpacing(200),
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor: Colors.white,
              padding: const EdgeInsets.all(15),
            ),
            onPressed: () {
              provider.toggleFavorite(product);
            },
            icon: const Icon(Icons.share),
          ),
          horizontalSpacing(10),
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor: Colors.white,
              padding: const EdgeInsets.all(15),
            ),
            onPressed: () {
              provider.toggleFavorite(product);
            },
            icon: Icon(
              provider.isExist(product)
                  ? Icons.favorite
                  : Icons.favorite_border,
            ),
            color: kprimaryColor,
          ),
        ],
      ),
    );
  }
}
