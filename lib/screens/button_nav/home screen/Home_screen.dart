import 'package:app_store/core/helpers/App_Field.dart';
import 'package:app_store/core/helpers/App_Styles.dart';
import 'package:app_store/core/helpers/App_assets.dart';
import 'package:app_store/core/helpers/App_colors.dart';
import 'package:app_store/core/helpers/snackBar.dart';
import 'package:app_store/screens/button_nav/home%20screen/category/cubit/category_cubit.dart';
import 'package:app_store/screens/product%20%20details%20screen/producrdetails_screen.dart';
import 'package:app_store/widgets/all_category.dart';
import 'package:app_store/widgets/all_product_home.dart';
import 'package:app_store/widgets/produc_gridbuilder.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_store/screens/button_nav/home%20screen/cubit/product_cubit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductCubit()..getAllProduct(),
        ),
        BlocProvider(
          create: (context) => CategoryCubit()..getcategory(),
        ),
      ],
      child: Scaffold(
        backgroundColor: AppColors.scaffoldColor,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          scrolledUnderElevation: 0,
          backgroundColor: AppColors.scaffoldColor,
          title: Text(
            "Discover",
            style: AppStyles.kAppStyle32black,
          ),
        ),
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                spacing: 8,
                children: [
                  Expanded(
                    child: AppField(
                      hintText: "Search for clothes...",
                      prefix: SizedBox(
                        height: 52,
                        width: 52,
                        child: Icon(
                          Icons.search,
                          color: Color(0xffB3B3B3),
                        ),
                      ),
                    ),
                  ),
                  SvgPicture.asset(AppAssets.buttonAssets)
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            AllCategory(),
            SizedBox(
              height: 24,
            ),
            AllProductHomePage(),
          ],
        ),
      ),
    );
  }
}
