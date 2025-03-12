// import 'dart:io';
// import 'dart:typed_data';
// import 'package:bloc/bloc.dart';
// import 'package:dashboard_market/features/add_images/domain/use_cases/images_use_case.dart';
// import 'package:flutter/foundation.dart'; // للكشف عن الويب
// import 'package:image_picker/image_picker.dart';
// import 'package:image_picker_web/image_picker_web.dart';
// import 'package:injectable/injectable.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:meta/meta.dart';
//
// // **تعريف الحالات (States)**
// @immutable
// abstract class ImageState {}
//
// class ImageInitial extends ImageState {} // الحالة الأولية
// class ImageLoading extends ImageState {} // أثناء التحميل
// class ImagePicked extends ImageState {
//   final File imageFile;
//   ImagePicked(this.imageFile);
// }
// class ImageUploadSuccess extends ImageState {}
// class ImageUploadFailure extends ImageState {
//   final String error;
//   ImageUploadFailure(this.error);
// }
//
// @injectable
// class ImageCubit extends Cubit<ImageState> {
//   ImageCubit(this.imagesUseCase) : super(ImageInitial());
// final ImagesUseCase imagesUseCase;
//   File? imageFile;
//   Uint8List? imageBytes;
//
//   // **اختيار الصورة وإدخالها في Cubit**
//   Future<void> pickImage() async {
//     emit(ImageLoading());
//     try {
//       if (kIsWeb) {
//         final Uint8List? pickedImage = await ImagePickerWeb.getImageAsBytes();
//         if (pickedImage != null) {
//           imageBytes = pickedImage;
//           imageFile = await _uint8ListToFile(pickedImage, 'web_image.jpg');
//           emit(ImagePicked(imageFile!));
//         } else {
//           emit(ImageInitial());
//         }
//       } else {
//         final XFile? xFile = await ImagePicker().pickImage(source: ImageSource.gallery);
//         if (xFile != null) {
//           imageFile = File(xFile.path);
//           emit(ImagePicked(imageFile!));
//         } else {
//           emit(ImageInitial());
//         }
//       }
//     } catch (e) {
//       emit(ImageUploadFailure("خطأ في اختيار الصورة: $e"));
//     }
//   }
//
//   // **تحميل الصورة**
//   Future<void> uploadImage(String name) async {
//     if (imageFile == null) {
//       emit(ImageUploadFailure("لم يتم اختيار صورة!"));
//       return;
//     }
//     emit(ImageLoading());
//     try {
//       // هنا يتم رفع الصورة عبر API
//       await imagesUseCase.uploadImage(imageFile!, name, '1',);
//       emit(ImageUploadSuccess());
//     } catch (e) {
//       emit(ImageUploadFailure("خطأ أثناء رفع الصورة: $e"));
//     }
//   }
//
//   // **تحويل Uint8List إلى File**
//   Future<File> _uint8ListToFile(Uint8List uint8list, String filename) async {
//     if (kIsWeb) {
//       throw UnsupportedError("Saving files is not supported in web.");
//     } else {
//       final tempDir = await getTemporaryDirectory();
//       final file = File('${tempDir.path}/$filename');
//       await file.writeAsBytes(uint8list);
//       return file;
//     }
//   }
// }
