import 'package:dashboard_market/core/di/di.dart';
import 'package:dashboard_market/features/home/presentation/cubit/home_cubit.dart';
import 'package:fl_chart/fl_chart.dart';
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
          body: const DashboardStatisticsPage()),
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

class DashboardStatisticsPage extends StatelessWidget {
  const DashboardStatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50], // خلفية فاتحة
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'إحصائيات لوحة المعلومات',
                  style: getBoldStyle(
                      color: ColorManager.primaryColor, fontSize: 20),
                ),
                const SizedBox(height: 20),
                BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    if (state is HomeSuccess) {
                      final List<DashboardStatistics> dashboardStatistics =
                          state.homeEntity.dashboardStatistics ?? [];
                      final List<CategoriesProductsCount> secondDashboardStatistics =
                          state.homeEntity.categoriesProductsCount ?? [];
                      return LayoutBuilder(
                        builder: (context, constraints) {
                          final bool isWide = constraints.maxWidth > 800; // مثلاً أكثر من 700 يعتبر شاشة واسعة

                          return isWide
                              ? Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: GridView.builder(
                                  itemCount: dashboardStatistics.length,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 7/ 9,
                                  ),
                                  itemBuilder: (context, index) {
                                    return Flexible(
                                      fit: FlexFit.tight,
                                      child: StatisticCard(
                                        data: dashboardStatistics[index],
                                        index: index,
                                      ),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(width: 16), // بدل height
                              Expanded(
                                flex: 2,
                                child: CustomBarChart(
                                  secondDashboardStatistics: secondDashboardStatistics,
                                ),
                              ),
                            ],
                          )
                              : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GridView.builder(
                                itemCount: dashboardStatistics.length,
                                shrinkWrap: true,

                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:const SliverGridDelegateWithMaxCrossAxisExtent(
                                  mainAxisExtent: 240,
                                  maxCrossAxisExtent: 250.0, // أقصى عرض للعنصر الواحد
                                  crossAxisSpacing: 16.0, // المسافة الأفقية بين العناصر
                                  mainAxisSpacing: 16.0, // المسافة العمودية بين العناصر
                                  childAspectRatio: 1.2, // نسبة العرض إلى الارتفاع للعنصر
                                ),
                                itemBuilder: (context, index) {
                                  return Flexible(
                                    fit: FlexFit.tight,
                                    child: StatisticCard(
                                      data: dashboardStatistics[index],
                                      index: index,
                                    ),
                                  );
                                },
                              ),
                              const SizedBox(height: 20),
                              CustomBarChart(
                                secondDashboardStatistics: secondDashboardStatistics,
                              ),
                            ],
                          );
                        },
                      );

                    }
                    return const Center(
                      child: CircularProgressIndicator(
                          color: ColorManager.primaryColor),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class StatisticCardCategory extends StatelessWidget {
  const StatisticCardCategory(
      {super.key, required this.data, required this.index});

  final CategoriesProductsCount data;
  final int index;

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
                  data.name ?? '',
                  style: getBoldStyle(
                      color: ColorManager.primaryColor, fontSize: 16),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: const BoxDecoration(
                  color: Color(0xFFF1EFEF),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icons[index] ?? Icons.access_time_outlined,
                  color: colorIcon[index] ?? Colors.red,
                  size: 20,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(data.totalProducts.toString(),
              style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                  color: Colors.redAccent)),
          Text(' منتج في قسم ${data.name}',
              style: getBoldStyle(color: ColorManager.grey, fontSize: 14)),
          const Spacer(),
        ],
      ),
    );
  }
}

class StatisticCard extends StatelessWidget {
  const StatisticCard({super.key, required this.data, required this.index});

  final DashboardStatistics data;
  final int index;

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
                  data.title ?? '',
                  style: getBoldStyle(
                      color: ColorManager.primaryColor, fontSize: 16),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: const BoxDecoration(
                  color: Color(0xFFF1EFEF),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icons[index] ?? Icons.access_time_outlined,
                  color: colorIcon[index] ?? Colors.red,
                  size: 20,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(data.value.toString(),
              style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                  color: Colors.redAccent)),
          if (data.subtitle!.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(data.subtitle ?? '',
                  style: getBoldStyle(color: ColorManager.grey, fontSize: 14)),
            ),
          const Spacer(),
        ],
      ),
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

class CustomBarChart extends StatelessWidget {
  const CustomBarChart({super.key, this.secondDashboardStatistics});

  final List<CategoriesProductsCount>? secondDashboardStatistics;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: AspectRatio(
        aspectRatio: 2,
        child: BarChart(
          BarChartData(
            alignment: BarChartAlignment.spaceAround,
            groupsSpace: 20,
            barGroups: secondDashboardStatistics!.asMap().entries.map((entry) {
              final int index = entry.key;
              final e = entry.value;
              return BarChartGroupData(
                x: index,
                barRods: [
                  BarChartRodData(
                    toY: e.totalProducts?.toDouble() ?? 0,
                    color: Colors.blueAccent,
                    width: 18,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(6),
                      topRight: Radius.circular(6),
                    ),
                  ),
                ],
              );
            }).toList(),
            titlesData: FlTitlesData(
              leftTitles: AxisTitles(
                axisNameWidget: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Text(
                    'عدد المنتجات',
                    style: getRegularStyle(color: ColorManager.grey),
                  ),
                ),
                sideTitles: const SideTitles(showTitles: true, reservedSize: 40),
              ),
              rightTitles:
                  const AxisTitles(),
              topTitles: AxisTitles(
                axisNameSize: 30,
                axisNameWidget: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'عدد المنتجات في كل قسم', // العنوان هنا
                    style: getRegularStyle(color: ColorManager.grey),
                  ),
                ),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 80,
                  getTitlesWidget: (value, meta) {
                    final int index = value.toInt();
                    if (index >= 0 &&
                        index < secondDashboardStatistics!.length) {
                      final String categoryName =
                          secondDashboardStatistics![index].name ?? '';
                      return RotatedBox(
                        quarterTurns: 3,
                        child: Text(
                          categoryName,
                          style: getRegularStyle(color: ColorManager.error),
                          textAlign: TextAlign.center,
                        ),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
            ),
            gridData: FlGridData(
              show: false,
              // إظهار الخط الأفقي
              // horizontalInterval: 1, // يمكن تحديد المسافة بين الخطوط
              // verticalInterval: 1, // المسافة بين الخطوط الرأسية
              getDrawingHorizontalLine: (value) {
                return FlLine(
                  color: ColorManager.grey.withOpacity(0.5), // لون الخط الأفقي
                  strokeWidth: 1, // عرض الخط الأفقي
                );
              },
              getDrawingVerticalLine: (value) {
                return FlLine(
                  color: ColorManager.grey.withOpacity(0.5), // لون الخط العمودي
                  strokeWidth: 1, // عرض الخط العمودي
                );
              },
            ),
            borderData: FlBorderData(
              show: true, // إظهار الحدود
              border: Border.all(
                color: ColorManager.grey.withOpacity(0.5), // لون الحدود
              ),
            ),
          ),
        ),
      ),
    );
  }
}
