import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoesly_app/core/themes/theme_export.dart';
import 'package:shoesly_app/core/widgets/build_button.dart';

class OrderSummaryPage extends StatelessWidget {
  const OrderSummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Jordan 1 Retro High Tie Dye",
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
                                  text: '40 . ',
                                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.grey400,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Qty 1',
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
                            '\$235.00',
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
                    "\$480.00",
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
                    "\$480.00",
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
                  /// Todo: place order logic
                },
                buttonWidget: Text("payment".toUpperCase()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
