import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/my_text_field/my_text_field.dart';
import 'home_controller/home_controller.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<HomeController>();
    return IndexedStack(
      index: controller.currentIndexPage,
      children: const [
        _Delivery(),
        _Pickup(),
      ],
    );
  }
}

class _Delivery extends StatelessWidget {
  const _Delivery();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: const [
          Text('_Delivery'),
          MyTextField(hintText: 'adress'),

        ],
      ),
    );
  }
}

class _Pickup extends StatelessWidget {
  const _Pickup();
  @override
  Widget build(BuildContext context) {
    return const Text('_Pickup');
  }
}
