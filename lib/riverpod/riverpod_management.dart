import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_product_app/riverpod/bottom_nav_bar_riverpod.dart';
import 'package:riverpod_product_app/riverpod/product_riverpod.dart';

final bottomNavBarRiverpod =
    ChangeNotifierProvider((_) => BottomNavBarRiverpod());

final productRiverpod = ChangeNotifierProvider((_) => ProductRiverpod());

