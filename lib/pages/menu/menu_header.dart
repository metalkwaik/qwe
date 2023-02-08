import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'menu_controller/menu_controller.dart';

class MenuHeader extends StatelessWidget {
  const MenuHeader({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Wrap(
        spacing: 10.0,
        direction: Axis.horizontal,
        children: List.generate(
          CategoryPage.values.length,
          (index) => _ItemBuild(index: index),
        ),
      ),
    );
  }
}

class _ItemBuild extends StatelessWidget {
  final int index;
  const _ItemBuild({required this.index});

  @override
  Widget build(BuildContext context) {
    List icon = <IconData>[
      Icons.bakery_dining_outlined,
      Icons.wine_bar_outlined
    ];
    final controller = context.watch<MenuControll>();
    final title = CategoryPage.values[index].name.toString();
    final bool select = title == controller.categoryPageName.name;
    return InkWell(
      onTap: () => controller.setScreen(index),
      child: AnimatedContainer(
        height: 45,
        constraints: const BoxConstraints(maxWidth: 100, minWidth: 70),
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(select ? 15 : 10),
            color: select ? Colors.teal : Colors.teal[200]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            !select
                ? Text(
                    title,
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 14,
                    ),
                  )
                : index <= icon.length - 1
                    ? Row(
                        children: [
                          Icon(icon[index]),
                          const SizedBox(width: 10),
                          Text(
                            title,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      )
                    : Text(title),
          ],
        ),
      ),
    );
  }
}
