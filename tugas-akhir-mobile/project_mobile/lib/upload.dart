import 'package:flutter/material.dart';
import 'package:gallery_saver_plus/gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
// import 'package:gallery_saver/gallery_saver.dart'; // Import the gallery_saver package
import 'dart:io';

class UploadImagess extends StatefulWidget {
  const UploadImagess({super.key});

  @override
  State<UploadImagess> createState() => _UploadState();
}

class _UploadState extends State<UploadImagess> {
  File? imageFile;

  Future getImage({required ImageSource source}) async {
    final file = await ImagePicker().pickImage(
      source: source,
      maxWidth: 480,
      maxHeight: 640,
      imageQuality: 100,
    );

    if (file?.path != null) {
      setState(() {
        imageFile = File(file!.path);
      });
    }
  }

  Future<void> _uploadImage() async {
    try {
      if (imageFile == null) {
        print('Please select an image first.');
        return;
      }

      String apiUrl = 'https://8853-114-6-31-174.ngrok-free.app/upload';

      var request = http.MultipartRequest('POST', Uri.parse(apiUrl));
      request.files
          .add(await http.MultipartFile.fromPath('img', imageFile!.path));
      request.headers['Content-Type'] = 'image/jpeg';

      try {
        var response = await request.send();
        if (response.statusCode == 200) {
          print('Image uploaded successfully!');
          await GallerySaver.saveImage(
              imageFile!.path); // Save image to gallery
        } else {
          print('Failed to upload image. Status code: ${response.statusCode}');
        }
      } catch (error) {
        print('Error sending request: $error');
      }
    } catch (error) {
      print('Error uploading image: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Halaman Upload"),
      ),
      body: Container(
        color: Colors.pink[50],
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Column(
                children: [
                  Text(
                    "Drop Image Here",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              if (imageFile != null)
                Container(
                  width: 330,
                  height: 410,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    image: DecorationImage(
                      image: FileImage(imageFile!),
                      fit: BoxFit.cover,
                    ),
                    border: Border.all(width: 4, color: Colors.black),
                    borderRadius: BorderRadius.circular(1.0),
                  ),
                )
              else
                Container(
                  width: 330,
                  height: 410,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(width: 6, color: Colors.black12),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: const Text(
                    'Image should appear here!',
                    style: TextStyle(fontSize: 20, color: Colors.pink),
                  ),
                ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => getImage(source: ImageSource.camera),
                      child: const CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.pink,
                        child: Icon(
                          Icons.camera_alt_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => getImage(source: ImageSource.gallery),
                      child: const CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.pink,
                        child: Icon(
                          Icons.insert_photo,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => _uploadImage(),
                      child: const CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.pink,
                        child: Icon(
                          Icons.upload_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
