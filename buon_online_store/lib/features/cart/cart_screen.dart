import 'package:buon_online_store/apis/auth_api.dart';
import 'package:buon_online_store/common/common.dart';
import 'package:buon_online_store/models/app_user_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'provider/cart_provider.dart';

class CartScreen extends ConsumerStatefulWidget {
  final AppUserInfo user;
  const CartScreen(this.user, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cart = ref.watch(cartProvider);
    return ref.watch(appUserInfoProvider(widget.user.uid)).when(
        data: (appuser) {
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
                          onPressed: () => ref
                              .read(cartProvider.notifier)
                              .addToCart(CartItemModel(
                                product: cartItem.product,
                              )),
                        ),
                      ],
                    ),
                  );
                },
              ));
        },
        error: (e, _) => ErrorText(error: e.toString()),
        loading: () => const Loader());
  }
}
