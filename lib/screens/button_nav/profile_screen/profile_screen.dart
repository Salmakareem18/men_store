import 'package:app_store/core/helpers/App_assets.dart';
import 'package:app_store/core/helpers/App_colors.dart';
import 'package:app_store/core/helpers/appbar.dart';
import 'package:app_store/screens/address_screen.dart';
import 'package:app_store/widgets/dialog_sheet.dart';
import 'package:app_store/widgets/listtitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/helpers/App_Styles.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      appBar: CustomAppbar(
        title: "Account",
      ),
      body: Column(
        spacing: 5,
        children: [
          Divider(
            indent: 30,
            endIndent: 30,
            color: AppColors.borderColor,
          ),
          ListTitleProfile(
            leading: SvgPicture.asset(AppAssets.boxsAssets),
            title: "My Orders",
            style: AppStyles.kAppStyleProducName,
            trianling: Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
          ),
          Divider(
            thickness: 7,
            color: Color(0xffAAAAAA),
          ),
          ListTitleProfile(
            leading: SvgPicture.asset(AppAssets.detailsAssets),
            title: "My Details",
            style: AppStyles.kAppStyleProducName,
            trianling: Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
          ),
          Divider(
            indent: 35,
            endIndent: 35,
            color: AppColors.borderColor,
          ),
          ListTitleProfile(
            leading: SvgPicture.asset(AppAssets.addressAssets),
            title: "Address Book",
            style: AppStyles.kAppStyleProducName,
            trianling: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddressScreen()));
              },
              child: Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
              ),
            ),
          ),
          Divider(
            indent: 35,
            endIndent: 35,
            color: AppColors.borderColor,
          ),
          ListTitleProfile(
            leading: SvgPicture.asset(AppAssets.questionAssets),
            title: "FAQs",
            style: AppStyles.kAppStyleProducName,
            trianling: Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
          ),
          Divider(
            indent: 35,
            endIndent: 35,
            color: AppColors.borderColor,
          ),
          ListTitleProfile(
            leading: SvgPicture.asset(AppAssets.headphoneAssets),
            title: "Help Center",
            style: AppStyles.kAppStyleProducName,
            trianling: Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
          ),
          Divider(
            thickness: 7,
            color: AppColors.borderColor,
          ),
          SizedBox(
            height: 100,
          ),
          GestureDetector(
            onTap: () {
              LogOutSheet.show(context);
            },
            child: ListTitleProfile(
              leading: SvgPicture.asset(AppAssets.logoutAssets),
              title: "LogOut",
              style: AppStyles.kAppStyleProducName
                  .copyWith(color: Color(0xffED1010)),
            ),
          ),
        ],
      ),
    );
  }
}
