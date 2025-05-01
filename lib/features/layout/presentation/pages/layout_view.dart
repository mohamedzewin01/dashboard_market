import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/adaptive layout.dart';
import '../cubit/layout_cubit.dart';
import '../widgets/desktop/desktop.dart';
import '../widgets/mobile.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => LayoutCubit(),
      child: AdaptiveLayout(
        mobileLayout: (context) => const RotateScreenHint(),
        tabletLayout: (context) => const RotateScreenHint(),
        desktopLayout: (context) => const Center(child: DesktopLayout()),
      ),
    );
  }
}

class RotateScreenHint extends StatelessWidget {
  const RotateScreenHint({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 6,
        margin: const EdgeInsets.all(24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.screen_rotation, size: 48, color: Colors.orange),
              SizedBox(height: 16),
              Text(
                'يرجى تدوير الجهاز أو تكبير الشاشة لرؤية المحتوى بشكل أفضل.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.black87),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
