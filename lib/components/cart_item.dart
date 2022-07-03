// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';
import '../models/cart_item.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({Key? key, required this.cartItem}) : super(key: key);
  final CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(cartItem.id),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Theme.of(context).errorColor,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 10),
        margin: const EdgeInsets.all(5),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
      ),
      onDismissed: (_) {
        Provider.of<Cart>(context, listen: false)
            .removeItem(cartItem.productId);
      },
      child: Card(
        margin: const EdgeInsets.all(5),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: FittedBox(
                child: Text(
                  '${cartItem.price.toStringAsFixed(2)}',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          title: Text(cartItem.name),
          subtitle: Text('Total: R\$ ${cartItem.totalValueText()}'),
          trailing: Text('${cartItem.quantity}x'),
        ),
      ),
    );
  }
}
