import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travello_app/models/product.dart';
import 'package:travello_app/utils/AppColors.dart';
import 'package:travello_app/utils/AppStyles.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Product product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int selectedColorIndex = 1;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite_border),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: PageView.builder(
                controller: _pageController,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Center(
                    child: Image.asset(
                      widget.product.image,
                      height: 250.h,
                      fit: BoxFit.contain,
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10.h),
            SmoothPageIndicator(
              controller: _pageController,
              count: 3,
              effect: ExpandingDotsEffect(
                activeDotColor: AppColors.accent,
                dotColor: AppColors.accent.withOpacity(0.2),
                dotHeight: 6.h,
                dotWidth: 6.w,
                expansionFactor: 3,
                spacing: 8.w,
              ),
            ),
            SizedBox(height: 20.h),
            Expanded(
              flex: 6,
              child: Container(
                padding: EdgeInsets.all(24.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, -5),
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              widget.product.name,
                              style: AppStyles.bold20Black,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.w,
                              vertical: 6.h,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.amber[50]?.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 18,
                                ),
                                SizedBox(width: 4.w),
                                Text(
                                  "${widget.product.rating}",
                                  style: AppStyles.bold16Accent.copyWith(
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Text("( With solo loop )", style: AppStyles.medium14Grey),
                      SizedBox(height: 24.h),
                      Text("Colors", style: AppStyles.semiBold16Black),
                      SizedBox(height: 12.h),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                            widget.product.availableColors.length,
                            (index) {
                              bool isSelected = selectedColorIndex == index;
                              return GestureDetector(
                                onTap: () =>
                                    setState(() => selectedColorIndex = index),
                                child: Container(
                                  margin: EdgeInsets.only(right: 12.w),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 14.w,
                                    vertical: 10.h,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: isSelected
                                          ? AppColors.accent
                                          : Colors.grey[200]!,
                                      width: 1.5,
                                    ),
                                    borderRadius: BorderRadius.circular(12.r),
                                  ),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 10,
                                        backgroundColor: widget
                                            .product
                                            .availableColors[index],
                                      ),
                                      SizedBox(width: 8.w),
                                      Text(
                                        index == 0
                                            ? "Silver"
                                            : (index == 1
                                                  ? "Bright Orange"
                                                  : "Starlight"),
                                        style: AppStyles.medium14Grey.copyWith(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 24.h),
                      Row(
                        children: [
                          Column(
                            children: [
                              Text("Details", style: AppStyles.bold14Accent),
                              Container(
                                margin: EdgeInsets.only(top: 4.h),
                                height: 2.h,
                                width: 25.w,
                                color: AppColors.accent,
                              ),
                            ],
                          ),
                          SizedBox(width: 30.w),
                          Text("Review", style: AppStyles.medium14Grey),
                        ],
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        widget.product.description,
                        style: AppStyles.medium14Grey.copyWith(
                          height: 1.6,
                          fontSize: 14.sp,
                        ),
                      ),
                      SizedBox(height: 30.h),
                      SizedBox(
                        width: double.infinity,
                        height: 56.h,
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.shopping_cart_outlined),
                          label: Text(
                            "Add to Cart | \$${widget.product.price}",
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.accent,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                            elevation: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
