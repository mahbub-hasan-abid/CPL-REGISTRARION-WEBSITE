import 'package:cpl_form/page/thank_youPage.dart';
import 'package:cpl_form/utils/custome_toast.dart';
import 'package:cpl_form/utils/imagepick.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:pushable_button/pushable_button.dart';
import 'dart:typed_data';

class SecondSection extends StatefulWidget {
  SecondSection({super.key});

  @override
  State<SecondSection> createState() => _SecondSectionState();
}

class _SecondSectionState extends State<SecondSection> {
  final TextEditingController nameController = TextEditingController();
  final FocusNode nameFocusNode = FocusNode();

  final TextEditingController phoneController = TextEditingController();
  final FocusNode phoneFocusNode = FocusNode();

  String? playerRole;
  String? session;
  Uint8List? selectedImageBytes;
  String imageUrl = "";

  @override
  void initState() {
    super.initState();

    // Listeners to ensure focus stays on text fields if they lose it unintentionally
    nameFocusNode.addListener(() {
      if (!nameFocusNode.hasFocus && nameController.text.isEmpty) {
        setState(() {}); // Rebuild to make field visible
      }
    });

    phoneFocusNode.addListener(() {
      if (!phoneFocusNode.hasFocus && phoneController.text.isEmpty) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    nameFocusNode.dispose();
    phoneController.dispose();
    phoneFocusNode.dispose();
    super.dispose();
  }

  void onImageSelected(Uint8List imageBytes) {
    selectedImageBytes = imageBytes;
  }

  Future<void> updateImageToFirebase() async {
    final storage = firebase_storage.FirebaseStorage.instance;
    final ref = storage
        .ref()
        .child('Player Images')
        .child('${nameController.text}.jpg');

    final uploadTask = ref.putData(selectedImageBytes!);
    await uploadTask.whenComplete(() {});
    imageUrl = await ref.getDownloadURL();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 14, 15, 24),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Form(
              child: Column(
                children: [
                  const Text(
                    'CPL Player Form',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildTextField(
                      'Name', 'Enter name', nameController, nameFocusNode),
                  const SizedBox(height: 10),
                  _buildTextField(
                      'Phone', 'Enter phone', phoneController, phoneFocusNode,
                      keyboardType: TextInputType.phone),
                  const SizedBox(height: 10),
                  _buildDropdownField(
                      'Player Role',
                      [
                        'Batter',
                        'Bowler',
                        'All-rounder',
                        'Wicketkeeper-Batter'
                      ],
                      "playerRole"),
                  const SizedBox(height: 10),
                  _buildDropdownField(
                      'Session',
                      [
                        '18-19',
                        '19-20',
                        '20-21',
                        '21-22',
                        '22-23',
                        '23-24',
                        'Others'
                      ],
                      "session"),
                  const SizedBox(height: 20),
                  ImageUploadWidget(
                    selectedImageBytes: selectedImageBytes,
                    onImageSelected: onImageSelected,
                  ),
                  const SizedBox(height: 20),
                  PushableButton(
                    height: 50,
                    elevation: 8,
                    hslColor: const HSLColor.fromAHSL(1.0, 120, 1.0, 0.37),
                    onPressed: () async {
                      if (nameController.text.isNotEmpty &&
                          phoneController.text.isNotEmpty &&
                          playerRole != null &&
                          session != null &&
                          selectedImageBytes != null) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const UploadSuccessfulScreen()));
                        FirebaseFirestore firestore =
                            FirebaseFirestore.instance;
                        await updateImageToFirebase();

                        firestore
                            .collection('Players')
                            .doc(session)
                            .collection(nameController.text)
                            .add({
                          'name': nameController.text,
                          'phone': phoneController.text,
                          'playerRole': playerRole,
                          'Image Link': imageUrl,
                        }).catchError((error) {
                          CustomToast(context).showErrorToast(
                              title: "Error",
                              description: 'Failed to update information');
                          print(error);
                        });
                      } else {
                        CustomToast(context).showWarningToast(
                            title: "Warning",
                            description: 'Please fill all the fields');
                      }
                    },
                    child: const Text(
                      'Submit ',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, String hint,
      TextEditingController controller, FocusNode focusNode,
      {TextInputType keyboardType = TextInputType.text}) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      style: const TextStyle(color: Color.fromARGB(255, 255, 253, 253)),
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: const Color(0xFF3B3E5B),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        labelStyle: const TextStyle(color: Colors.grey),
      ),
      keyboardType: keyboardType,
      onTap: () {
        setState(() {});
      },
    );
  }

  Widget _buildDropdownField(String label, List<String> items, String type) {
    String? selectedItem;
    return DropdownButtonFormField<String>(
      value: selectedItem,
      dropdownColor: const Color(0xFF3B3E5B),
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: const Color(0xFF3B3E5B),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        labelStyle: const TextStyle(color: Colors.grey),
      ),
      items: items
          .map((item) => DropdownMenuItem(
                value: item,
                child: Text(
                  item,
                  style: const TextStyle(color: Colors.white),
                ),
              ))
          .toList(),
      onChanged: (value) {
        setState(() {
          if (type == "playerRole") {
            playerRole = value;
          } else {
            session = value;
          }
        });
      },
    );
  }
}
