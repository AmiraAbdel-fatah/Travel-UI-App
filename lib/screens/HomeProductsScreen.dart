import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travello_app/models/product.dart';
import 'package:travello_app/screens/ProductDetailsScreen.dart';
import 'package:travello_app/utils/AppColors.dart';
import 'package:travello_app/utils/AppStyles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedCategory = 0;
  final List<String> categories = [
    "Smart Watch",
    "Apple",
    "Samsung",
    "Xiaomi",
    "Huawei",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              Text(
                "Find your suitable\nwatch now.",
                style: AppStyles.bold24Black.copyWith(fontSize: 30.sp),
              ),
              SizedBox(height: 24.h),
              Row(
                children: [
                  Container(
                    height: 50.h,
                    width: 290.w,
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(25.r),
                      border: BoxBorder.all(color: AppColors.title),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search Product",
                        hintStyle: AppStyles.medium14Grey.copyWith(
                          color: AppColors.title,
                        ),
                        prefixIcon: Icon(
                          Icons.search_rounded,
                          color: AppColors.blackColor,
                          size: 28,
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 12.h),
                      ),
                    ),
                  ),
                  SizedBox(width: 30.w),
                  Container(
                    height: 22.h,
                    width: 22.h,
                    decoration: BoxDecoration(
                      color: AppColors.lightGrey.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Image.asset("assets/Category.png"),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              SizedBox(
                height: 40.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    bool isSelected = selectedCategory == index;
                    return GestureDetector(
                      onTap: () => setState(() => selectedCategory = index),
                      child: Padding(
                        padding: EdgeInsets.only(right: 20.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              categories[index],
                              style: isSelected
                                  ? AppStyles.bold14Accent
                                  : AppStyles.medium14Grey,
                            ),
                            if (isSelected)
                              Container(
                                margin: EdgeInsets.only(top: 4.h),
                                height: 2.h,
                                width: 20.w,
                                color: AppColors.accent,
                              ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 16.h),
              Expanded(
                child: GridView.builder(
                  itemCount: products.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.w,
                    mainAxisSpacing: 16.h,
                    childAspectRatio: 0.75,
                  ),
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ProductDetailsScreen(product: product),
                          ),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(12.w),
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(20.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 100.h,
                              width: 140.w,
                              decoration: BoxDecoration(
                                color: index == 0
                                    ? AppColors.bGround_1
                                    : (index == 1
                                          ? AppColors.bGround_2
                                          : (index == 2
                                                ? AppColors.bGround_3
                                                : AppColors.bGround_4)),
                                borderRadius: BorderRadius.circular(15.r),
                              ),
                              child: Center(
                                child: Image.asset(
                                  product.image,
                                  height: 100.h,
                                  width: 100.w,
                                ),
                              ),
                            ),
                            SizedBox(height: 12.h),
                            Text(product.name, style: AppStyles.bold18Black),
                            Text(product.brand, style: AppStyles.medium14Grey),
                            const Spacer(),
                            Text(
                              "\$${product.price}",
                              style: AppStyles.bold14Accent,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
