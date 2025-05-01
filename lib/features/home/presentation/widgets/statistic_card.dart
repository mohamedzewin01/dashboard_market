import 'package:dashboard_market/core/resources/color_manager.dart';
import 'package:dashboard_market/core/resources/style_manager.dart';
import 'package:dashboard_market/features/home/data/models/dashboard_statistics_dto.dart';
import 'package:flutter/material.dart';

import '../pages/home_view.dart';

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