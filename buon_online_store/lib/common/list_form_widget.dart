// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import 'custom_text_field.dart';

class ListFormWidget extends StatefulWidget {
  const ListFormWidget(this.itinerary, {super.key, this.itemName = 'Item'});
  final String itemName;
  final List<String> itinerary;

  @override
  _ListFormWidgetState createState() => _ListFormWidgetState();
}

class _ListFormWidgetState extends State<ListFormWidget> {
  final TextEditingController _itineraryController = TextEditingController();

  @override
  void dispose() {
    _itineraryController.dispose();
    super.dispose();
  }

  void _addItem() {
    setState(() {
      final String item = _itineraryController.text;
      if (item.isNotEmpty) {
        widget.itinerary.add(item);
        _itineraryController.clear();
      }
    });
  }

  void _removeItem(int index) {
    setState(() {
      widget.itinerary.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          CustomTextField(
            controller: _itineraryController,
            hintText: 'Add Item',
            validator: (String? val) => null,
          ),
          const SizedBox(height: 16.0),
          Align(
            alignment: Alignment.bottomRight,
            child: ElevatedButton(
              onPressed: _addItem,
              child: const Text('Add'),
            ),
          ),
          const SizedBox(height: 16.0),
          ListView.builder(
            shrinkWrap: true,
            itemCount: widget.itinerary.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(widget.itinerary[index]),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => _removeItem(index),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
