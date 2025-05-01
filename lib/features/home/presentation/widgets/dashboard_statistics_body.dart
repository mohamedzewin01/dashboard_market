import 'package:dashboard_market/core/resources/color_manager.dart';
import 'package:dashboard_market/core/resources/style_manager.dart';
import 'package:dashboard_market/features/home/data/models/dashboard_statistics_dto.dart';
import 'package:dashboard_market/features/home/presentation/cubit/home_cubit.dart';
import 'package:dashboard_market/features/home/presentation/widgets/custom_bar_chart.dart';
import 'package:dashboard_market/features/home/presentation/widgets/statistic_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardStatisticsBody extends StatelessWidget {
  const DashboardStatisticsBody({super.key});

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
                          final bool isWide = constraints.maxWidth > 800;
                          return
                            isWide ?
                            Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    GridView.builder(
                                      itemCount: dashboardStatistics.length,
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(),
                                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 7/ 9,
                                      ),
                                      itemBuilder: (context, index) {
                                        return StatisticCard(
                                          data: dashboardStatistics[index],
                                          index: index,
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 16),
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
                                  maxCrossAxisExtent: 250.0,
                                  crossAxisSpacing: 16.0,
                                  mainAxisSpacing: 16.0,
                                  childAspectRatio: 1.2,
                                ),
                                itemBuilder: (context, index) {
                                  return StatisticCard(
                                    data: dashboardStatistics[index],
                                    index: index,
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