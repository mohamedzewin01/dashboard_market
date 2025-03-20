// import 'package:dashboard_market/core/resources/cashed_image.dart';
// import 'package:dashboard_market/core/resources/style_manager.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../../core/di/di.dart';
// import '../../../../core/resources/color_manager.dart';
// import '../../../../core/resources/theme_manager.dart';
// import '../../../../core/resources/values_manager.dart';
// import '../../../categories/data/models/fetch_categories.dart';
// import '../../../categories/presentation/manager/categories_cubit.dart';
// import '../manager/images_cubit.dart';
//
//
// class ChooseImageCategories extends StatefulWidget {
//   const ChooseImageCategories({
//     super.key, required this.addImagesCubit,
//
//   });
//
//   final ImagesCubit addImagesCubit;
//
//   @override
//   State<ChooseImageCategories> createState() => _ChooseImageCategoriesState();
// }
//
// class _ChooseImageCategoriesState extends State<ChooseImageCategories> {
//   late CategoriesCubit viewModel;
//
//   @override
//   void initState() {
//     viewModel = getIt.get<CategoriesCubit>();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => viewModel..getCategoriesData(),
//       child: BlocBuilder<CategoriesCubit, CategoriesState>(
//         builder: (context, state) {
//           if (state is CategoriesSuccess) {
//             List<Categories> categories =
//                 state.categoriesEntity.categories ?? [];
//             if (categories.isEmpty) {
//               return const Text('لا توجد بيانات متاحة');
//             }
//             return DropdownButtonFormField<int>(
//               decoration: InputDecoration(
//                 contentPadding: const EdgeInsets.all(AppSize.s8),
//                 labelText: 'القسم',
//                 labelStyle: getSemiBoldStyle(color: ColorManager.orange),
//                 border: OutlineInputBorder(
//                   borderSide: BorderSide(color: ColorManager.placeHolderColor),
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: ColorManager.placeHolderColor),
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//               ),
//               items: categories
//                   .asMap()
//                   .entries
//                   .map(
//
//                     (entry) => DropdownMenuItem(
//                   value: entry.key,
//                   child: Container(
//                     padding: EdgeInsets.all(5),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(12),
//                       border: Border.all(color: ColorManager.placeHolderColor),
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//
//                         Expanded(child: Text(entry.value.categoryName ?? 'غير معروف')),
//                         SizedBox(
//                             height: 35,
//                             width: 35,
//                             child: CustomImage(
//                                 url: entry.value.categoryImage ?? '')),
//
//                       ],
//                     ),
//                   ),
//                 ),
//               )
//                   .toList(),
//               onChanged: (value) {
//                 widget.addImagesCubit
//                     .changeCategory(categories[value!].categoryId!);
//               },
//               validator: (value) {
//                 if (value == null) {
//                   return 'الرجاء اختيار القسم';
//                 }
//                 return null;
//               },
//             );
//           }
//           return DropdownButtonFormField<int>(
//             decoration: InputDecoration(
//               labelText: 'القسم',
//               labelStyle: const TextStyle(fontSize: 16),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(12),
//                 borderSide: BorderSide(color: ColorManager.placeHolderColor),
//               ),
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(12),
//                 borderSide: BorderSide(color: ColorManager.placeHolderColor),
//               ),
//             ),
//             items: const [
//               DropdownMenuItem(value: 0, child: Text('غير معروف')),
//
//             ],
//             onChanged: (value) {
//               // هنا يمكنك إضافة معالج التغيير
//             },
//             validator: (value) {
//               if (value == null) {
//                 return 'الرجاء اختيار القسم';
//               }
//               return null;
//             },
//           );
//         },
//       ),
//     );
//   }
// }
