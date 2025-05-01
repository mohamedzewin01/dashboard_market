import 'package:dashboard_market/core/resources/cashed_image.dart';
import 'package:flutter/material.dart';

class DeleteImageDialog extends StatelessWidget {
  final String imageUrl;
  final VoidCallback onConfirm;

  const DeleteImageDialog({
    super.key,
    required this.imageUrl,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      icon: SizedBox(
        height: 150,
        width: 150,
        child: CustomImage(url: imageUrl),
      ),
      title: const Row(
        children: [
          Icon(Icons.warning_rounded, color: Colors.red, size: 28),
          SizedBox(width: 8),
          Text(
            'تأكيد الحذف',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
      content: const Text(
        'في حالة الصورة مرتبطة بالمنتجات سوف يظهر المنتج بدون صورة، لذلك توخي الحذر.',
        style: TextStyle(fontSize: 16, color: Colors.black54),
      ),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text(
            'إلغاء',
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          onPressed: () {
            onConfirm();

          },
          child: const Text(
            'حذف',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ],
    );
  }
}