import 'package:app_store/core/helpers/App_ElevatedButton.dart';
import 'package:app_store/core/helpers/App_Styles.dart';
import 'package:app_store/core/helpers/App_assets.dart';
import 'package:app_store/core/helpers/App_colors.dart';
import 'package:app_store/core/helpers/appbar.dart';
import 'package:app_store/screens/button_nav/cart_screen/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

import '../../../widgets/cartbutton.dart';
import '../../../widgets/cartrow.dart';
part 'package:app_store/widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.scaffoldColor,
        appBar: CustomAppbar(
          title: "My Cart",
        ),
        body: Column(children: [
          Expanded(
            child: BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                if (state is CartLoading) {
                  return Center(
                    child: Lottie.asset(
                      AppAssets.loadingAssets,
                      width: 150,
                      height: 150,
                      fit: BoxFit.contain,
                    ),
                  );
                }
                if (state is CartFailure) {
                  return Center(
                      child: Text(
                    "No data",
                    style: AppStyles.kAppStyleProducName,
                  ));
                }
                if (state is CartSuccess) {
                  return ListView.builder(
                      itemCount: state.model[0].products!.length,
                      itemBuilder: (context, index) => CartItem());
                } else {
                  return Container();
                }
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: Column(
              spacing: 16,
              children: [
                CartRow(isgray: true, label: "Sub-total", value: r"$5,870"),
                CartRow(isgray: true, label: "VAT(%)", value: r"$0.00"),
                CartRow(isgray: true, label: "Shipping Fee", value: r"$80"),
                Divider(),
                CartRow(label: "Total", value: r"$5,950"),
                SizedBox(
                  height: 25,
                ),
                AppElevatedbutton(
                  onPressed: () {},
                  widget: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Go To Checkout    ",
                        style: AppStyles.kAppStyle16white,
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 25,
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ]));
  }
}
