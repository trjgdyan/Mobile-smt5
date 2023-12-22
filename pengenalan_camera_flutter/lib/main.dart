import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: false,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  File? imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tri Jagad Ariyani/2141720049'),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.pink[50],
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    "${DateTime.now().hour}:${DateTime.now().minute}",
                    style: const TextStyle(fontSize: 50),
                  ),
                  Text(
                    "${DateFormat('EEEE').format(DateTime.now())}, ${DateTime.now().day} ${DateFormat('MMMM').format(DateTime.now())} ${DateTime.now().year}",
                    style: const TextStyle(fontSize: 20),
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
                    border: Border.all(width: 8, color: Colors.black),
                    borderRadius: BorderRadius.circular(12.0),
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
                    borderRadius: BorderRadius.circular(50.0),
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
                      onTap: () {},
                      child: const CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.pink,
                        child: Icon(
                          Icons.phone,
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
                      onTap: () {
                        refresh();
                      },
                      child: const CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.pink,
                        child: Icon(
                          Icons.refresh,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void getImage({required ImageSource source}) async {
    final file = await ImagePicker().pickImage(
      source: source,
      maxWidth: 640,
      maxHeight: 480,
      imageQuality: 70, //0 - 100
    );

    if (file?.path != null) {
      setState(() {
        imageFile = File(file!.path);
      });
    }
  }

  void refresh() {
    setState(() {
      imageFile = null;
    });
  }
}
