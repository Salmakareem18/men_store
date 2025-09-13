import 'package:app_store/screens/button_nav/home%20screen/category/cubit/category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/helpers/App_Styles.dart';
import '../core/helpers/App_colors.dart';
import '../screens/button_nav/home screen/cubit/product_cubit.dart';

class AllCategory extends StatefulWidget {
  const AllCategory({super.key});

  @override
  State<AllCategory> createState() => _AllCategoryState();
}

class _AllCategoryState extends State<AllCategory> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          if (state is CategorySuccess) {
            return ListView.builder(
                itemCount: state.model.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                        if (state.model[index] == 'All') {
                          BlocProvider.of<ProductCubit>(context)
                              .getAllProduct();
                        } else {
                          BlocProvider.of<ProductCubit>(context)
                              .getCategoryProduct(state.model[index]);
                        }
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 6),
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        height: 36,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.borderColor),
                          borderRadius: BorderRadius.circular(10),
                          color: selectedIndex == index
                              ? AppColors.primaryColor
                              : AppColors.textButtonColor,
                        ),
                        child: Center(
                            child: Text(state.model[index],
                                style: selectedIndex == index
                                    ? AppStyles.kAppStyle16white
                                    : AppStyles.kAppStyle16white
                                        .copyWith(color: Colors.black))),
                      ),
                    ));
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
