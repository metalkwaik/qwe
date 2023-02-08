import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/item_model.dart';
import 'package:provider/provider.dart';
import '../../models/cart_model.dart';
import '../cart/cart_controlle/cart_controller.dart';
import 'menu_controller/menu_controller.dart';

class MenuBody extends StatelessWidget {
  const MenuBody({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<MenuControll>();
    return Expanded(
      child: SingleChildScrollView(
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.productData?.length ?? 0,
          itemBuilder: (_, int index) => _ItemBuilder(

            index : index ,
          ),
        ),
      ),
    );
  }
}

class _ItemBuilder extends StatelessWidget {
  final int index;
  const _ItemBuilder({required this.index});
  @override
  Widget build(BuildContext context) {
        final controller = context.watch<MenuControll>();
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Card(
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: Colors.teal[100],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _ItemImg(img: controller.productData![index].img!),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 10.0, left: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _ItemTitle(name: controller.productData![index].name ?? ''),
                        const SizedBox(height: 9),
                        _ItemDescription(description: controller.productData![index].description ?? ''),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            _UpDataItem(index: index, item: controller.productData![index],),
          ],
        ),
      ),
    );
  }
}

class _ItemImg extends StatelessWidget {
  final String img;
  const _ItemImg({required this.img});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Image(
        fit: BoxFit.cover,
        image: NetworkImage(img),
      ),
    );
  }
}

class _ItemTitle extends StatelessWidget {
  final String name;
  const _ItemTitle({required this.name});
  @override
  Widget build(BuildContext context) {
    return Text(name);
  }
}

class _ItemDescription extends StatelessWidget {
  final String description;
  const _ItemDescription({required this.description});
  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      maxLines: 4,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class _UpDataItem extends StatelessWidget {
  final int index;
  final ProductData item ;
  const _UpDataItem({ required this.index, required this.item});
  @override
  Widget build(BuildContext context) {
    final cardController = context.watch<CartController>();
    return

    Row(
      children: [
        GestureDetector(
          onTap: () {
            cardController.upDataCountProductInCart(false, item);
          },
          child: const  Icon(
            Icons.remove,
          ),
        ),
       Text(cardController.getCountProduct(item)) ,
        GestureDetector(
          onTap: () => cardController.upDataCountProductInCart(true,  item),
          child: const Icon(
            Icons.add,
          ),
        ),
      ],
    );

  }
}
