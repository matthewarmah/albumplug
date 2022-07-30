import 'dart:io';
import 'package:albumplug3/services/database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreateStory extends StatefulWidget {
  const CreateStory({Key? key}) : super(key: key);

  @override
  State<CreateStory> createState() => _CreateStoryState();
}

class _CreateStoryState extends State<CreateStory> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: GalleryAccess(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class GalleryAccess extends StatefulWidget {
  const GalleryAccess({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return GalleryAccessState();
  }
}

class GalleryAccessState extends State<GalleryAccess> {
  // late File galleryFile;
  // final ImagePicker _picker = ImagePicker();

  var _profileImage;

  var title;

  var text;

  final picker = ImagePicker();

  Future getImageGallery() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedImage != null) {
        _profileImage = File(pickedImage.path);
      } else {
        print('No Image Selected');
      }
    });
  }

  late File sampleImage;
  // String _myValue;
  String? url;
  final formKey = GlobalKey<FormState>();

  Future getImage() async {
    var tempImage = await picker.pickImage(
      source: ImageSource.gallery,
    );

    setState(() {
      sampleImage = tempImage as File;
    });
  }

  Future<void> uploadStatusImage() async {
    if (true) {
      final postImageRef = FirebaseStorage.instance.ref().child("Post Images");

      var timeKey = DateTime.now();

      final imageRef = postImageRef.child("$timeKey.jpg");

      await imageRef.putFile(_profileImage);

      var imageUrl = await imageRef.getDownloadURL();
      url = imageUrl.toString();

      print("ImageUrl = " + url!);

      // goToHomePage();

      // saveToDatabase(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    //display image selected from gallery

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFD4AF37),
        title: const Text(
          'Create Post',
          style: const TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold,
            fontSize: 29.0,
          ),
        ),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 200,
            width: 200,
            color: Colors.amber,
            child: _profileImage == null
                ? Center(
                    child: Text("Image not loaded"),
                  )
                : Image.file(
                    _profileImage,
                  ),
          ),
          ElevatedButton(
            child: const Text('Select Image from Gallery'),
            onPressed: () async {
              await getImageGallery();
            },
          ),
          const SizedBox(
            width: 200.0,
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20.0,
              bottom: 150,
            ),
            child: ElevatedButton(
              child: const Text('UPLOAD'),
              onPressed: () async {
                await uploadStatusImage();
                await Database()
                    .saveStory(imageUrl: url, title: title, text: text);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 50.0),
            child: TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Title:',
              ),
              onChanged: ((value) {
                setState(() {
                  title = value;
                });
              }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Text:',
              ),
              onChanged: ((value) {
                setState(() {
                  text = value;
                });
              }),
            ),
          ),
        ],
      )),
    );
  }
}
