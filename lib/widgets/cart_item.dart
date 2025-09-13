part of 'package:app_store/screens/button_nav/cart_screen/cart_screen.dart';

class CartItem extends StatelessWidget {
  CartItem({super.key, required this.amount});
  final String amount;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderColor),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Image.asset(
            AppAssets.productAsset,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Regular Fit Slogan",
                        style:
                            AppStyles.kAppStyle32black.copyWith(fontSize: 14)),
                    SvgPicture.asset(
                      AppAssets.trashAssets,
                      height: 20,
                    ),
                  ],
                ),
                Text("Size L",
                    style: AppStyles.kAppStyle16gray.copyWith(fontSize: 12)),
                SizedBox(
                  height: 20,
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
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Text(amount, style: TextStyle(fontSize: 16)),
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
