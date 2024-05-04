



import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarouselIndicator extends StatefulWidget {
  final int currentIndex;
  final PageController carouselController;
  final List<String> carouselItems;

  const CarouselIndicator({
    super.key,
    required this.currentIndex,
    required this.carouselController,
    required this.carouselItems,
  });

  @override
  State<CarouselIndicator> createState() => _CarouselIndicatorState();
}

class _CarouselIndicatorState extends State<CarouselIndicator> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: widget.carouselItems.asMap().entries.map((entry) {
        return AnimatedContainer(
          curve: Curves.easeIn,
          duration: const Duration(milliseconds: 400),
          width: 7.w,
          height: widget.currentIndex == entry.key ? 7 : 7,
          margin: EdgeInsets.symmetric(horizontal: 4.w),
          decoration: BoxDecoration(
            color: widget.currentIndex == entry.key ?
            Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.onSurface,
            borderRadius: BorderRadius.circular(50),
          ),
        );
      }).toList(),
    );
  }
}