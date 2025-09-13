import 'package:app_store/core/helpers/App_assets.dart';
import 'package:app_store/core/helpers/App_colors.dart';
import 'package:app_store/screens/button_nav/cart_screen/cart_screen.dart';
import 'package:app_store/screens/button_nav/cart_screen/cubit/cart_cubit.dart';
import 'package:app_store/screens/button_nav/home%20screen/Home_screen.dart';
import 'package:app_store/screens/button_nav/profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Homenav extends StatefulWidget {
  const Homenav({super.key});

  @override
  State<Homenav> createState() => _HomenavState();
}

class _HomenavState extends State<Homenav> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [HomeScreen(), CartScreen(), ProfileScreen()];
    return BlocProvider(
      create: (context) => CartCubit()..getUserCart(1),
      child: Scaffold(
        backgroundColor: AppColors.scaffoldColor,
        bottomNavigationBar: Container(
          height: 70.h,
          decoration: BoxDecoration(
            color: AppColors.scaffoldColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.r),
              topRight: Radius.circular(40.r),
            ),
            border: Border(top: BorderSide(color: AppColors.borderColor)),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors.primaryColor,
            unselectedItemColor: AppColors.textGray,
            backgroundColor: Colors.white,
            currentIndex: index,
            onTap: (int x) {
              setState(() {
                index = x;
              });
            },
            items: [
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppAssets.homeAsset,
                    color: index == 0
                        ? AppColors.primaryColor
                        : AppColors.textGray,
                  ),
                  label: "Home"),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(AppAssets.cartAssets,
                      color: index == 1
                          ? AppColors.primaryColor
                          : AppColors.textGray),
                  label: "Cart"),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppAssets.userAssets,
                    color: index == 2
                        ? AppColors.primaryColor
                        : AppColors.textGray,
                  ),
                  label: "Profile"),
            ],
          ),
        ),
        body: screens[index],
      ),
    );
  }
}
