import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grock/grock.dart';
import 'package:riverpod_product_app/riverpod/riverpod_management.dart';

import '../../components/product_widget_item.dart';

class Home extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var watch = ref.watch(productRiverpod);
    var read = ref.read(productRiverpod);
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: [20, 15, 20, 0].paddingLTRB,
            child: Text(
              "Ürünler",
              style:
                  Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 16),
            ),
          ),
          GrockList(
            isExpanded: false,
            shrinkWrap: true,
            itemCount: read.products.length,
            scrollEffect: const NeverScrollableScrollPhysics(),
            padding: [20, 10].horizontalAndVerticalP,
            itemBuilder: (context, index) {
              return ProductWidget(
                model: watch.products[index],
                setFavorite: () => read.setFavorite(watch.products[index]),
                setBasket: () =>read.addedBasket(watch.products[index]),
              );
            },
          ),
        ],
      ),
    );
  }
}
