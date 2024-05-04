
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shoesly_app/src/discover/domain/models/shoe_model.dart';


class ShoeCard extends StatelessWidget {
  final ShoeModel shoe;

  const ShoeCard({super.key, required this.shoe});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/product-detail', extra: shoe);
      },
      child: SizedBox(
        width: 150.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 22.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset("assets/icons/nike.svg"),
                    Hero(
                      tag: shoe.productId,
                      transitionOnUserGestures: true,
                      child: shoe.imageUrl.isEmpty ? Image.asset(
                         "assets/shoes/jordan.png",
                        height: 85.h,
                        width: 120.w,
                        fit: BoxFit.contain,
                      ) : Image.network(
                        shoe.imageUrl,
                        height: 85.h,
                        width: 120.w,
                        fit: BoxFit.contain,
                      )
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10.h,),
            Text(
                shoe.productName,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                )
            ),
            SizedBox(height: 5.h,),
            Row(
              children: [
                const Icon(
                  Icons.star_rounded,
                  color: Colors.amber,
                  size: 20,
                ),
                SizedBox(width: 4.w),
                Text(
                  shoe.averageRating,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '(${shoe.reviews.length} reviews)',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).colorScheme.onSurface
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.h),
            Text(
                '\$${shoe.price}',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
            ),
          ],
        ),
      ),
    );
  }
}