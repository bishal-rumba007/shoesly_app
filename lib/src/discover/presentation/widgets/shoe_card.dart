
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoesly_app/core/themes/theme_export.dart';
import 'package:shoesly_app/src/discover/domain/entities/shoe_entity.dart';


class ShoeCard extends StatelessWidget {
  final Shoe shoe;

  const ShoeCard({super.key, required this.shoe});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                  Image.asset(
                    "assets/shoes/jordan.png",
                    height: 85.h,
                    width: 120.w,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10.h,),
          Text(
              shoe.name,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: Colors.black,
                fontFamily: 'Urbanist',
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
                '${shoe.rating}',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: 'Urbanist',
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '(${shoe.numReviews} reviews)',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColor.grey300,
                  fontFamily: 'Urbanist',
                ),
              ),
            ],
          ),
          SizedBox(height: 5.h),
          Text(
              '\$${shoe.price.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: 'Urbanist',
              )
          ),
        ],
      ),
    );
  }
}