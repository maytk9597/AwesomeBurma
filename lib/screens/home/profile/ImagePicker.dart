import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

File _image;
PickedFile pickedFile;
final _picker = ImagePicker();
bool hasChange = false;
String url;
FirebaseStorage _storage = FirebaseStorage.instance;
String uploadedPhotoUrl, uId;
Future<String> getPhotoUrl(File image) async {
  uId = FirebaseAuth.instance.currentUser.uid;
  await _storage.ref().child('users/profile/$uId').putFile(image);
  uploadedPhotoUrl = await _storage.ref('users/profile/$uId').getDownloadURL();
  return uploadedPhotoUrl;
}

//To get image from Camera
