import 'package:app_store/core/helpers/App_Styles.dart';
import 'package:app_store/screens/button_nav/cart_screen/cubit/cart_cubit.dart';
import 'package:app_store/screens/product%20%20details%20screen/producrdetails_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../core/helpers/App_assets.dart';
import '../core/helpers/App_colors.dart';
import '../screens/button_nav/home screen/cubit/product_cubit.dart';

class AllProductHomePage extends StatelessWidget {
  const AllProductHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductStates>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return Center(
            child: Lottie.asset(
              AppAssets.loadingAssets,
              width: 150,
              height: 150,
              fit: BoxFit.contain,
            ),
          );
        }
        if (state is Productfailure) {
          return Center(
              child: Text(
            "No data",
            style: AppStyles.kAppStyle32black,
          ));
        }

        if (state is ProductSuccess) {
          return Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(25),
              itemCount: state.model.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.9,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 12),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BlocProvider.value(
                                value: CartCubit(),
                                child: ProducrdetailsScreen(
                                    model: state.model[index]),
                              )));
                },
                child: Container(
                  color: AppColors.scaffoldColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                          child: Image.network(state.model[index].image ?? "")),
                      Text(
                        state.model[index].title ?? "Fit Polo T Shirt",
                        style: AppStyles.kAppStyleProducName,
                        maxLines: 1,
                      ),
                      Text(
                        r"$" + state.model[index].price.toString(),
                        style: AppStyles.kAppStyleProductPrice,
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}
