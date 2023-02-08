import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/cart_model.dart';
import 'package:flutter_application_1/pages/cart/cart_controlle/cart_controller.dart';
import 'package:flutter_application_1/pages/menu/menu_controller/menu_controller.dart';
import 'package:provider/provider.dart';

import '../../models/item_model.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<CartController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.getItemsList.length,
              itemBuilder: (_, int index) => _ItemBuilder(
                item: controller.getItemsList[index],
              ),
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(height: 9),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 9),
              decoration: BoxDecoration(border: Border.all()),
              child: const Text('Pay')),
        ),
      ],
    );
  }
}

class _ItemBuilder extends StatelessWidget {
  final CartData item;
  const _ItemBuilder({required this.item});
  @override
  Widget build(BuildContext context) {
    final controller = context.read<CartController>();
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(border: Border.all()),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
          child: Row(
            children: [
              Expanded(child: Text(item.product.name!)),
              const Spacer(),
              Row(
                children: [
                  InkWell(
                      onTap: () => controller.upDataCountProductInCart(
                          true, item.product),
                      child: const Icon(Icons.add)),
                  Text(item.count.toString()),
                  InkWell(
                      onTap: () => controller.upDataCountProductInCart(
                          false, item.product),
                      child: const Icon(Icons.remove)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
