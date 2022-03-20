import 'package:flutter/material.dart';
import 'package:grock/grock.dart';
import 'package:riverpod_product_app/model/product_model.dart';

class ProductRiverpod extends ChangeNotifier {
  List<ProductModel> products = [];
  List<ProductModel> favorites = [];
  List<ProductModel> basketProducts = [];
  double totalPrice = 0.0;

  void setTotalPrice(ProductModel model) {
    totalPrice += model.price;
  }

  void setFavorite(ProductModel model) {
    if (model.isFavorite) {
      model.isFavorite = false;
      favorites.remove(model);
      notifyListeners();
    } else {
      model.isFavorite = true;
      favorites.add(model);
      notifyListeners();
    }
  }

  void addedBasket(ProductModel model) {
    basketProducts.add(model);
    setTotalPrice(model);
    Grock.snackBar(
      title: "Başarılı",
      description: "${model.title} başarıyla sepete eklendi",
      icon: Icons.check,
    );
  }

  void init() {
    for (int i = 0; i < 15; i++) {
      products.add(
        ProductModel(
          isFavorite: false,
          title: "Xiaomi ${i + 1}",
          description: "${8 + (i * 2)} MP kameralı ve 55${i * 10} mAh batarya",
          price: 6000.0 + (i * 10),
          imagePath: i.randomImage(),
        ),
      );
    }
  }
}
