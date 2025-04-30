import 'package:dashboard_market/core/di/di.dart';
import 'package:dashboard_market/core/resources/cashed_image.dart';
import 'package:dashboard_market/core/resources/color_manager.dart';
import 'package:dashboard_market/core/resources/style_manager.dart';
import 'package:dashboard_market/features/add_product/data/models/images_dto.dart';
import 'package:dashboard_market/features/add_product/presentation/manager/ProductPhoto/product_photo_cubit.dart';
import 'package:dashboard_market/features/add_product/presentation/manager/add_product_cubit.dart';
import 'package:dashboard_market/features/add_product/presentation/widgets/skele__image_product_grid_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImageScreenView extends StatefulWidget {
  const ImageScreenView({super.key});

  @override
  State<ImageScreenView> createState() => _ImageScreenViewState();
}

class _ImageScreenViewState extends State<ImageScreenView> {
  late ProductPhotoCubit viewModel;

  @override
  void initState() {
    viewModel = getIt.get<ProductPhotoCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: viewModel..fetchImages(),
      child: const ImageProductGridScreen(),
    );
  }
}

class ImageProductGridScreen extends StatefulWidget {
  const ImageProductGridScreen({super.key});

  @override
  State<ImageProductGridScreen> createState() => _ImageProductGridScreenState();
}

class _ImageProductGridScreenState extends State<ImageProductGridScreen> {
  TextEditingController searchController = TextEditingController();
  List<AllImages>? allImages = [];
  List<AllImages>? filteredImages = [];

