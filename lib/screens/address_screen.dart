import 'package:app_store/core/helpers/App_Styles.dart';
import 'package:app_store/core/helpers/App_assets.dart';
import 'package:app_store/core/helpers/App_colors.dart';
import 'package:app_store/core/helpers/appbar.dart';
import 'package:app_store/widgets/address_container.dart';
import 'package:app_store/widgets/listtitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      appBar: CustomAppbar(title: "Address"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Divider(
              indent: 30,
              endIndent: 30,
              color: AppColors.borderColor,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Saved Address",
                style: AppStyles.kAppStyleProducName,
              ),
            ),
            AddressContainer(
                title: Row(
                  spacing: 4,
                  children: [
                    Text(
                      "Home",
                      style: AppStyles.kAppStyleProducName,
                    ),
                    Container(
                      height: 30,
                      width: 70,
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(7)),
                      child: Center(
                        child: Text(
                          "Default",
                          style: AppStyles.kAppStyle16white
                              .copyWith(color: Colors.black, fontSize: 14),
                        ),
                      ),
                    )
                  ],
                ),
                subtitle: "925 S Chugach St #APT 10, Alas..."),
            AddressContainer(
                title: Text(
                  "Office",
                  style: AppStyles.kAppStyleProducName,
                ),
                subtitle: "2438 6th Ave, Ketchikan, Alaska 99901, USA"),
            AddressContainer(
                title: Text(
                  "Apartment",
                  style: AppStyles.kAppStyleProducName,
                ),
                subtitle: "2551 Vista Dr #B301, Juneau, Alaska 99801, USA"),
            AddressContainer(
                title: Text(
                  "Parent’s House",
                  style: AppStyles.kAppStyleProducName,
                ),
                subtitle: "4821 Ridge Top Cir, Anchorage, Alaska 99508, USA"),
          ],
        ),
      ),
    );
  }
}
