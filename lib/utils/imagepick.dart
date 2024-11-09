import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'dart:typed_data';

class ImageUploadWidget extends StatefulWidget {
  ImageUploadWidget(
      {Key? key,
      required this.selectedImageBytes,
      required this.onImageSelected})
      : super(key: key);
  Uint8List? selectedImageBytes;
  final Function(Uint8List) onImageSelected;

  @override
  _ImageUploadWidgetState createState() => _ImageUploadWidgetState();
}

class _ImageUploadWidgetState extends State<ImageUploadWidget> {
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      // Read the picked image as bytes to display on the web
      final bytes = await pickedFile.readAsBytes();
      setState(() {
        widget.selectedImageBytes = bytes;
      });
      widget.onImageSelected(bytes);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Upload Your Image *',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: _pickImage,
          child: Container(
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey, style: BorderStyle.solid),
            ),
            child: widget.selectedImageBytes != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.memory(
                      widget.selectedImageBytes!,
                      fit: BoxFit.scaleDown,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  )
                : const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.image,
                        size: 40,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Browse and Preview an Image',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ],
    );
  }
}
