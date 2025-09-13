import 'package:app_store/core/helpers/App_Styles.dart';
import 'package:app_store/core/helpers/App_assets.dart';
import 'package:app_store/core/helpers/App_colors.dart';
import 'package:app_store/core/helpers/cash_helper.dart';
import 'package:app_store/screens/auth/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogOutSheet {
  static void show(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            backgroundColor: AppColors.scaffoldColor,
            // shape:
            //     BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              width: 340.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 10.w,
                children: [
                  SvgPicture.asset(AppAssets.warningAssets),
                  Text(
                    "Logout?",
                    style: AppStyles.kAppStyleProducName,
                  ),
                  Text(
                    "Are you sure you want to logout?",
                    style: AppStyles.kAppStyle16gray,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        CashHelper.deleteToken();
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        fixedSize: Size(270.w, 50.h),
                        backgroundColor: Colors.red,
                      ),
                      child: Text(
                        "Yes,Logout",
                        style: AppStyles.kAppStyle16white,
                      )),
                  OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: AppColors.borderColor),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        fixedSize: Size(270.w, 50.h),
                        backgroundColor: AppColors.scaffoldColor,
                      ),
                      child: Text(
                        "No,Cancel",
                        style: AppStyles.kAppStyle16white
                            .copyWith(color: Colors.black),
                      ))
                ],
              ),
            ),
          );
        });
  }
}
