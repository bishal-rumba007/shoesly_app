import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shoesly_app/core/themes/theme_export.dart';
import 'package:shoesly_app/core/widgets/build_button.dart';


class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cart",
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Column(
            children: [
              SizedBox(height: 30.h,),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 2,
                itemBuilder: (context, index) {
                  return ProductCard(
                    keyVal: index.toString(),
                  );
                },
                separatorBuilder: (_, __) => SizedBox(height: 30.h,),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        height: 90.h,
        alignment: Alignment.bottomCenter,
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 16.h),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            boxShadow: [
              BoxShadow(
                color: AppColor.primaryColor.withOpacity(0.05),
                offset: const Offset(0, -20),
                blurRadius: 30,
              ),
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Grand Total',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColor.grey200,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  '\$705.00',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 65.w,
            ),
            Expanded(
              child: BuildButton(
                onPressed: () {
                  context.push('/order-summary');
                },
                buttonWidget: Text("check out".toUpperCase()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class ProductCard extends StatefulWidget {
  final String keyVal;

  const ProductCard({super.key, required this.keyVal});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(widget.keyVal),
      background: Container(
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(20.r),
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20.w),
        child: const Icon(
          CupertinoIcons.delete,
          color: Colors.white,
        ),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {},
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            color: AppColor.grey100,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Padding(
              padding: EdgeInsets.all(10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/shoes/jordan.png",
                    height: 88.h,
                    width: 88.w,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 15.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Jordan 1 Retro High Tie Dye",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 5.h),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Nike . ",
                        style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColor.grey400,
                        ),
                      ),
                      TextSpan(
                        text: 'Red Grey . ',
                        style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColor.grey400,
                        ),
                      ),
                      TextSpan(
                        text: '40',
                        style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColor.grey400,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Text(
                      '\$235.00',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    const Spacer(),
                    buildIconButton(
                      onPressed: () {
                        setState(() {
                          if (quantity > 1) {
                            quantity--;
                          }
                        });
                      },
                      icon: Icon(
                        Icons.remove,
                        size: 20.w,
                      ),
                    ),
                    SizedBox(width: 2.w,),
                    Text(
                      "$quantity",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(width: 2.w,),
                    buildIconButton(
                      onPressed: () {
                        setState(() {
                          quantity++;
                        });
                      },
                      icon: Icon(
                        Icons.add,
                        size: 20.w,
                        color: Colors.black,
                      ),
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

  IconButton buildIconButton({required VoidCallback onPressed, required Icon icon}) {
    return IconButton(
      icon: icon,
      onPressed: onPressed,
      iconSize: 20,
      color: quantity == 1 && icon.icon == Icons.remove ? Colors.grey : AppColor
          .primaryColor,
      style: IconButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: const Size(24, 24),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
            side: BorderSide(
              color: quantity == 1 && icon.icon == Icons.remove
                  ? Colors.grey
                  : AppColor.primaryColor,
              width: 1.5.w,
            )
        ),
      ),
    );
  }
}