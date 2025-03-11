import 'dart:io';
import 'package:image/image.dart' as img;


Future<File> resizeAndCompressImage( /// Reduce image size
    {required File imageFile, int? width, int? height, int? quality}) async {
  final image = img.decodeImage(imageFile.readAsBytesSync());
  final resizedImage = img.copyResize(image!, width: width, height: height);
  final resizedImageFile = File('${imageFile.path}_resized.jpg')
    ..writeAsBytesSync(img.encodeJpg(resizedImage, quality: quality??95));
  return resizedImageFile;
}