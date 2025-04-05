
import 'dart:math';
import 'package:dashboard_market/core/di/di.dart';
import 'package:dashboard_market/features/banners/presentation/cubit/add_banners_cubit/add_banners_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'add_banner_body.dart';

class AddBannerView extends StatefulWidget {
  const AddBannerView({
    super.key,
  });

  @override
  State<AddBannerView> createState() => _AddBannerViewState();
}

class _AddBannerViewState extends State<AddBannerView> {
  late AddBannersCubit viewModel;

  @override
  void initState() {
    viewModel = getIt.get<AddBannersCubit>();
    super.initState();
  }

  // مولد عشوائي
  final Random random = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider.value(
        value: viewModel,
        child: AddBannerBody(viewModel: viewModel),
      ),
    );
  }
}
