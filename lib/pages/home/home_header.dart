import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_controller/home_controller.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = context.read<HomeController>();
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      color: Colors.teal[200],
      child: Row(
        children: List.generate(
          controller.listTextBtn.length,
          (index) => _ButtonHeader(
            index: index,
          ),
        ),
      ),
    );
  }
}

class _ButtonHeader extends StatelessWidget {
  final int index;
  const _ButtonHeader({required this.index});
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<HomeController>();
    return Expanded(
      child: InkWell(
        onTap: () => controller.setScreen(index),
        child: Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            color: index == controller.currentIndexPage
                ? Colors.teal
                : Colors.teal[100],
            child: Center(child: Text(controller.listTextBtn[index]))),
      ),
    );
  }
}
