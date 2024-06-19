// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:http/http.dart' as http;
// import 'package:http_parser/http_parser.dart';
// import 'package:image_picker/image_picker.dart';
// class user extends StatefulWidget {
//   const user({Key? key}) : super(key: key);
//
//   @override
//   State<user> createState() => _userState();
// }
//
// class _userState extends State<user> {
//
//   File? _image;
//   final picker = ImagePicker();
//
//   Future getImage() async {
//     final pickedFile = await picker.getImage(source: ImageSource.gallery);
//
//     setState(() {
//       if (pickedFile != null) {
//         _image = File(pickedFile.path);
//       } else {
//         print('No image selected.');
//       }
//     });
//   }
//
//   Future uploadImage() async {
//     if (_image == null) return;
//
//    // final Uri url = Uri.parse('https://openapi.naver.com/v1/vision/face');
//
//     var request = http.MultipartRequest('POST', Uri.parse('https://openapi.naver.com/v1/vision/face'));
//     request.files.add(
//       http.MultipartFile(
//         'image',
//         _image!.readAsBytes().asStream(),
//         _image!.lengthSync(),
//         filename: _image!.path.split('/').last,
//         contentType: MediaType('image', 'jpeg'),  // Make sure the 'http_parser' package is imported
//       ),
//     );
//
//     var res = await request.send();
//     if (res.statusCode == 200) {
//       print('Uploaded!');
//     } else {
//       print('Upload failed!');
//     }
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('User Profile'),
//       ),
//       body: Center(
//         child: Column(
//           children: <Widget>[
//             _image == null
//                 ? Text('No image selected.')
//                 : Image.file(_image!),
//             ElevatedButton(
//               onPressed: getImage,
//               child: Icon(Icons.add_a_photo),
//             ),
//             ElevatedButton(
//               onPressed: uploadImage,
//               child: Text('Upload Image'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // Future<void> getFaceData() async {
//   //   final Uri url = Uri.parse('https://openapi.naver.com/v1/vision/face');
//   //   final request = http.MultipartRequest('POST',url);
//   //   request.fields['X-Naver-Client-Id'] = 'client key(I added real value)';
//   //   request.fields['X-Naver-Client-Secret'] = 'client secret(I added real value)';
//   //   request.files.add(await http.MultipartFile.fromPath(
//   //       'image',
//   //       _image.path,
//   //       contentType: MediaType('multipart','form-data')
//   //   ));
//   //
//   //   http.StreamedResponse response = await request.send();
//   //   print(response.statusCode);
//   // }
// }
