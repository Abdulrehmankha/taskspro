// import 'dart:io';
//
//
// import 'package:file_picker/file_picker.dart';
// import 'package:get/get.dart';
// import 'package:igive/Controller/event_controller.dart';
// import 'package:image_picker/image_picker.dart';
// import '';
// class SelectImage{
//
//   Future<File> imgFromCamera() async {
//     final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera,imageQuality: 20);
//     if(pickedFile!=null){
//       File file= File(pickedFile.path);
//       return file;
//     }else{
//       return File("");
//     }
//   }
//   Future imgFromGallery() async {
//     final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery,imageQuality: 20);
//     if(pickedFile!=null){
//       File file= File(pickedFile.path);
//       return file;
//     }else{
//       return File("");
//     }
//
//   }
//   Future filesFromGallery() async {
//     EventController eventController=Get.find();
//     print("Enter in picked files");
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//         type: FileType.custom,
//        withData: true,
//         allowedExtensions: [
//           'jpg',
//           'jpeg',
//           'png',
//         ],
//         allowMultiple: true);
//     if (result != null) {
//
//     result.files.map((e) => eventController.mediaFiles.value.addIf(eventController.mediaFiles.value.where((element) => element.path==e.path).length==0, File(e.path!))).toList();
//       // tempMediaFiles.value = result.paths.map((path) => File(path!)).toList();
//     print(eventController.mediaFiles.value.length.toString());
//       print("Picked Filesss : ");
//
//     } else {
//       print("Picked Not picked");
//     }
//   }
// }