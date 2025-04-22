import 'package:dashboard_market/core/di/di.dart';
import 'package:dashboard_market/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:dashboard_market/core/resources/color_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/resources/style_manager.dart';
import '../../data/models/dashboard_statistics_dto.dart';

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
          body: DashboardStatisticsPage()),
    );
  }
}


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

final List<DashboardStatistics> statisticsData = [
  DashboardStatistics(
    title: "Sales",
    subtitle: "Sales this month",
    value: 150,
  ),
  DashboardStatistics(
    title: "Sales",
    subtitle: "Sales this month",
    value: 150,
  ),
  DashboardStatistics(
    title: "Sales",
    subtitle: "Sales this month",
    value: 150,
  ),
  DashboardStatistics(
    title: "Sales",
    subtitle: "Sales this month",
    value: 150,
  ),
  DashboardStatistics(
    title: "Sales",
    subtitle: "Sales this month",
    value: 150,
  ),
  DashboardStatistics(
    title: "Sales",
    subtitle: "Sales this month",
    value: 150,
  ),
  DashboardStatistics(
    title: "Sales",
    subtitle: "Sales this month",
    value: 150,
  ),
  DashboardStatistics(
    title: "Sales",
    subtitle: "Sales this month",
    value: 150,
  ),
  DashboardStatistics(
    title: "Sales",
    subtitle: "Sales this month",
    value: 150,
  ),
  DashboardStatistics(
    title: "Sales",
    subtitle: "Sales this month",
    value: 150,
  ),
  DashboardStatistics(
    title: "Sales",
    subtitle: "Sales this month",
    value: 150,
  ),
  DashboardStatistics(
    title: "Sales",
    subtitle: "Sales this month",
    value: 150,
  ),
  DashboardStatistics(
    title: "Sales",
    subtitle: "Sales this month",
    value: 150,
  ),
  DashboardStatistics(
    title: "Sales",
    subtitle: "Sales this month",
    value: 150,

  ),

];
List<Color> colors = [
  Color(0xFFF44336),
  Color(0xFF00BCD4),
  Color(0xFF616161),
  Color(0xFF2196F3),

];

class DashboardStatisticsPage extends StatelessWidget {
  const DashboardStatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50], // خلفية فاتحة
      body: SafeArea(
        // لتجنب مناطق النظام (مثل شريط الحالة)
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(
                'إحصائيات لوحة المعلومات',
                style: getBoldStyle(color: ColorManager.primaryColor, fontSize: 20),
              ),
              const SizedBox(height: 20),
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state is HomeSuccess) {
                    List<DashboardStatistics>? dashboardStatistics = state
                        .homeEntity.dashboardStatistics ?? [];
                    return Expanded(
                      child: GridView.builder(
                        itemCount: dashboardStatistics.length,
                        gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 250.0, // أقصى عرض للعنصر الواحد
                          crossAxisSpacing: 16.0, // المسافة الأفقية بين العناصر
                          mainAxisSpacing: 16.0, // المسافة العمودية بين العناصر
                          childAspectRatio: 1.2, // نسبة العرض إلى الارتفاع للعنصر
                        ),
                        itemBuilder: (context, index) {
                          return StatisticCard( data: dashboardStatistics[index],
                              );
                        },
                      ),
                    );
                  }
                  return

                    Expanded(
                    child: GridView.builder(
                      itemCount:statisticsData.length,
                      gridDelegate:
                      const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 250.0, // أقصى عرض للعنصر الواحد
                        crossAxisSpacing: 16.0, // المسافة الأفقية بين العناصر
                        mainAxisSpacing: 16.0, // المسافة العمودية بين العناصر
                        childAspectRatio: 1.2, // نسبة العرض إلى الارتفاع للعنصر
                      ),
                      itemBuilder: (context, index) {
                        return StatisticCard( data: statisticsData[index]);
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }




}
class StatisticCard extends StatelessWidget {
  const StatisticCard({super.key, required this.data});
  final DashboardStatistics data;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            // spreadFactor: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  data.title??'',
                  style:  getBoldStyle(color: ColorManager.primaryColor, fontSize: 16),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Color(0xFFFFEBEE),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.add,
                  color: Colors.orange,
                  size: 20,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            data.value.toString(),
            style:  getBoldStyle(color: ColorManager.indigoLight, fontSize: 30)
          ),
          if (data
              .subtitle!.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                data.subtitle??'',
                style:  getBoldStyle(color: ColorManager.grey, fontSize: 14)
              ),
            ),
          const Spacer(),

        ],
      ),
    );
  }
}
