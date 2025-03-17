import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/di.dart';
import '../../../../core/resources/cashed_image.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../add_images/data/models/images_model.dart';
import '../../../add_images/presentation/manager/images_cubit.dart';
import '../manager/add_product_cubit.dart';

class ShowAllImagesToAddProduct extends StatefulWidget {
  const ShowAllImagesToAddProduct({
    super.key, required this.addProductCubit,
  });
  final AddProductCubit addProductCubit;
  @override
  State<ShowAllImagesToAddProduct> createState() => _ShowAllImagesToAddProductState();
}

class _ShowAllImagesToAddProductState extends State<ShowAllImagesToAddProduct> {
  late ImagesCubit viewModel;

  @override
  void initState() {
    viewModel = getIt.get<ImagesCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel..fetchImages(),
      child: BlocBuilder<ImagesCubit, ImagesState>(
        builder: (context, state) {
          if(state is SuccessImages){
            List<Images>? images = state.imagesEntity.images ?? [];
            return ListView.builder(
                itemCount: images.length,
                itemBuilder: (context, index) => ListTile(
                  leading:SizedBox(
                      height: 60,
                      width: 60,
                      child: CustomImage(url: images[index].imagePath??'')),
                  title: Text(images[index].imageName??''),
                  onTap: ()async{
               widget. addProductCubit.imagePath = images[index].imagePath??'';
                   log(  widget. addProductCubit.imagePath);
                widget. addProductCubit.changeImagePath(images[index].imagePath??'');

                    Navigator.pop(context);
                  },
                ));

          }
          return Center(child: CircularProgressIndicator(color: ColorManager.orange,));
        },
      ),
    );
  }
}