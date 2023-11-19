import 'package:flutter/material.dart';

class AppDropdownInput<T> extends StatelessWidget {
  const AppDropdownInput({
    super.key,
    this.hintText = 'Please select an Option',
    required this.options,
    required this.value,
    this.getLabel,
    required this.onChanged,
  });
  final String hintText;
  final List<T> options;
  final T value;
  final String Function(T)? getLabel;
  final void Function(T?) onChanged;

  @override
  Widget build(BuildContext context) {
    return FormField<T>(
      builder: (FormFieldState<T> state) {
        return InputDecorator(
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
            // labelStyle: textStyle,
            errorStyle:
                const TextStyle(color: Colors.redAccent, fontSize: 16.0),
            hintText: hintText,
            labelText: hintText,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
          ),
          isEmpty: value == null || value == '',
          child: DropdownButtonHideUnderline(
            child: DropdownButton<T>(
              value: value,
              isDense: true,
              onChanged: onChanged,
              items: options.map((T value) {
                return DropdownMenuItem<T>(
                  value: value,
                  child: getLabel == null
                      ? Text(value.toString())
                      : Text(getLabel!(value)),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
