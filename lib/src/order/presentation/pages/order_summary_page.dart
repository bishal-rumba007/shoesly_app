import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shoesly_app/core/themes/theme_export.dart';
import 'package:shoesly_app/core/widgets/build_button.dart';
import 'package:shoesly_app/src/cart/presentation/cubit/cart_cubit.dart';
import 'package:shoesly_app/src/cart/presentation/cubit/cart_state.dart';

class OrderSummaryPage extends StatelessWidget {
  const OrderSummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return state.when(
          loading: () => const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
          loaded: (cartItems) {
            final totalPrice = cartItems.fold<double>(
              0,
              (previousValue, element) => previousValue + num.parse(element.shoe.price) * element.quantity,
            );
            return Scaffold(
              appBar: AppBar(
                title: const Text('Order Summary'),
              ),
              body: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30.w,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30.h,
                      ),
                      Text(
                        'Information',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        "Payment Method",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.grey.shade600,
                            size: 16,
                          ),
                        ],
                      ),
                      Text(
                        "Credit Card",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColor.grey400,
                        ),
                      ),
                      SizedBox(height: 15.h),
                      const Divider(color: Colors.black, thickness: 0.1),
                      SizedBox(height: 15.h),
                      Text(
                        "Location",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.grey.shade500,
                            size: 16,
                          ),
                        ],
                      ),
                      Text(
                        "Semarang, Indonasia",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColor.grey400,
                        ),
                      ),
                      SizedBox(height: 30.h),
                      Text(
                        'Order Detail',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: cartItems.length,
                        itemBuilder: (context, index) {
                          final cartItem = cartItems[index];
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cartItem.shoe.productName,
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 5.h),
                              Row(
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "${cartItem.shoe.brandName} . ",
                                          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                                            fontWeight: FontWeight.w400,
                                            color: AppColor.grey400,
                                          ),
                                        ),
                                        TextSpan(
                                          text: '${cartItem.selectedColor} . ',
                                          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                                            fontWeight: FontWeight.w400,
                                            color: AppColor.grey400,
                                          ),
                                        ),
                                        TextSpan(
                                          text: '${cartItem.selectedSize} . ',
                                          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                                            fontWeight: FontWeight.w400,
                                            color: AppColor.grey400,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'Qty ${cartItem.quantity}',
                                          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                                            fontWeight: FontWeight.w400,
                                            color: AppColor.grey400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    '\$${cartItem.shoe.price}',
                                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                        separatorBuilder: (__, _) => SizedBox(
                          height: 20.h,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        "Payment Detail",
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        children: [
                          Text(
                              "Subtotal",
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: AppColor.grey400,
                              )
                          ),
                          const Spacer(),
                          Text(
                            "\$$totalPrice",
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        children: [
                          Text(
                              "Shipping",
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: AppColor.grey400,
                              )
                          ),
                          const Spacer(),
                          Text(
                            "\$20.00",
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      const Divider(color: Colors.black, thickness: 0.1),
                      SizedBox(height: 10.h),
                      Row(
                        children: [
                          Text(
                              "Total Order",
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: AppColor.grey400,
                              )
                          ),
                          const Spacer(),
                          Text(
                            "\$${totalPrice + 20}",
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 60.h),
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
                          '\$${totalPrice + 20}',
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
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Container(
                                padding: EdgeInsets.all(30.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      height: 100.h,
                                      width: 100.w,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: AppColor.primaryColor,
                                            width: 3,
                                            strokeAlign: BorderSide.strokeAlignCenter,
                                          )
                                      ),
                                      child: const Center(
                                        child: Icon(Icons.check, size: 50, color: AppColor.grey300,),
                                      ),
                                    ),
                                    SizedBox(height: 20.h,),
                                    Text(
                                      'Order Placed!!',
                                      style: Theme.of(context).textTheme.titleLarge,
                                    ),
                                    SizedBox(height: 5.h,),
                                    Text(
                                      "${cartItems.length} Item Total",
                                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                        color: AppColor.grey300,
                                      ),
                                    ),
                                    SizedBox(height: 20.h,),
                                    BuildButton(
                                      onPressed: () {
                                        context.read<CartCubit>().clearCart();
                                        Navigator.pop(context);
                                        context.go('/');
                                      },
                                      buttonWidget: Text("back explore".toUpperCase()),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        buttonWidget: Text("payment".toUpperCase()),
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
