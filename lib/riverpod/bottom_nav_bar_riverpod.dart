import 'package:flutter/cupertino.dart';
import 'package:riverpod_product_app/view/basket/basket.dart';
import 'package:riverpod_product_app/view/favorite/favorite.dart';
import 'package:riverpod_product_app/view/home/home.dart';

class BottomNavBarRiverpod extends ChangeNotifier {
  List<BottomNavigationBarItem> items = const [
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: "Anasayfa"),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.heart), label: "Favoriler"),
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.bag), label: "Sepet"),
  ];

  int currentIndex = 0;

  void setCurrentIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

    String appbarTitle() {
    switch (currentIndex) {
      case 0:
        return "Anasayfa";
      case 1:
        return "Favoriler";
      case 2:
        return "Sepet";
      default:
        return "Boş";
    }
  }

  Widget body() {
    switch (currentIndex) {
      case 0:
        return Home();
      case 1:
        return Favorite();
      case 2:
        return Basket();
      default:
        return Home();
    }
  }
}
