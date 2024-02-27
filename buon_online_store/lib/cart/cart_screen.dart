import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'provider/cart_provider.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cart'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: ListView.builder(
          itemCount: cart.length,
          itemBuilder: (context, index) {
            final cartItem = cart[index];
            return ListTile(
              title: Text(cartItem.product.name),
              subtitle: Text(
                  '${cartItem.quantity} x ${cartItem.product.price.toStringAsFixed(2)}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () => ref
                        .read(cartProvider.notifier)
                        .removeFromCart(
                            CartItemModel(product: cartItem.product)),
                  ),
                  Text(cartItem.quantity.toString()),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () =>
                        ref.read(cartProvider.notifier).addToCart(CartItemModel(
                              product: cartItem.product,
                            )),
                  ),
                ],
              ),
            );
          },
        ));
  }
}
