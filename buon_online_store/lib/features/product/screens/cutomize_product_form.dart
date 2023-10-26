// import 'package:buon_online_store/common/common.dart';
// import 'package:buon_online_store/features/auth/controllers/auth_controller.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../../../models/customized_product.dart';
// import '../../../models/product.dart';
// import '../controller/product_controller.dart';

// class CustomizeProductForm extends ConsumerStatefulWidget {
//   final Product product;
//   const CustomizeProductForm(this.product, {super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() =>
//       _CustomizeProductFormState();
// }

// class _CustomizeProductFormState extends ConsumerState<CustomizeProductForm> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final TextEditingController productNameController = TextEditingController();
//   final TextEditingController usernameController = TextEditingController();
//   final TextEditingController messageController = TextEditingController();
//   final TextEditingController colorController = TextEditingController();

//   @override
//   void dispose() {
//     productNameController.dispose();
//     usernameController.dispose();
//     messageController.dispose();
//     colorController.dispose();
//     super.dispose();
//   }

//   late User user;

//   void getUser() async {
//     user =
//         await ref.watch(authControllerProvider.notifier).currentUser() as User;
//   }

//   @override
//   void initState() {
//     getUser();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: const Text('Customize your product'),
//       content: Form(
//         key: _formKey,
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             AppText(text: 'Product:- ${widget.product.name}'),
//             AppText(text: user.displayName! ?? 'User'),
//             CustomTextField(
//               controller: messageController,
//               hintText: 'Message',
//               validator: (value) {
//                 if (value!.isEmpty) {
//                   return 'Message is required';
//                 }
//                 return null;
//               },
//             ),
//             CustomTextField(
//               controller: colorController,
//               hintText: 'Color',
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 if (_formKey.currentState!.validate()) {
//                   final newProduct = CustomizedProduct(
//                     uid: UniqueKey().toString(),
//                     productName: widget.product.name,
//                     username: usernameController.text,
//                     message: messageController.text,
//                     color: colorController.text.isNotEmpty
//                         ? colorController.text
//                         : 'any',
//                     imageUrl: '',
//                     useremail: '',
//                   );
//                   ref
//                       .watch(productScreenControllerProvider.notifier)
//                       .createNewCustomProduct(newProduct);
//                   Navigator.of(context).pop();
//                 }
//               },
//               child: const Text('Submit'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
