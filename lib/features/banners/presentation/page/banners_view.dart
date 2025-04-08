import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dashboard_market/core/di/di.dart';
import 'package:dashboard_market/core/resources/cashed_image.dart';
import 'package:dashboard_market/core/widgets/adaptive%20layout.dart';
import 'package:dashboard_market/features/banners/data/models/response/banners_models_response.dart';
import 'package:dashboard_market/features/banners/presentation/cubit/banners_cubit.dart';
import 'package:dashboard_market/features/banners/presentation/widgets/add_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/api/api_constants.dart';
import '../widgets/switch_status_banner.dart';

class BannersView extends StatefulWidget {
  const BannersView({
    super.key,
  });

  @override
  State<BannersView> createState() => _BannersViewState();
}

class _BannersViewState extends State<BannersView> {
  late BannersCubit viewModel;

  @override
  void initState() {
    viewModel = getIt.get<BannersCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: viewModel..fetchBanners(),
      child: Scaffold(
        body: AdaptiveLayout(
          mobileLayout: (context) => BannersBody(viewModel: viewModel),
          tabletLayout: (context) => BannersBody(viewModel: viewModel),
          desktopLayout: (context) => Row(
            children: [
              SizedBox(width: 390, child: AddBannerView()),
              Expanded(child: BannersBody(viewModel: viewModel)),
            ],
          ),
        ),
      ),
    );
  }
}

class BannersBody extends StatelessWidget {
  const BannersBody({super.key, required this.viewModel});

  final BannersCubit viewModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BannersCubit, BannersState>(
      builder: (context, state) {
        if (state is BannersLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is BannersSuccess) {
          List<Banners>? banners =
              state.bannersEntity?.banners?.reversed.toList() ?? [];
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(24),
              child: CustomScrollView(
                slivers: [
                  SliverList.separated(
                    itemCount: banners.length,
                    itemBuilder: (context, index) => ItemBanners(
                      viewModel: viewModel,
                      banner: banners[index],
                    ),
                    separatorBuilder: (context, index) => SizedBox(
                      height: 16,
                    ),
                  )
                ],
              ),
            ),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

class ItemBanners extends StatelessWidget {
  const ItemBanners({super.key, required this.banner, required this.viewModel});

  final Banners banner;
  final BannersCubit viewModel;

  @override
  Widget build(BuildContext context) {
    final List<Color> colors = [
      Colors.orange,
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.purple,
      Colors.teal,
      Colors.pink,
      Colors.cyan,
      Colors.indigo,
      Colors.lime,
      Colors.deepOrange,
      Colors.deepPurple,
      Colors.lightGreen,
      Colors.lightBlue,
      Colors.brown,
      Colors.grey,
    ];

    final List<String> actionString = [
      '💥', // انفجار - يعبر عن الحماس
      '🎉', // احتفال - يعبر عن السعادة
      '🎁', // هدية - يعبر عن المكافآت
      '💯', // مئة بالمئة - يعبر عن الجودة
      '✨', // بريق - يعبر عن التميز
      '🔥', // نار - يعبر عن العروض الساخنة
      '🚀', // صاروخ - يعبر عن السرعة
      '🌟', // نجمة - يعبر عن التفوق
      '🛍️', // حقيبة تسوق - يعبر عن الشراء
      '📣', // مكبر صوت - يعبر عن الإعلان
      '⚡', // صاعقة - يعبر عن العروض القوية
      '🔔', // جرس - يعبر عن التنبيه بالعروض
      '🏷️', // بطاقة خصم - يعبر عن التخفيضات
      '🌟', // نجمة - يعبر عن التفوق];
    ];

    // مولد عشوائي
    final Random random = Random();

    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      child: AspectRatio(
        aspectRatio: 4.5,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: MediaQuery.of(context).size.width - 48,
              decoration: BoxDecoration(
                color: colors[random.nextInt(colors.length)],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(18),
                          bottomLeft: Radius.circular(18),
                        ),
                        // color: Colors.green.shade200,
                        image: DecorationImage(
                          image: NetworkImage(
                            '${ApiConstants.baseUrlImage}${banner.bannersUrlImage}',
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                        ),
                        child: Text(
                          banner.bannersTitle ?? '',
                          maxLines: 1,
                          textDirection: TextDirection.rtl,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontFamily: GoogleFonts.cairo(
                              fontWeight: FontWeight.w900,
                            ).fontFamily,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                        ),
                        child: Text(
                          banner.bannersDescription ?? '',
                          maxLines: 1,
                          textDirection: TextDirection.rtl,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontFamily: GoogleFonts.cairo(
                              fontWeight: FontWeight.w900,
                            ).fontFamily,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              // top: 0,
              bottom: 0,
              right: 0,
              child: SwitchChangeStatus(
                viewModel:viewModel ,
                banner:banner ,


              ),
            ),
            Positioned(
              top: 0,
              // right: 0,
              left: 0,
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 15,
                child: Text(
                  actionString[random.nextInt(actionString.length)],
                ),
              ),
            ),
            Positioned(
              top: 5,
              right: 5,
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 15,
                child: IconButton(
                  color: Colors.redAccent,
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        title: Row(
                          children: [
                            Icon(Icons.warning_rounded,
                                color: Colors.red, size: 28),
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
                        content: Text(
                          'هل أنت متأكد من حذف البانر؟',
                          style: TextStyle(fontSize: 16, color: Colors.black54),
                        ),
                        actionsAlignment: MainAxisAlignment.spaceBetween,
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text(
                              'إلغاء',
                              style: TextStyle(
                                  color: Colors.grey.shade700, fontSize: 16),
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () async {
                              await viewModel.deleteBanner(
                                  bannerId: banner.bannersId,
                                  imagePath: banner.bannersUrlImage);
                              if (context.mounted) {
                                Navigator.pop(context);
                              }
                            },
                            child: Text(
                              'حذف',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  icon: Icon(Icons.delete, color: Colors.redAccent, size: 20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