  void filterImages(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredImages = allImages;
      } else {
        filteredImages = allImages
            ?.where((image) =>
                image.imageName?.toLowerCase().contains(query.toLowerCase()) ??
                false)
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: BlocBuilder<ProductPhotoCubit, ProductPhotoState>(
          builder: (context, state) {
            if (state is ProductPhotoSuccess) {
              allImages = state.allImagesEntity.images?.reversed.toList();
              filteredImages = filteredImages?.isNotEmpty == true
                  ? filteredImages
                  : allImages;
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 8.0),
                    child:TextField(
                      controller: searchController,
                      textDirection: TextDirection.rtl, // اتجاه النص من اليمين إلى اليسار
                      textAlign: TextAlign.right, // محاذاة النص إلى اليمين
                      decoration: InputDecoration(
                        hintText: 'ابحث عن صورة...',
                        prefixIcon: const Icon(Icons.search, color: ColorManager.grey),
                        suffixIcon: searchController.text.isNotEmpty
                            ? IconButton(
                          icon: const Icon(Icons.clear, color: ColorManager.grey),
                          onPressed: () {
                            searchController.clear(); // مسح النص
                            filterImages(''); // تحديث القائمة
                          },
                        )
                            : null, // إذا لم يكن هناك نص، لا تعرض الأيقونة
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onChanged: (value) {
                        filterImages(value); // استدعاء الدالة لتحديث القائمة
                      },
                    ),

                  ),
                  Expanded(
                    child: GridView.builder(
                      itemCount: filteredImages?.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 6,
                        crossAxisSpacing: 5.0,
                        mainAxisSpacing: 5.0,
                        childAspectRatio: 2.0 / 3.5,
                      ),
                      itemBuilder: (ctx, index) {
                        return InkWell(
                          mouseCursor: SystemMouseCursors.click,
                          splashColor: ColorManager.orange.withAlpha(100),
                          focusColor: ColorManager.orange.withAlpha(100),
                          onTap: () {
                            AddProductCubit.get(context).imagePath =
                                filteredImages?[index].imagePath ?? '';
                            AddProductCubit.get(context).changeImagePath(
                                filteredImages?[index].imagePath ?? '');
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(3),
                                    child: CustomImage(
                                      url:
                                          "${filteredImages?[index].imagePath}",
                                      height: 110,
                                    ),
                                  ),
                                  Text(
                                    filteredImages?[index].imageName ?? '',
                                    style: getSemiBoldStyle(
                                        color: Colors.black),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            }
            return const SkeImagesView();
          },
        ),
      ),
    );
  }
}

// class ProductGridItem extends StatelessWidget {
//   final Product product;
//
//   const ProductGridItem({
//     super.key,
//     required this.product,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 4.0, // درجة الظل للبطاقة
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10.0), // جعل حواف البطاقة دائرية
//       ),
//       clipBehavior: Clip.antiAlias, // لقص المحتوى الزائد عن الحواف الدائرية
//       child: InkWell( // لجعل البطاقة قابلة للنقر (إذا أردت إضافة تفاعل)
//         onTap: () {
//           // يمكنك هنا إضافة الإجراء عند النقر على المنتج
//           print('Tapped on ${product.name}');
//           // مثال: الانتقال لصفحة تفاصيل المنتج
//           // Navigator.of(context).push(MaterialPageRoute(builder: (_) => ProductDetailScreen(productId: product.id)));
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text('تم النقر على: ${product.name}')),
//           );
//         },
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch, // لجعل العناصر تمتد بعرض البطاقة
//           children: <Widget>[
//             // --- عرض الصورة ---
//             Expanded( // لجعل الصورة تأخذ المساحة المتاحة في العمود
//               child: Hero( // لإضافة تأثير انتقال جميل عند الانتقال لصفحة التفاصيل (اختياري)
//                 tag: product.id, // يجب أن يكون معرف فريد للمنتج
//                 child: FadeInImage( // لإظهار صورة مؤقتة أثناء تحميل الصورة الأصلية
//                   placeholder: const AssetImage('assets/images/placeholder.png'), // تأكد من إضافة صورة مؤقتة في مجلد assets
//                   image: NetworkImage(product.imageUrl),
//                   fit: BoxFit.cover, // لجعل الصورة تغطي المساحة المخصصة لها
//                   imageErrorBuilder: (context, error, stackTrace) {
//                     // عرض أيقونة أو نص في حالة فشل تحميل الصورة
//                     return const Center(
//                         child: Icon(Icons.broken_image, size: 40, color: Colors.grey)
//                     );
//                   },
//                 ),
//               ),
//               // يمكنك استخدام Image.network مباشرة إذا لم ترد استخدام FadeInImage
//               // child: Image.network(
//               //   product.imageUrl,
//               //   fit: BoxFit.cover,
//               //   errorBuilder: (context, error, stackTrace) {
//               //        return const Center(child: Icon(Icons.error)); // Handle image load error
//               //   },
//               // ),
//             ),
//             // --- عرض اسم المنتج ---
//             Padding(
//               padding: const EdgeInsets.all(8.0), // إضافة هوامش حول النص
//               child: Text(
//                 product.name,
//                 textAlign: TextAlign.center, // محاذاة النص في المنتصف
//                 style: const TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 maxLines: 2, // الحد الأقصى لعدد الأسطر
//                 overflow: TextOverflow.ellipsis, // إظهار "..." إذا كان النص طويلاً
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// --- لتشغيل هذا الكود ---
// 1. تأكد من وجود Flutter لديك.
// 2. انسخ هذا الكود في ملف .dart (مثلاً: lib/product_grid_screen.dart).
// 3. قم بإنشاء مجلد باسم `assets` في جذر مشروعك، ثم مجلد `images` بداخله.
// 4. ضع صورة مؤقتة (placeholder) باسم `placeholder.png` داخل `assets/images/`.
// 5. عدّل ملف `pubspec.yaml` لإضافة مجلد assets:
//    flutter:
//      uses-material-design: true
//      assets:
//        - assets/images/ # تأكد من وجود مسافة بادئة صحيحة
// 6. قم بتشغيل `flutter pub get` في الطرفية (Terminal).
// 7. تأكد من أن دالة `main()` في `lib/main.dart` تعرض هذه الشاشة:

/*
import 'package:flutter/material.dart';
// استورد الملف الذي أنشأته
import 'product_grid_screen.dart'; // تأكد من أن المسار صحيح

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Grid Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal, // أو أي لون أساسي تفضله
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const ImageProductGridScreen(), // اعرض شاشة المنتجات هنا
      debugShowCheckedModeBanner: false, // لإخفاء شارة الـ Debug
    );
  }
}
*/
