part of 'package:app_store/screens/button_nav/cart_screen/cart_screen.dart';

class CartItem extends StatelessWidget {
  CartItem({super.key, required this.amount});
  final String amount;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12.w),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderColor),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Image.asset(
            AppAssets.productAsset,
            width: 60.w,
            height: 60.h,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Regular Fit Slogan",
                        style: AppStyles.kAppStyle32black
                            .copyWith(fontSize: 14.sp)),
                    SvgPicture.asset(
                      AppAssets.trashAssets,
                      height: 20.h,
                    ),
                  ],
                ),
                Text("Size L",
                    style: AppStyles.kAppStyle16gray.copyWith(fontSize: 12.sp)),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("\$ 1,190",
                        style: AppStyles.kAppStyle16white
                            .copyWith(color: Colors.black)),
                    Row(
                      children: [
                        CartButton(icon: Icons.remove),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          child:
                              Text(amount, style: TextStyle(fontSize: 16.sp)),
                        ),
                        CartButton(icon: Icons.add),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
