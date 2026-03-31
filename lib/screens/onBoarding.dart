import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travello_app/utils/AppColors.dart';
import 'package:travello_app/utils/AppStyles.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final PageController _controller = PageController();
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: Stack(
          children: [
            PageView(
              controller: _controller,
              onPageChanged: (index) {
                setState(() => isLastPage = index == 2
                );
              },
              children: [
                buildPage(image: "assets/onboarding_img1.png",
                    title: "Explore the\nworld easily",
                    subtitle: "To your desire"),
                buildPage(image: "assets/onboarding_img2.png",
                    title: "Reach the\nunknown spot",
                    subtitle: "To your destination"),
                buildPage(image: "assets/onboarding_img3.png",
                    title: "Make connects\nwith Travello",
                    subtitle: "To your dream trip"),
              ],
            ),
            Positioned(
                bottom: 140.h,
                left: 20.w,
                right: 50.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SmoothPageIndicator(controller: _controller, count: 3,
                      effect: ExpandingDotsEffect(
                          activeDotColor: AppColors.primary,
                          dotColor: Color(0xFFFF7686),
                          dotHeight: 8.w,
                          dotWidth: 8.w,
                          expansionFactor: 2.w,
                          spacing: 5.w
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (isLastPage) {

                        }
                        else {
                          _controller.nextPage(
                              duration: Duration(microseconds: 500),
                              curve: Curves.easeInOut);
                        }
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle
                        ),
                        child: Icon(Icons.arrow_forward_ios_rounded,
                          color: AppColors.whiteColor,),
                      ),
                    )

                  ],
                ))
          ],
        )
    );
  }
}


Widget buildPage(
    {required String image, required String title, required String subtitle}) {
  return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.h),
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 120.h,),
          Center(child: Image.asset(image, height: 300.h, width: 300.w,)),
          SizedBox(height: 100.h,),
          Text(title, style: AppStyles.extraBold36Black,),

          Text(subtitle, style: AppStyles.light26gray,)
        ],
      )
  );
}
