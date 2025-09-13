import 'package:app_store/core/helpers/App_ElevatedButton.dart';
import 'package:app_store/core/helpers/App_Styles.dart';
import 'package:app_store/core/helpers/App_assets.dart';
import 'package:app_store/core/helpers/App_colors.dart';
import 'package:app_store/core/helpers/snackBar.dart';
import 'package:app_store/models/product_model.dart';
import 'package:app_store/screens/button_nav/cart_screen/cubit/cart_cubit.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProducrdetailsScreen extends StatelessWidget {
  ProducrdetailsScreen({super.key, required this.model});
  ProductModel model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            border: Border(top: BorderSide(color: AppColors.borderColor))),
        height: 105,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            spacing: 16,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    textAlign: TextAlign.start,
                    "Price",
                    style: AppStyles.kAppStyle16gray
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    r"$" + model.price.toString(),
                    style: AppStyles.kAppStyle32black
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
              Expanded(
                child: BlocConsumer<CartCubit, CartState>(
                  listener: (context, state) {
                    if (state is AddToCartSuccess) {
                      mySnackBar(
                          msg: "Item Added Successfuly",
                          type: ContentType.success,
                          context: context);
                    }
                    if (state is AddToCartFailure) {
                      mySnackBar(
                          msg: "can not add item to cart",
                          type: ContentType.failure,
                          context: context);
                    }
                  },
                  builder: (context, state) {
                    final cubit = context.read<CartCubit>();
                    if (state is CartLoading) {
                      return CircularProgressIndicator();
                    }
                    return AppElevatedbutton(
                      size: Size(240, 54),
                      onPressed: () {
                        cubit.postToCart();
                      },
                      widget: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 10,
                        children: [
                          SvgPicture.asset(AppAssets.bagAssets),
                          Text(
                            "Add  To  Cart",
                            style: AppStyles.kAppStyle16white,
                          )
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        forceMaterialTransparency: false,
        backgroundColor: AppColors.scaffoldColor,
        title: Text(
          "Details",
          style: AppStyles.kAppStyle32black,
        ),
        centerTitle: true,
        leading: BackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        child: Column(
          spacing: 15,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                flex: 1,
                child: Image.network(
                  model.image ?? "",
                  height: 360,
                )),
            Text(
              model.title ?? "Fit Polo T Shirt",
              style: AppStyles.kAppStyle32black.copyWith(fontSize: 24),
            ),
            Row(
              spacing: 3,
              children: [
                SvgPicture.asset(AppAssets.starAssets),
                Text(
                  "${model.rating!.rate ?? 0}/5",
                  style:
                      AppStyles.kAppStyle16white.copyWith(color: Colors.black),
                ),
                Text(
                  "(${model.rating!.count ?? 0}reviews)",
                  style:
                      AppStyles.kAppStyle16white.copyWith(color: Colors.grey),
                ),
              ],
            ),
            Text(
              model.description ??
                  "Blue T Shirt . Good for All Men and Suits for All of Them.Blue T Shirt . Good for All Men and Suits for All of Them",
              style: AppStyles.kAppStyle16gray,
            ),
          ],
        ),
      ),
    );
  }
}
