import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  var currentIndexPage = 0;

  List listTextBtn = ['доставка', 'самовывоз'];

  setScreen(int index) {
    currentIndexPage = index;
    notifyListeners();
  }
}
