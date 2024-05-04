


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoesly_app/core/themes/theme_export.dart';
import 'package:shoesly_app/src/review/domain/model/review_model.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key, required this.reviewModel});
  final ReviewModel reviewModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 95.h,
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 20.r,
          ),
          SizedBox(width: 15.w,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      reviewModel.userName,
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Today",
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColor.grey300,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5.h,),
                Row(
                  children: [
                    Row(
                      children: List.generate(
                        reviewModel.rating.ceil(),
                            (index) => const Icon(
                          Icons.star_rate_rounded,
                          color: AppColor.brandYellow,
                        ),
                      ),
                    ),
                    if (reviewModel.rating % 1 != 0)
                      const Icon(
                        Icons.star_half_rounded,
                        color: AppColor.brandYellow,
                      ),
                    Row(
                      children: List.generate(
                        5 - reviewModel.rating.ceil(),
                            (index) => const Icon(
                          Icons.star_border_rounded,
                          color: AppColor.grey300,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h,),
                Text(
                  reviewModel.review,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColor.grey400,
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}