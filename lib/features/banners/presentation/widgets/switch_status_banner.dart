import 'package:dashboard_market/features/banners/data/models/response/banners_models_response.dart';
import 'package:dashboard_market/features/banners/presentation/cubit/banners_cubit.dart';
import 'package:flutter/material.dart';



class SwitchStatusBanner extends StatefulWidget {
  const SwitchStatusBanner({
    super.key, this.onChanged, required this.value,

  });


final void Function(bool)? onChanged;
final bool value;
  @override
  State<SwitchStatusBanner> createState() => _SwitchStatusBannerState();
}

class _SwitchStatusBannerState extends State<SwitchStatusBanner> {
  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: .6,
      child: Switch(
        mouseCursor: SystemMouseCursors.click,
        activeTrackColor: Colors.lightGreen.shade400,
        activeColor: Colors.green.shade800,
        inactiveThumbColor: Colors.grey.shade400,
        inactiveTrackColor: Colors.grey.shade300,
        value:widget.value,
        onChanged:widget.onChanged,
      ),

    );
  }
}



class SwitchChangeStatus extends StatefulWidget {
  const SwitchChangeStatus({
    super.key,
    required this.banner,
    required this.viewModel,
  });

  final Banners banner;
  final BannersCubit viewModel;

  @override
  State<SwitchChangeStatus> createState() => _SwitchChangeStatusState();
}

class _SwitchChangeStatusState extends State<SwitchChangeStatus> {
  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: .6,
      child: Switch(
        mouseCursor: SystemMouseCursors.click,
        activeTrackColor: Colors.lightGreen.shade400,
        activeColor: Colors.green.shade800,
        inactiveThumbColor: Colors.grey.shade400, // لون المفتاح عند عدم التفعيل
        inactiveTrackColor: Colors.grey.shade300, // لون المسار عند عدم التفعيل
        value: widget.banner.bannersStatus == 1, // حالة المنتج
        onChanged: (value) {
          setState(() {
            widget.viewModel.changeStatus(bannerId: widget.banner.bannersId!, status: value ? 1 : 0);
             widget.banner.bannersStatus = value ? 1 : 0;
          });
        },
      ),

    );
  }
}
