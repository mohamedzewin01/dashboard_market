import 'package:dashboard_market/core/di/di.dart';
import 'package:dashboard_market/core/resources/style_manager.dart';
import 'package:dashboard_market/features/home/presentation/cubit/home_cubit.dart';
import 'package:dashboard_market/features/home/presentation/widgets/dashboard_statistics_body.dart';
import 'package:flutter/material.dart';
import 'package:dashboard_market/core/resources/color_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late HomeCubit viewModel;

  @override
  void initState() {
    viewModel = getIt.get<HomeCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: viewModel..getHomeData(),
      child: Scaffold(
          backgroundColor: ColorManager.primaryColor,
          appBar: AppBar(
            backgroundColor: ColorManager.primaryColor,
            centerTitle: true,
            title: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                "سوبر ماركت فضاء الخليج",
                style:
                    getSemiBoldStyle(color: ColorManager.white, fontSize: 18),
              ),
            ),
          ),
          body: const DashboardStatisticsBody()),
    );
  }
}






final List<IconData?> icons = [
  Icons.shopping_bag,
  Icons.category,
  Icons.local_offer,
  Icons.image,
  Icons.people,
  Icons.visibility,
  Icons.shopping_bag,
  Icons.category,
  Icons.local_offer,
  Icons.image,
  Icons.people,
  Icons.visibility,
  Icons.shopping_bag,
  Icons.category,
  Icons.local_offer,
  Icons.image,
  Icons.people,
  Icons.visibility,
  Icons.shopping_bag,
  Icons.category,
  Icons.local_offer,
  Icons.image,
  Icons.people,
  Icons.visibility,
  Icons.shopping_bag,
  Icons.category,
  Icons.local_offer,
  Icons.image,
  Icons.people,
  Icons.visibility,
  Icons.shopping_bag,
  Icons.category,
  Icons.local_offer,
  Icons.image,
  Icons.people,
  Icons.visibility,
];

final List<Color?> colorIcon = [
  const Color(0xFF1E88E5), // أزرق
  const Color(0xFF43A047), // أخضر غامق
  const Color(0xFFF4511E), // برتقالي غامق
  const Color(0xFF8E24AA), // بنفسجي
  const Color(0xFF3949AB), // أزرق بنفسجي
  const Color(0xFF00ACC1),
  const Color(0xFF1E88E5), // أزرق
  const Color(0xFF43A047), // أخضر غامق
  const Color(0xFFF4511E), // برتقالي غامق
  const Color(0xFF8E24AA), // بنفسجي
  const Color(0xFF3949AB), // أزرق بنفسجي
  const Color(0xFF00ACC1), //
  const Color(0xFF1E88E5), // أزرق
  const Color(0xFF43A047), // أخضر غامق
  const Color(0xFFF4511E), // برتقالي غامق
  const Color(0xFF8E24AA), // بنفسجي
  const Color(0xFF3949AB), // أزرق بنفسجي
  const Color(0xFF00ACC1), //
  const Color(0xFF1E88E5), // أزرق
  const Color(0xFF43A047), // أخضر غامق
  const Color(0xFFF4511E), // برتقالي غامق
  const Color(0xFF8E24AA), // بنفسجي
  const Color(0xFF3949AB), // أزرق بنفسجي
  const Color(0xFF00ACC1), //
  const Color(0xFF1E88E5), // أزرق
  const Color(0xFF43A047), // أخضر غامق
  const Color(0xFFF4511E), // برتقالي غامق
  const Color(0xFF8E24AA), // بنفسجي
  const Color(0xFF3949AB), // أزرق بنفسجي
  const Color(0xFF00ACC1), //
  const Color(0xFF1E88E5), // أزرق
  const Color(0xFF43A047), // أخضر غامق
  const Color(0xFFF4511E), // برتقالي غامق
  const Color(0xFF8E24AA), // بنفسجي
  const Color(0xFF3949AB), // أزرق بنفسجي
  const Color(0xFF00ACC1), //
  const Color(0xFF1E88E5), // أزرق
  const Color(0xFF43A047), // أخضر غامق
  const Color(0xFFF4511E), // برتقالي غامق
  const Color(0xFF8E24AA), // بنفسجي
  const Color(0xFF3949AB), // أزرق بنفسجي
  const Color(0xFF00ACC1), //// أزرق فيروزي
];

class StatisticItemData {
  final String title;
  final String? value;
  final String subtitle;
  final String percentageChange;
  final Color percentageColor;
  final IconData icon;
  final Color iconBackgroundColor;
  final Color iconColor;

  StatisticItemData({
    required this.title,
    this.value,
    required this.subtitle,
    required this.percentageChange,
    required this.percentageColor,
    required this.icon,
    required this.iconBackgroundColor,
    required this.iconColor,
  });
}
