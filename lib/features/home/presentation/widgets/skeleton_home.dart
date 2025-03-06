// import 'package:flutter/material.dart';
// import 'package:grocery_app/features/home/data/models/response/HomeModelResponseDto.dart';
// import 'package:grocery_app/features/home/presentation/widgets/product_card_deal.dart';
// import 'package:grocery_app/features/home/presentation/widgets/search_text_filed.dart';
// import 'package:skeletonizer/skeletonizer.dart';
//
// import '../../../../core/widgets/see_all_view.dart';
// import 'carousel.dart';
// import 'grid_categories.dart';
//
// class SkeletonHome extends StatelessWidget {
//   const SkeletonHome({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Skeletonizer(
//       child: SingleChildScrollView(
//         child: Column(
//           children: [
//             SearchTextFiled(),
//             Padding(
//                 padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
//                 child: Carousel()),
//             SeeAllView(
//                 context: context, name: "Categories 🛍️", onTapAction: () {}),
//             GridCategories(
//               categories: List.generate(
//                 8,
//                 (index) =>
//                     Categories(imageCategory: '', nameCategoryAr: 'ssss'),
//               ),
//             ),
//             SeeAllView(
//                 context: context, name: "Categories 🛍️", onTapAction: () {}),
//             SizedBox(
//               height: 400,
//               child: ListView(
//                 scrollDirection: Axis.horizontal,
//                 children: [
//                   ProductCardWidget(
//                       product: Products(
//                           priceOld: 22,
//                           priceNew: 22,
//                           imageProduct: '',
//                           qunantity: 555,
//                           nameProduct: 'asssss',
//                           discount: 25)),
//                   ProductCardWidget(
//                       product: Products(
//                           priceOld: 22,
//                           priceNew: 22,
//                           imageProduct: '',
//                           qunantity: 555,
//                           nameProduct: 'asssss',
//                           discount: 25)),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
