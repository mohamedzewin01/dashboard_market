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
              Expanded(child: AddBannerView()),
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
              padding: const EdgeInsets.all(16),
              child: CustomScrollView(
                slivers: [

                  SliverList.separated(
                    itemCount: banners.length,
                    itemBuilder: (context, index) => ItemBanners(
                      banner: banners[index],
                    ),
                    separatorBuilder: (context, index) => SizedBox(
                      height: 10,
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
  const ItemBanners({super.key, required this.banner});

  final Banners banner;

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
                        color: Colors.green,
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
          ],
        ),
      ),
    );
  }
}
