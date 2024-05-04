

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shoesly_app/core/themes/theme_export.dart';
import 'package:shoesly_app/core/widgets/build_button.dart';
import 'package:shoesly_app/src/discover/domain/entities/shoe_entity.dart';
import 'package:shoesly_app/src/discover/presentation/widgets/bottom_sheet_widget.dart';
import 'package:shoesly_app/src/discover/presentation/widgets/indicator.dart';
import 'package:shoesly_app/src/review/presentation/widgets/review_card.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key, required this.shoe});
  final Shoe shoe;

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {


  final PageController _pageController = PageController();
  int _currentPageIndex = 0;
  int _selectedColorIndex = 0;
  int _selectedSizeIndex = 0;

  Map<String, String> colors = {
    "Black": "0xFF000000",
    "Light Grey": "0xFFD3D3D3",
    "Light Blue": "0xFFB0C4DE",
    "Blue": "0xFF8A2BE2",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: SvgPicture.asset("assets/icons/cart.svg"),
            onPressed: () {
              context.push('/cart');
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: ListView(
          children: [
            SizedBox(height: 10.h,),
            buildShoeContainer(context),
            SizedBox(height: 30.h,),
            Text(
              "Jordan 1 Retro High Tie Dye",
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.h,),
            Row(
              children: [
                Row(
                  children: List.generate(5, (index) {
                    return const Icon(
                      Icons.star_rounded,
                      color: AppColor.brandYellow,
                      size: 16,
                    );
                  }),
                ),
                SizedBox(width: 5.w,),
                Row(
                  children: [
                    Text(
                      '4.5',
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '(1045 Reviews)',
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).colorScheme.onSurface
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 30.h,),
            Text(
              "Size",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 10.h,),
            Row(
              children: List.generate(4, (index) {
                return GestureDetector( // Wrap the Padding widget with GestureDetector to handle tap event
                  onTap: () {
                    setState(() {
                      _selectedSizeIndex = index; // Update the selected size index when a container is tapped
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.only(right: 10.w),
                    child: Container(
                      height: 40.h,
                      width: 40.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: _selectedSizeIndex == index ? Colors.black : Theme.of(context).colorScheme.background, // Change the background color to black if the container is selected
                        shape: BoxShape.circle,
                        border: index == _selectedSizeIndex ? const Border() : Border.all(
                          color: Theme.of(context).colorScheme.surface,
                          width: 1,
                        ),
                      ),
                      child: Text(
                        (index + 38).toString(),
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: _selectedSizeIndex == index ? Colors.white : Colors.black, // Change the text color to white if the container is selected
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
            SizedBox(height: 30.h,),
            Text(
              "Description",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 10.h,),
            Text(
              "Engineered to crush any movement-based workout, these On sneakers enhance the label's original Cloud sneaker with cutting edge technologies for a pair. ",
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColor.grey400,
              ),
            ),
            SizedBox(height: 30.h,),
            Text(
              "Review (1045)",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 10.h,),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 1,
              itemBuilder: (context, index) {
                return const ReviewCard();
              },
            ),
            SizedBox(height: 30.h,),
            BuildOutlinedButton(
              onPressed: (){
                context.push('/review');
              },
              buttonWidget: Text("see all review".toUpperCase()),
            ),
            SizedBox(height: 120.h,),
          ],
        ),
      ),
      bottomSheet: buildBottomContainer(context),
    );
  }

  /// Builds Container at the top of the page with shoe and page view along with color selection
  Container buildShoeContainer(BuildContext context) {
    return Container(
      height: 315.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 60.h,
          ),
          SizedBox(
            height: 178.5.h,
            width: 252.w,
            child: PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  _currentPageIndex = value;
                });
              },
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Hero(
                  tag: widget.shoe.id,
                  transitionOnUserGestures: true,
                  child: Image.asset(
                    "assets/shoes/jordan.png",
                    height: 178.5.h,
                    width: 252.w,
                    fit: BoxFit.contain,
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 17.2.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CarouselIndicator(
                  currentIndex: _currentPageIndex,
                  carouselController: _pageController,
                  carouselItems: List.generate(3, (index) => index.toString()),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Card(
                  elevation: 1.5,
                  color: Theme.of(context).colorScheme.surface,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 11.w),
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.background,
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    child: Row(
                      children: List.generate(colors.length, (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedColorIndex = index;
                            });
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.all(4.w),
                                height: 18.w,
                                width: 18.w,
                                decoration: BoxDecoration(
                                  color: Color(int.parse(colors.values
                                      .toList()[index]
                                      .replaceAll("#", "0xFF"))),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              if (_selectedColorIndex == index)
                                const Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 15,
                                ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Builds the bottom container with price and add to cart button
  Container buildBottomContainer(BuildContext context) {
    return Container(
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
                'Price',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColor.grey200,
                    ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                '\$235.00',
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
                buildBottomSheet(context);
              },
              buttonWidget: Text("Add to Cart".toUpperCase()),
            ),
          ),
        ],
      ),
    );
  }


  /// Builds the bottom sheet with quantity and total price
  Future<dynamic> buildBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      showDragHandle: true,
      isScrollControlled: true,
      context: context,
      enableDrag: true,
      builder: (context) {
       return BottomSheetWidget(
          onAddToCart: (value) {
            /// Todo: Add to cart logic here
            Navigator.pop(context);
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return SuccessBottomSheet(
                  totalItem: value,
                );
              },
            );
          },
        );
      },
    );
  }

}
