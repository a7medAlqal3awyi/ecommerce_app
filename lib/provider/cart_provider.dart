import 'package:e_commerce/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class CartProvider extends ChangeNotifier {
  final List<Product> _cart = [];

  List<Product> get cart => _cart;

  void toggleCart(Product product) {
    if (_cart.contains(product)) {
      for (Product element in _cart) {
        element.quantity++;
      }
    } else {
      _cart.add(product);
    }
    notifyListeners();
  }

  incrementQnt(int index) {
    _cart[index].quantity++;
    notifyListeners();
  }

  decrementQnt(int index) {
    if (_cart[index].quantity <= 1) {
      return 0;
    } else {
      _cart[index].quantity--;
    }
  }

  totalPrice(){
    double myTotal=0.0;
    for(Product element in _cart){
      myTotal+=element.quantity* element.price;
    }
    return myTotal;

  }

  bool isExist(Product product) {
    final isExist = _cart.contains(product);
    return isExist;
  }

  static CartProvider of(BuildContext context, {bool listen = true}) {
    return Provider.of<CartProvider>(
      context,
      listen: listen,
    );
  }
}
