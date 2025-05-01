import 'package:dashboard_market/core/resources/color_manager.dart';
import 'package:dashboard_market/core/resources/style_manager.dart';
import 'package:dashboard_market/features/home/data/models/dashboard_statistics_dto.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

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