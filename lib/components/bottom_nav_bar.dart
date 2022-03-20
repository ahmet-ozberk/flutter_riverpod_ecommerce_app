import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../riverpod/riverpod_management.dart';

class BottomNavBar extends ConsumerWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var watch = ref.watch(bottomNavBarRiverpod);
    var read = ref.read(bottomNavBarRiverpod);
    return BottomNavigationBar(
      items: read.items,
      currentIndex: watch.currentIndex,
      onTap: (index) => read.setCurrentIndex(index),
    );
  }
}
