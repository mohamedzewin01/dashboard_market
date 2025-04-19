import 'package:dashboard_market/core/di/di.dart';
import 'package:dashboard_market/core/resources/color_manager.dart';
import 'package:dashboard_market/features/add_images/presentation/pages/images_view.dart';
import 'package:dashboard_market/features/add_product/presentation/manager/add_product_cubit.dart';
import 'package:dashboard_market/features/add_product/presentation/widgets/image_screen_view.dart';
import 'package:dashboard_market/features/categories/presentation/widgets/Add_categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/resources/style_manager.dart';
import '../widgets/add_product_body.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddProductView extends StatefulWidget {
  const AddProductView({super.key});

  @override
  State<AddProductView> createState() => _AddProductViewState();
}

class _AddProductViewState extends State<AddProductView> {
  late AddProductCubit viewModel;

  @override
  void initState() {
    viewModel = getIt.get<AddProductCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.orange.withAlpha(10),
      appBar: AppBar(
        backgroundColor: ColorManager.orange,
        title: Text(
          "اضافة منتجات",
          style: getSemiBoldStyle(color: ColorManager.white, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => viewModel,
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 950) {
              return AddProductBody(
                viewModel: viewModel,
              );
            } else {
              return Row(
                children: [
                  Expanded(
                      flex: 9,
                      child: AddProductBody(
                        viewModel: viewModel,
                      )),
                  // Expanded(
                  //   child:AddCategories()
                  // ),
                  Expanded(flex: 10, child: ImageScreenView()),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}

// Add intl package for date formatting: flutter pub add intl
//
// class AddProductScreen extends StatefulWidget {
//   const AddProductScreen({super.key});
//
//   @override
//   State<AddProductScreen> createState() => _AddProductScreenState();
// }
//
// class _AddProductScreenState extends State<AddProductScreen> {
//   final _formKey = GlobalKey<FormState>();
//
//   // Controllers for text fields
//   final _productNameController = TextEditingController();
//   final _unitController = TextEditingController();
//   final _priceController = TextEditingController(text: '0');
//   final _stockController = TextEditingController(text: '0');
//   final _discountController = TextEditingController(text: '0');
//   final _descriptionController = TextEditingController();
//   final _barcodeController = TextEditingController();
//   final _supplierController = TextEditingController();
//   final _expiryDateController = TextEditingController();
//
//   // State variables
//   String? _selectedCategory;
//   DateTime? _selectedExpiryDate;
//   bool _isFeaturedProduct = false;
//
//   // Dummy category list - replace with your actual categories
//   final List<String> _categories = ['Electronics', 'Clothing', 'Groceries', 'Books', 'Home Goods'];
//
//   @override
//   void dispose() {
//     // Dispose controllers when the widget is removed from the tree
//     _productNameController.dispose();
//     _unitController.dispose();
//     _priceController.dispose();
//     _stockController.dispose();
//     _discountController.dispose();
//     _descriptionController.dispose();
//     _barcodeController.dispose();
//     _supplierController.dispose();
//     _expiryDateController.dispose();
//     super.dispose();
//   }
//
//   // Function to show Date Picker
//   Future<void> _selectExpiryDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: _selectedExpiryDate ?? DateTime.now(),
//       firstDate: DateTime.now(), // Optional: restrict past dates
//       lastDate: DateTime(2101),
//     );
//     if (picked != null && picked != _selectedExpiryDate) {
//       setState(() {
//         _selectedExpiryDate = picked;
//         // Format the date as mm/dd/yyyy for display
//         _expiryDateController.text = DateFormat('MM/dd/yyyy').format(picked);
//       });
//     }
//   }
//
//   // Function to handle form submission
//   void _submitForm() {
//     if (_formKey.currentState!.validate()) {
//       // If the form is valid, display a snackbar. In a real app, you'd save the data.
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Processing Data...')),
//       );
//       // Add your logic here to save the product data
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Please fix errors in the form')),
//       );
//     }
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Add New Product'),
//         // Optional: Add leading back button if this screen is pushed onto a navigator stack
//         // leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context)),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // --- Basic Information Section ---
//               _buildSectionTitle('Basic Information'),
//               const SizedBox(height: 16),
//               _buildTextFormField(
//                 controller: _productNameController,
//                 labelText: 'Product Name *',
//                 hintText: 'Enter product name',
//                 validator: (value) => (value == null || value.isEmpty) ? 'Product name is required' : null,
//               ),
//               const SizedBox(height: 16),
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start, // Align tops if validators make them different height
//                 children: [
//                   Expanded(
//                     child: _buildDropdownFormField(
//                       value: _selectedCategory,
//                       items: _categories,
//                       labelText: 'Category *',
//                       hintText: 'Select category',
//                       onChanged: (value) => setState(() => _selectedCategory = value),
//                       validator: (value) => (value == null) ? 'Category is required' : null,
//                     ),
//                   ),
//                   const SizedBox(width: 16),
//                   Expanded(
//                     child: _buildTextFormField(
//                       controller: _unitController,
//                       labelText: 'Unit *',
//                       hintText: 'e.g., piece, kg, bottle',
//                       validator: (value) => (value == null || value.isEmpty) ? 'Unit is required' : null,
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 16),
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Expanded(
//                     child: _buildTextFormField(
//                       controller: _priceController,
//                       labelText: 'Price (\$) *',
//                       hintText: '0',
//                       keyboardType: const TextInputType.numberWithOptions(decimal: true),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) return 'Price is required';
//                         if (double.tryParse(value) == null) return 'Enter a valid number';
//                         return null;
//                       },
//                     ),
//                   ),
//                   const SizedBox(width: 16),
//                   Expanded(
//                     child: _buildTextFormField(
//                       controller: _stockController,
//                       labelText: 'Stock *',
//                       hintText: '0',
//                       keyboardType: TextInputType.number,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) return 'Stock is required';
//                         if (int.tryParse(value) == null) return 'Enter a valid integer';
//                         return null;
//                       },
//                     ),
//                   ),
//                   const SizedBox(width: 16),
//                   Expanded(
//                     child: _buildTextFormField(
//                       controller: _discountController,
//                       labelText: 'Discount (%)',
//                       hintText: '0',
//                       keyboardType: const TextInputType.numberWithOptions(decimal: true),
//                       validator: (value) {
//                         if (value != null && value.isNotEmpty && double.tryParse(value) == null) {
//                           return 'Enter a valid number';
//                         }
//                         return null; // Discount is optional
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 16),
//               _buildTextFormField(
//                 controller: _descriptionController,
//                 labelText: 'Description',
//                 hintText: 'Enter product description',
//                 maxLines: 4, // Allow multiple lines
//                 keyboardType: TextInputType.multiline,
//                 // Description is typically optional, so no validator unless required
//               ),
//               const SizedBox(height: 24),
//
//               // --- Product Image Section ---
//               _buildSectionTitle('Product Image'),
//               const SizedBox(height: 16),
//               _buildImageUploadArea(),
//               const SizedBox(height: 8),
//               Center( // Center the upload button
//                 child: ElevatedButton.icon(
//                     icon: const Icon(Icons.cloud_upload_outlined),
//                     label: const Text('Upload Image'),
//                     onPressed: () {
//                       // --- TODO: Implement image picking logic ---
//                       print('Upload Image Tapped');
//                       // Example: use image_picker package
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         const SnackBar(content: Text('Image upload logic not implemented yet.')),
//                       );
//                     },
//                     style: ElevatedButton.styleFrom(
//                       minimumSize: const Size(double.infinity, 45), // Make button wider
//                       backgroundColor: Colors.black87, // Dark button like the image
//                       foregroundColor: Colors.white, // White text/icon
//                     )
//                 ),
//               ),
//               const SizedBox(height: 24),
//
//               // --- Additional Information Section ---
//               _buildSectionTitle('Additional Information'),
//               const SizedBox(height: 16),
//               _buildTextFormField(
//                 controller: _barcodeController,
//                 labelText: 'Barcode',
//                 hintText: 'Enter barcode',
//                 // Optional field
//               ),
//               const SizedBox(height: 16),
//               _buildTextFormField(
//                 controller: _supplierController,
//                 labelText: 'Supplier',
//                 hintText: 'Enter supplier name',
//                 // Optional field
//               ),
//               const SizedBox(height: 16),
//               _buildDatePickerFormField(
//                 context: context,
//                 controller: _expiryDateController,
//                 labelText: 'Expiry Date',
//                 hintText: 'mm/dd/yyyy',
//                 onTap: () => _selectExpiryDate(context),
//                 // Optional field
//               ),
//               const SizedBox(height: 10),
//               _buildCheckboxListTile(
//                 title: 'Featured Product',
//                 value: _isFeaturedProduct,
//                 onChanged: (value) => setState(() => _isFeaturedProduct = value ?? false),
//               ),
//               const SizedBox(height: 32),
//
//               // --- Action Buttons ---
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end, // Align buttons to the right
//                 children: [
//                   TextButton(
//                       onPressed: () {
//                         // Handle Cancel action
//                         print('Cancel Tapped');
//                         Navigator.maybePop(context); // Go back if possible
//                       },
//                       child: const Text('Cancel'),
//                       style: TextButton.styleFrom(foregroundColor: Colors.grey[700])
//                   ),
//                   const SizedBox(width: 12),
//                   ElevatedButton.icon(
//                       icon: const Icon(Icons.add_circle_outline),
//                       label: const Text('Add Product'),
//                       onPressed: _submitForm, // Call the submit function
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.black87, // Dark button like the image
//                         foregroundColor: Colors.white, // White text/icon
//                         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//                       )
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 20), // Add some bottom padding
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   // Helper Widget for Section Titles
//   Widget _buildSectionTitle(String title) {
//     return Text(
//       title,
//       style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
//     );
//   }
//
//   // Helper Widget for TextFormFields for consistency
//   Widget _buildTextFormField({
//     required TextEditingController controller,
//     required String labelText,
//     String? hintText,
//     TextInputType keyboardType = TextInputType.text,
//     int? maxLines = 1,
//     String? Function(String?)? validator,
//   }) {
//     return TextFormField(
//       controller: controller,
//       keyboardType: keyboardType,
//       maxLines: maxLines,
//       decoration: InputDecoration(
//         labelText: labelText,
//         hintText: hintText,
//         border: const OutlineInputBorder(),
//         contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0), // Adjust padding
//         isDense: true, // Make field vertically smaller
//       ),
//       validator: validator,
//       autovalidateMode: AutovalidateMode.onUserInteraction, // Validate as user types
//     );
//   }
//
//   // Helper Widget for DropdownButtonFormField
//   Widget _buildDropdownFormField({
//     required String? value,
//     required List<String> items,
//     required String labelText,
//     required String hintText,
//     required void Function(String?) onChanged,
//     required String? Function(String?)? validator,
//   }){
//     return DropdownButtonFormField<String>(
//       value: value,
//       items: items.map((String category) {
//         return DropdownMenuItem<String>(
//           value: category,
//           child: Text(category),
//         );
//       }).toList(),
//       onChanged: onChanged,
//       decoration: InputDecoration(
//         labelText: labelText,
//         hintText: hintText,
//         border: const OutlineInputBorder(),
//         contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
//         isDense: true,
//       ),
//       validator: validator,
//       autovalidateMode: AutovalidateMode.onUserInteraction,
//     );
//   }
//
//   // Helper Widget for DatePickerFormField
//   Widget _buildDatePickerFormField({
//     required BuildContext context,
//     required TextEditingController controller,
//     required String labelText,
//     required String hintText,
//     required VoidCallback onTap,
//     String? Function(String?)? validator,
//   }) {
//     return TextFormField(
//       controller: controller,
//       readOnly: true, // Prevent manual text input
//       decoration: InputDecoration(
//         labelText: labelText,
//         hintText: hintText,
//         border: const OutlineInputBorder(),
//         suffixIcon: Icon(Icons.calendar_today, color: Theme.of(context).primaryColor),
//         contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
//         isDense: true,
//       ),
//       onTap: onTap, // Show date picker on tap
//       validator: validator,
//       autovalidateMode: AutovalidateMode.onUserInteraction,
//     );
//   }
//
//   // Helper Widget for CheckboxListTile
//   Widget _buildCheckboxListTile({
//     required String title,
//     required bool value,
//     required ValueChanged<bool?> onChanged,
//   }) {
//     return CheckboxListTile(
//       title: Text(title),
//       value: value,
//       onChanged: onChanged,
//       controlAffinity: ListTileControlAffinity.leading, // Checkbox on the left
//       contentPadding: EdgeInsets.zero, // Remove default padding
//       dense: true,
//     );
//   }
//
//   // Helper Widget for Image Upload Area Placeholder
//   Widget _buildImageUploadArea() {
//     return Container(
//       height: 150,
//       width: double.infinity, // Take full width
//       decoration: BoxDecoration(
//         color: Colors.grey[200],
//         borderRadius: BorderRadius.circular(8.0),
//         border: Border.all(color: Colors.grey[400]!),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(Icons.image_outlined, size: 50, color: Colors.grey[600]),
//           const SizedBox(height: 8),
//           Text(
//             'Upload product image',
//             style: TextStyle(color: Colors.grey[700]),
//           ),
//           const SizedBox(height: 4),
//           Text(
//             'PNG, JPG up to 5MB',
//             style: TextStyle(color: Colors.grey[600], fontSize: 12),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// // --- To Run this code ---
// // 1. Make sure you have Flutter installed.
// // 2. Create a new Flutter project or use an existing one.
// // 3. Add the intl package: run `flutter pub add intl` in your terminal in the project directory.
// // 4. Replace the contents of your `lib/main.dart` (or another file) with this code.
// // 5. Make sure your `main()` function runs this widget, for example:
//
// /*
// import 'package:flutter/material.dart';
// // Assuming your file is named add_product_screen.dart
// import 'add_product_screen.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Product Form Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue, // Or your preferred theme color
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//          inputDecorationTheme: const InputDecorationTheme( // Optional: Consistent input decoration
//           // border: OutlineInputBorder(), // Example: apply border to all fields by default
//          ),
//       ),
//       home: const AddProductScreen(), // Start with the AddProductScreen
//     );
//   }
// }
// */
