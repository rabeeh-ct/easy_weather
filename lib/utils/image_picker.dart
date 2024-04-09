// import 'package:image_picker/image_picker.dart';
//
// class ImagePickerUtils {
//   ImagePicker picker = ImagePicker();
//   XFile? _image;
//   // File? _imageFile;
//
//   Future<XFile?> imagePick() async {
//     _image=null;
//     _image = await picker.pickImage(source: ImageSource.camera,imageQuality: 60);
//     if(_image!=null){
//       // _imageFile=File(_image!.path);
//       return _image;
//     }
//     return null;
//   }
//
//   Future<XFile?> galleryPick() async {
//     _image=null;
//     _image = await picker.pickImage(source: ImageSource.gallery,imageQuality: 60);
//     if (_image != null) {
//       // _imageFile = File(_image!.path);
//       return _image;
//     }
//     return null;
//   }
// }
