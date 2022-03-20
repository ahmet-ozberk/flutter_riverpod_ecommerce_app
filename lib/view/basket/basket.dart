import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grock/grock.dart';
import '../../components/product_widget_item.dart';
import '../../riverpod/riverpod_management.dart';

class Basket extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var product = ref.watch(productRiverpod);
    return Scaffold(
      body: product.basketProducts.length == 0
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Henüz sepetin boş, hemen bir şeyler ekle"),
                  OutlinedButton(
                      onPressed: () {
                        ref.read(bottomNavBarRiverpod).setCurrentIndex(0);
                      },
                      child: const Text(
                        "Ürünlere Git",
                      ))
                ],
              ),
            )
          : ListView(
              children: [
                Padding(
                  padding: [20, 15, 20, 0].paddingLTRB,
                  child: Text(
                    "Sepet",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(fontSize: 16),
                  ),
                ),
                GrockList(
                  isExpanded: false,
                  shrinkWrap: true,
                  itemCount: product.basketProducts.length,
                  scrollEffect: const NeverScrollableScrollPhysics(),
                  padding: [20, 10].horizontalAndVerticalP,
                  itemBuilder: (context, index) {
                    return ProductWidget(
                      model: product.basketProducts[index],
                      setFavorite: () =>
                          product.setFavorite(product.basketProducts[index]),
                      setBasket: () {},
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: 20.horizontalP,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Toplam Tutar: ${product.totalPrice} ₺",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        child: Text(
                          "Sipariş Ver",
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
