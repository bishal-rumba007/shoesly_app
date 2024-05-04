import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shoesly_app/core/themes/theme_export.dart';
import 'package:shoesly_app/core/widgets/build_button.dart';
import 'package:shoesly_app/src/cart/domain/model/cart_model.dart';
import 'package:shoesly_app/src/cart/presentation/cubit/cart_cubit.dart';
import 'package:shoesly_app/src/cart/presentation/cubit/cart_state.dart';


class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  double totalPrice = 0.0;
  int quantity = 1;

  @override
  void initState() {
    super.initState();
    context.read<CartCubit>().loadCartItems();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return state.when(
            loading: () => const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
            loaded: (cartItems) {
              totalPrice = cartItems.fold(0.0, (previousValue, element) => previousValue + element.totalPrice);
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
                        cartItems.isEmpty ? Center(
                          child: Column(
                            children: [
                              SizedBox(height: 60.h,),
                              Text(
                                "Your cart is empty",
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 10.h,),
                              Text(
                                "Add items to your cart to get started",
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.grey400,
                                ),
                              ),
                              SizedBox(height: 30.h,),
                              BuildButton(
                                onPressed: () {
                                  context.go('/');
                                },
                                buttonWidget: Text("Start Shopping".toUpperCase()),
                              ),
                            ],
                          ),
                        ) : ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: cartItems.length,
                          itemBuilder: (context, index) {
                            return ProductCard(
                              cartItem: cartItems[index],
                            );
                          },
                          separatorBuilder: (_, __) => SizedBox(height: 30.h,),
                        ),
                      ],
                    ),
                  ),
                ),
                bottomSheet: cartItems.isEmpty ? const SizedBox() : Container(
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
                            '\$$totalPrice',
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
            },
            error: (message) => Center(
              child: Text(message),
            )
        );
      },
    );
  }
}

class ProductCard extends StatefulWidget {
  final CartModel cartItem;

  const ProductCard({super.key, required this.cartItem});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  late int quantity;

  @override
  void initState() {
    super.initState();
    quantity = widget.cartItem.quantity;
  }

  @override
  Widget build(BuildContext context) {
    final shoe = widget.cartItem.shoe;
    return Dismissible(
      key: Key(shoe.productId),
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
      onDismissed: (direction) {
        context.read<CartCubit>().removeCartItem(widget.cartItem);
        context.read<CartCubit>().loadCartItems();
      },
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
                  shoe.productName,
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
                        text: "${shoe.brandName} . ",
                        style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColor.grey400,
                        ),
                      ),
                      TextSpan(
                        text: '${widget.cartItem.selectedColor} . ',
                        style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColor.grey400,
                        ),
                      ),
                      TextSpan(
                        text: widget.cartItem.selectedSize,
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
                      '\$${shoe.price}',
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
                        context.read<CartCubit>().decrementQuantity(widget.cartItem);
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
                        context.read<CartCubit>().incrementQuantity(widget.cartItem);
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