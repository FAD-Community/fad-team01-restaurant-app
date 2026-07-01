import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePictureBottomSheet extends StatelessWidget {
  const ProfilePictureBottomSheet({
    super.key,
    required this.onImageSelected,
  });

  final Function(File image) onImageSelected;

  Future<void> _pickImage(
    BuildContext context,
    ImageSource source,
  ) async {
    final ImagePicker picker = ImagePicker();

    final XFile? image = await picker.pickImage(
      source: source,
      imageQuality: 80,
    );

    if (image == null) return;

    onImageSelected(File(image.path));

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 45,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(20),
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              "Profile Picture",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 24),

            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text("Take a Photo"),
              onTap: () {
                _pickImage(context, ImageSource.camera);
              },
            ),

            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text("Choose from Gallery"),
              onTap: () {
                _pickImage(context, ImageSource.gallery);
              },
            ),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}