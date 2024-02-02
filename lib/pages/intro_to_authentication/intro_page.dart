import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:flutt_clothes_shop/common/buttons/blurred_round_button.dart';
import 'package:flutt_clothes_shop/common/ui_consts/app_colors.dart';
import 'package:flutt_clothes_shop/common/ui_consts/app_text_styles.dart';
import 'package:flutt_clothes_shop/common/widgets/appbar.dart';
import 'package:flutt_clothes_shop/pages/intro_to_authentication/_widgets/page_view_item.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final pageController = PageController();
  late int? currentPage;

  static const itemCount = 3;

  static const headerTextsList = [
    'Discover something new',
    'Update trendy outfit',
    'Explore your true style',
  ];

  static const subTextsList = [
    'Special new arrivals just for you',
    'Favorite brands and hottest trends',
    'Relax and let us bring the style to you',
  ];

  @override
  void initState() {
    currentPage = null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              color: AppColors.gray,
              height: MediaQuery.sizeOf(context).height / 2.2,
              width: double.maxFinite,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                currentPage == null
                    ? headerTextsList[0]
                    : headerTextsList[currentPage! - 1],
                style: AppTextStyles.blackBold20,
              ),
              const SizedBox(height: 20),
              Text(
                currentPage == null
                    ? subTextsList[0]
                    : subTextsList[currentPage! - 1],
                style: AppTextStyles.black14,
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: 370,
                child: PageView.builder(
                  onPageChanged: (page) => setState(() {
                    currentPage = page + 1;
                  }),
                  controller: pageController,
                  itemCount: itemCount,
                  itemBuilder: (context, index) {
                    return FractionallySizedBox(
                      widthFactor: 0.7,
                      child: PageViewItem(
                          assetPath:
                              'assets/images/intro_page${index + 1}.png'),
                    );
                  },
                ),
              ),
              const SizedBox(height: 70),
              SmoothPageIndicator(
                controller: pageController,
                count: itemCount,
                effect: const WormEffect(
                    dotColor: AppColors.white,
                    activeDotColor: AppColors.white,
                    dotHeight: 6,
                    dotWidth: 6,
                    paintStyle: PaintingStyle.stroke),
              ),
              const SizedBox(height: 30),
              BlurredRoundButton(
                text: 'Shopping now',
                onTap: () => context.push('/login'),
              )
            ],
          ),
        ],
      ),
    );
  }
}
