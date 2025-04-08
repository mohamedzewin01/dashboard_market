import 'dart:io';
import 'dart:typed_data';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';


// Future<File> resizeAndCompressImage( /// Reduce image size
//     {required File imageFile, int? width, int? height, int? quality}) async {
//   final image = img.decodeImage(imageFile.readAsBytesSync());
//   final resizedImage = img.copyResize(image!, width: width, height: height);
//   final resizedImageFile = File('${imageFile.path}_resized.jpg')
//     ..writeAsBytesSync(img.encodeJpg(resizedImage, quality: quality??95));
//   return resizedImageFile;
// }
//
// Future<File> resizeAndCompressImage({
//   required File imageFile,
//   int width = 600,
//   int? height,
//   int quality = 70,
// }) async {
//   final image = img.decodeImage(imageFile.readAsBytesSync());
//
//   // تصغير الأبعاد
//   final resizedImage = img.copyResize(image!, width: width, height: height);
//
//   // مسار جديد بنفس اسم الملف الأصلي لكن في مجلد مؤقت
//   final String dir = Directory.systemTemp.path;
//   final String newPath = '$dir/resized_${DateTime.now().millisecondsSinceEpoch}.jpg';
//
//   final resizedImageFile = File(newPath)
//     ..writeAsBytesSync(img.encodeJpg(resizedImage, quality: quality));
//
//   return resizedImageFile;
// }

Future<File> resizeAndCompressImage({
  required File imageFile,
  int width = 600,
  int? height,
  int quality = 70,
}) async {
  final image = img.decodeImage(imageFile.readAsBytesSync());

  final resizedImage = img.copyResize(image!, width: width, height: height);

  String extension = imageFile.path.split('.').last.toLowerCase();
  final String dir = Directory.systemTemp.path;
  final String newPath = '$dir/resized_${DateTime.now().millisecondsSinceEpoch}.$extension';

  Uint8List imageBytes;
  if (extension == 'png') {
    imageBytes = Uint8List.fromList(img.encodePng(resizedImage));
  } else {
    imageBytes = Uint8List.fromList(img.encodeJpg(resizedImage, quality: quality));
  }

  final resizedImageFile = File(newPath)..writeAsBytesSync(imageBytes);
  return resizedImageFile;
}


// Future<File> resizeAndCompressImage({
//   required File imageFile,
//   int? width,
//   int? height,
//   int? quality,
// }) async {
//   final image = img.decodeImage(imageFile.readAsBytesSync());
//   final resizedImage = img.copyResize(image!, width: width, height: height);
//
//   final resizedImageFile = File('${imageFile.path}_resized.jpg')
//     ..writeAsBytesSync(img.encodeJpg(resizedImage, quality: quality ?? 95));
//
//   return resizedImageFile;
// }

Future<File?> pickImage() async {

  final XFile? xFile = await ImagePicker().pickImage(source: ImageSource.gallery);
  if (xFile != null) {
    File originalImageFile = File(xFile.path);
    File resizedImageFile = await resizeAndCompressImage(
      /// تصغير حجم الصورة
        imageFile: originalImageFile,
        width: 800,
        quality: 95);
    // setState(() {
    //   widget.viewModel.imageFile = resizedImageFile;
    // });
    return resizedImageFile;
  }

  return null;
}