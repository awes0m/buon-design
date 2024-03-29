// ignore_for_file: prefer_final_locals

import 'dart:math';
import 'dart:typed_data';

import 'package:buon_online_store/models/image_file_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

void showSnackBar(BuildContext context, String content,
    {Color backGroundColor = Colors.deepOrange}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Center(child: Text(content)),
    backgroundColor: backGroundColor,
  ));
}

String getNameFromEmail(String email) {
  return email.split('@')[0];
}

Future<List<ImageFileData>> pickimages() async {
  List<ImageFileData> images = <ImageFileData>[];
  final ImagePicker picker = ImagePicker();

  final List<XFile> imageFiles = await picker.pickMultiImage();
  if (imageFiles.isNotEmpty) {
    for (final XFile image in imageFiles) {
      Uint8List bytes = await image.readAsBytes();
      images.add(ImageFileData(metadata: image.mimeType!, bytes: bytes));
    }
  }

  return images;
}

Text appText(
  String text, {
  Color? color,
  double? size,
  FontWeight? fontWeight,
}) =>
    Text(
      text,
      overflow: TextOverflow.ellipsis,
      style: (color != null || size != null)
          ? TextStyle(
              color: color,
              fontSize: size,
              fontWeight: fontWeight ?? FontWeight.w300)
          : null,
    );

double getMaxWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double getMaxHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

/// A constant that is true if the application was compiled to run on the web.
const bool kIsWeb = bool.fromEnvironment('dart.library.js_util');

// Random String Generator
const String _chars =
    'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random();
String getRandomString(int length) => String.fromCharCodes(
      Iterable<int>.generate(
          length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))),
    );

String? extractImageId(String inputString) {
  final RegExp regex = RegExp(r'/files/([^/]+)/');
  final RegExpMatch? match = regex.firstMatch(inputString);

  if (match != null && match.groupCount >= 1) {
    return match.group(1);
  }

  return null; // Return null if no match found
}

Future<void> openUrl(String url) async {
  if (!await launchUrl(Uri.parse(url))) {
    throw Exception('Could not launch $url');
  }
}

// ValueChanged<Color> callback
void pickColor(context, setState, Color currentColor) {
// create some values
  late Color pickerColor = const Color.fromARGB(255, 255, 255, 255);
// raise the [showDialog] widget
  showDialog(
    builder: (context) => AlertDialog(
      title: const Text('Pick a color!'),
      content: SingleChildScrollView(
        child: BlockPicker(
          useInShowDialog: true,
          pickerColor: pickerColor,
          onColorChanged: (currentColor) {
            currentColor = pickerColor;
          },
        ),
        // Use Material color picker:
        //
        // child: MaterialPicker(
        //   pickerColor: pickerColor,
        //   onColorChanged: changeColor,
        //   showLabel: true, // only on portrait mode
        // ),
        //
        // Use Block color picker:
        //
        // child: BlockPicker(
        //   pickerColor: currentColor,
        //   onColorChanged: changeColor,
        // ),
        //
        // child: MultipleChoiceBlockPicker(
        //   pickerColors: currentColors,
        //   onColorsChanged: changeColors,
        // ),
      ),
      actions: <Widget>[
        ElevatedButton(
          child: const Text('Got it'),
          onPressed: () {
            setState(() {
              currentColor = pickerColor;
            });
            Navigator.of(context).pop();
          },
        ),
      ],
    ),
    context: context,
  );
// raise the [showDialog] widget
}
