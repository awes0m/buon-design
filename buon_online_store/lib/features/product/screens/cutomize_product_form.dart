import 'dart:js_interop';

import 'package:buon_online_store/common/logging_service.dart';
import 'package:buon_online_store/core/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:buon_online_store/common/common.dart';

import '../../../models/order.dart';
import '../../../models/product.dart';

class CustomizeProductForm extends ConsumerStatefulWidget {
  final Product product;
  final User? user;
  const CustomizeProductForm({
    super.key,
    required this.product,
    this.user,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CustomizeProductFormState();
}

class _CustomizeProductFormState extends ConsumerState<CustomizeProductForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController messageController = TextEditingController();
  final TextEditingController colorController = TextEditingController();
  String colorValue = 'default';
  List<String> availableColorList = [];

  @override
  void initState() {
    setState(() {
      availableColorList = widget.product.availableColors;
    });
    super.initState();
  }

  @override
  void dispose() {
    productNameController.dispose();
    usernameController.dispose();
    messageController.dispose();
    colorController.dispose();
    super.dispose();
  }

  void onSubmit() async {
    if (_formKey.currentState!.validate()) {
      //Create an order
      //Add product to order
      Order newOrder = Order(
        uid: "${widget.product.category}-${getRandomString(6)}",
        productName: widget.product.name,
        productCategory: widget.product.category,
        username: (widget.user.isDefinedAndNotNull)
            ? widget.user!.displayName!
            : usernameController.text,
        message: messageController.text,
        contactNumber: '',
        imageUrls: [],
        shippingAdress: [],
      );
      LoggingService.logText(newOrder.toJson().toString());
      // await ref.read(orderAPIProvider).createNewOrder(newOrder);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Customize your product')),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                AppLargetext(
                    text:
                        "Hi ${widget.user!.displayName}, Lets customize your Product"),
                AppText(text: 'Product:- ${widget.product.name}'),
                CustomTextField(
                  controller: messageController,
                  hintText: 'Message',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Message is required';
                    }
                    return null;
                  },
                ),
                Text(widget.product.availableColors.toString()),
                DropdownButtonFormField<String>(
                  hint: const Text('Select your favourite fruit'),
                  value: colorValue,
                  onChanged: (String? newValue) {
                    setState(() {
                      colorValue = newValue!;
                    });
                  },
                  items: availableColorList
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                // CustomTextField(
                //     hintText: 'Enter your choice of color',
                //     controller: colorController,
                //     validator: (String? value) {
                //       if (value!.isEmpty) {
                //         return 'Color is required';
                //       }
                //       if (widget.product.availableColors.contains(value) ||
                //           widget.product.availableColors
                //               .contains(value.toUpperCase()) ||
                //           widget.product.availableColors
                //               .contains(value.toLowerCase()) ||
                //           widget.product.availableColors.contains(
                //               value[0].toUpperCase() +
                //                   value.substring(1).toLowerCase())) {
                //         {
                //           colorValue = value;
                //           return null;
                //         }
                //       } else {
                //         return 'Please choose among Available Colors';
                //       }
                //     }),

                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
