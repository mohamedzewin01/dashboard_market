import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../manager/categories_cubit.dart';
import 'edit_category.dart';

class AddCategories extends StatefulWidget {
  const AddCategories({
    super.key,
    required this.viewModel,
  });

  final CategoriesCubit viewModel;

  @override
  State<AddCategories> createState() => _AddCategoriesState();
}

class _AddCategoriesState extends State<AddCategories> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.getCategoriesData(); // تحميل البيانات مرة واحدة
  }

  Future<void> _pickImage() async {
    final XFile? xFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (xFile != null) {
      setState(() {
        widget.viewModel.imageFile = File(xFile.path);
        widget.viewModel.imagePath = xFile.path;
      });
    }
  }

  void _submitCategory() {
    if (widget.viewModel.formKey.currentState!.validate()) {
      if (widget.viewModel.imageFile != null) {
        widget.viewModel.addCategory();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('تمت إضافة القسم بنجاح')),
        );
        setState(() {
          widget.viewModel.categoryNameController.clear();
          widget.viewModel.imagePath = '';
          widget.viewModel.imageFile = null;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('يرجى اختيار صورة أولاً')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocProvider.value(
          value: widget.viewModel,
          child: Form(
            key: widget.viewModel.formKey,
            child: CustomScrollView(
           slivers: [
             SliverToBoxAdapter(
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   GestureDetector(
                     onTap: _pickImage,
                     child: widget.viewModel.imagePath.isNotEmpty
                         ? AspectRatio(
                       aspectRatio: 20 / 9,
                       child: ClipRRect(
                         borderRadius: BorderRadius.circular(8),
                         child: Image.file(
                           widget.viewModel.imageFile!,
                           fit: BoxFit.cover,
                         ),
                       ),
                     )
                         : Container(
                       height: 150,
                       width: double.infinity,
                       decoration: BoxDecoration(
                         color: Colors.grey[200],
                         borderRadius: BorderRadius.circular(8.0),
                         border: Border.all(color: Colors.grey[400]!),
                       ),
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Icon(Icons.image_outlined, size: 50, color: Colors.grey[600]),
                           const SizedBox(height: 8),
                           Text('Upload product image', style: TextStyle(color: Colors.grey[700])),
                           const SizedBox(height: 4),
                           Text('PNG, JPG up to 5MB', style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                         ],
                       ),
                     ),
                   ),
                   const SizedBox(height: 16),
                   CustomTextFormField(
                     controller: widget.viewModel.categoryNameController,
                     validator: (value) {
                       if (value!.trim().isEmpty) return 'ادخل اسم القسم';
                       if (value.trim().length < 3) return 'الاسم قصير جدا';
                       return null;
                     },
                     labelText: "اسم القسم",
                     hintText: "اسم القسم",
                   ),
                   const SizedBox(height: 16),
                   Row(
                     children: [
                       Expanded(
                         child: CustomElevatedButton(
                           buttonColor: ColorManager.orange,
                           title: 'اضافة',
                           onPressed: _submitCategory,
                         ),
                       ),
                     ],
                   ),
                   const SizedBox(height: 16),

                 ],
               ),
             ),
             SliverToBoxAdapter(
               child:  EditCategory(viewModelCategories: widget.viewModel),
             )
           ],
            ),
          ),
        ),
      ),
    );
  }
}
