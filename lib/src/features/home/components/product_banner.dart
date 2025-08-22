import 'dart:async';

// import 'package:al_barq/src/core/constants/constants.dart';
import 'package:al_barq/config/theme_data.dart';
import 'package:al_barq/src/core/constants/network_images.dart';
import 'package:al_barq/src/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductBanner extends StatefulWidget {
  const ProductBanner({super.key});

  @override
  State<ProductBanner> createState() => _ProductBannerState();
}

class _ProductBannerState extends State<ProductBanner> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  Timer? _timer;

  final List<String> banners = [
    NetworkImages.productBanner,
    NetworkImages.productBanner,
    NetworkImages.productBanner,
  ];

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      if (_currentIndex < banners.length - 1) {
        _currentIndex++;
      } else {
        _currentIndex = 0;
      }
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: myPadding / 2),
      child: Column(
        children: [
          SizedBox(
            height: 180,
            child: PageView.builder(
              controller: _pageController,
              itemCount: banners.length,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.network(banners[index], fit: BoxFit.cover),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black.withValues(alpha: 0.6),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 16,
                        top: 25,
                        right: 16,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Solar Products",
                              style: context.textTheme.bodyMedium?.copyWith(
                                fontSize: 24,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "Pakistan's first solar mobile \napp",
                              style: context.textTheme.bodyMedium?.copyWith(
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: myPadding / 2),
                            OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(color: Colors.white),
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.black.withValues(
                                  alpha: 0.3,
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: myPadding / 1.3,
                                  vertical: myPadding / 2,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                              onPressed: () {},
                              child: Text(
                                "View Products",
                                style: context.textTheme.bodySmall?.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: myPadding / 1.5),
          SmoothPageIndicator(
            controller: _pageController,
            count: banners.length,
            effect: ExpandingDotsEffect(
              activeDotColor: Colors.orange,
              dotColor: Colors.grey.shade400,
              dotHeight: myPadding / 2,
              dotWidth: myPadding / 2,
              expansionFactor: 3,
            ),
          ),
        ],
      ),
    );
  }
}
