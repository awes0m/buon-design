import 'package:buon_online_store/core/enums.dart';
import 'package:buon_online_store/features/admin/controller/admin_screen_controller.dart';
import 'package:buon_online_store/models/image_file_data.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/common.dart';
import '../../../constants/constants.dart';
import '../../../core/core.dart';

class AddProductForm extends ConsumerStatefulWidget {
  const AddProductForm({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddProductFormState();
}

class _AddProductFormState extends ConsumerState<AddProductForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  Categories selectedCategory = Categories.polaroid;
  bool _isCustomProduct = true;
  bool _isBestSeller = false;
  List<ImageFileData> imageFiles = <ImageFileData>[];
  List<String> availableColors = <String>[];

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final CarouselOptions cOptions = CarouselOptions(
    enableInfiniteScroll: false,
    viewportFraction: 0.5,
    autoPlay: true,
    aspectRatio: 0.7 / 0.3,
  );

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();

    super.dispose();
  }

  Future<void> onPickImages() async {
    List<ImageFileData> imageLink = await pickimages();

    setState(() {
      imageFiles = imageLink;
    });
  }

  void onSubmit() {
    if (imageFiles.isEmpty) {
      return showSnackBar(context, "Please select atleast one image");
    }
    if (_formKey.currentState!.validate()) {
      ref.read(adminScreenControllerProvider.notifier).createANewProduct(
            context,
            _nameController.text,
            selectedCategory.name,
            _descriptionController.text,
            availableColors,
            imageFiles,
            double.parse(_priceController.text),
            _isCustomProduct,
            _isBestSeller,
          );
    } else {
      return showSnackBar(context, "Please fill all the required fields");
    }
  }

  @override
  Widget build(BuildContext context) {
    final double pageHeight = getMaxHeight(context);
    final double pageWidth = getMaxWidth(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
        actions: [
          TextButton.icon(
              onPressed: onSubmit,
              icon: const Icon(Icons.add),
              label: const Text('Submit Product'))
        ],
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: Container(
            height: pageHeight - 60,
            width:
                ScreenHelper.isMobile(context) ? pageWidth : pageWidth * 0.45,
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  verticalGap(),
                  // Product Name
                  CustomTextField(
                      controller: _nameController,
                      hintText: 'Product Name',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Product name cant be empty';
                        }
                        if (value.length < 3) {
                          return 'Product name needs to be at least 3 characters';
                        }
                        return null;
                      }),
                  verticalGap(),
                  // Product Category
                  AppDropdownInput<Categories>(
                    hintText: 'Category',
                    onChanged: (Categories? val) {
                      setState(() {
                        selectedCategory = val!;
                      });
                    },
                    options: Categories.values,
                    value: selectedCategory,
                  ),
                  verticalGap(),
                  // Product Description
                  CustomTextField(
                    controller: _descriptionController,
                    hintText: 'Description',
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'Description cant be empty';
                      }
                      if (val.length < 30) {
                        return 'Description needs to be at least 30 characters';
                      }
                      return null;
                    },
                  ),
                  verticalGap(),
                  // Product Image URLs
                  GestureDetector(
                    onTap: onPickImages,
                    child: Container(
                        height: pageHeight * 0.3,
                        width: pageWidth * 0.7,
                        decoration: const BoxDecoration(
                            color: Colors.grey,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: imageFiles.isEmpty
                            ? const Icon(Icons.add)
                            : CarouselSlider(
                                items: imageFiles
                                    .map((ImageFileData e) => Image.memory(
                                          e.bytes,
                                          fit: BoxFit.fitHeight,
                                        ))
                                    .toList(),
                                options: cOptions)),
                  ),
                  verticalGap(),
                  // Product Price
                  CustomTextField(
                    controller: _priceController,
                    hintText: 'Price',
                    validator: (value) {
                      if (value!.isNotEmpty &&
                          !RegExp('^[0-9]*\$').hasMatch(value)) {
                        return 'Price needs to be number';
                      }
                      return null;
                    },
                  ),
                  verticalGap(),
                  // Colors

                  // ListFormWidget(
                  //   availableColors,
                  //   itemName: "Available Colors",
                  // ),
                  verticalGap(),
                  // Is Custom Product
                  CheckboxListTile(
                    title: const Text('Is Custom Product'),
                    value: _isCustomProduct,
                    onChanged: (bool? value) {
                      setState(() {
                        _isCustomProduct = value!;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: const Text('Is is Best Seller'),
                    value: _isBestSeller,
                    onChanged: (bool? value) {
                      setState(() {
                        _isBestSeller = value!;
                      });
                    },
                  ),
                  verticalGap(),
                  // Add a submit button to save the product
                  ElevatedButton(
                    onPressed: () {
                      onSubmit();
                    },
                    child: const Text('Save Product'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
