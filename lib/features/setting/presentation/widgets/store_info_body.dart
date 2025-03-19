
import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_text_form_field.dart';

class StoreInfoBody extends StatelessWidget {
  const StoreInfoBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        CustomTextFormField(controller: TextEditingController()),
        CustomTextFormField(controller: TextEditingController()),
        CustomTextFormField(controller: TextEditingController()),
      ],
    );
  }
}