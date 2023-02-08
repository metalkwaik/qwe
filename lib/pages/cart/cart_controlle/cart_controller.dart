import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/models/cart_model.dart';
import 'package:flutter_application_1/models/item_model.dart';

class CartController extends ChangeNotifier {
  Map<int, CartData> _cardList = {};
  List<CartData> get getItemsList =>
      _cardList.entries.map((e) => e.value).toList();

  int _countForAdding = 0;
  int _inCartItems = 0;

  bool existInCart(ProductData product) => (_cardList.containsKey(product.id));

  void upDataCountProductInCart(bool isIncroment, ProductData product) {
    _countForAdding = _checkCount(_countForAdding + (isIncroment ? 1 : -1));
    _addProductToCart(product);
    notifyListeners();
  }


  void _addProductToCart(ProductData product) {
    addItem(product, _countForAdding);
    _countForAdding = 0;
    getCountProduct(product);
    notifyListeners();
  }

  String getCountProduct(ProductData product) {
    return existInCart(product)
        ? _cardList.values
            .firstWhere((element) => element.id == product.id)
            .count.toString()
        : '0';
  }

  int _checkCount(int countProduct) {
    if ((_inCartItems + countProduct) < -1) {
      return 0;
    } else if ((_inCartItems + countProduct) > 20) {
      return 0;
    } else {
      return countProduct;
    }
  }

  /// обновление элементов корзина на -1 или 1
  void addItem(ProductData product, int count) {
    if (existInCart(product)) {
      var totalCount = 0;
      _cardList.update(product.id!, (value) {
        totalCount = value.count + count;
        return CartData(
          id: value.id,
          count: value.count + count,
          product: product,
        );
      });

      if (totalCount <= 0) {
        _cardList.remove(product.id);
      }
    } else if (count > 0) {
      _cardList.putIfAbsent(
        product.id!,
        () {
          return CartData(
            id: product.id as int,
            count: count,
            product: product,
          );
        },
      );
    }

    notifyListeners();
  }
}
