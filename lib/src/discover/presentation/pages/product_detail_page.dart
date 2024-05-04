

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shoesly_app/core/themes/theme_export.dart';
import 'package:shoesly_app/core/widgets/build_button.dart';
import 'package:shoesly_app/core/widgets/build_cart_button.dart';
import 'package:shoesly_app/src/cart/domain/model/cart_model.dart';
import 'package:shoesly_app/src/cart/presentation/cubit/cart_cubit.dart';
import 'package:shoesly_app/src/discover/domain/models/shoe_model.dart';
import 'package:shoesly_app/src/discover/presentation/widgets/bottom_sheet_widget.dart';
import 'package:shoesly_app/src/discover/presentation/widgets/indicator.dart';
import 'package:shoesly_app/src/review/presentation/widgets/review_card.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key, required this.shoe});
  final ShoeModel shoe;

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {


  final PageController _pageController = PageController();
  int _currentPageIndex = 0;
  int _selectedColorIndex = 0;
  int _selectedSizeIndex = 0;

  late Map<String, String> colors;

  @override
  void initState() {
    colors = widget.shoe.colors;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
         BuildCartIconButton()
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
              widget.shoe.productName,
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
                      widget.shoe.averageRating,
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "(${widget.shoe.reviews.length} reviews)",
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
              children: List.generate(widget.shoe.sizes.length, (index) {
                return GestureDetector(
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
                        widget.shoe.sizes[index],
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
              widget.shoe.description,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColor.grey400,
              ),
            ),
            SizedBox(height: 30.h,),
            Text(
              "Review (${widget.shoe.reviews.length})",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 10.h,),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.shoe.reviews.length >= 3 ? 3 : widget.shoe.reviews.length,
              itemBuilder: (context, index) {
                return ReviewCard(
                  reviewModel: widget.shoe.reviews[index],
                );
              },
            ),
            SizedBox(height: 30.h,),
            widget.shoe.reviews.length >= 3 ? BuildOutlinedButton(
              onPressed: (){
                context.push('/review', extra: widget.shoe);
              },
              buttonWidget: Text("see all review".toUpperCase()),
            ) : const SizedBox(),
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
                  tag: widget.shoe.productId,
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
                        bool isWhite = colors.values.toList()[index] == "0xFFFFFFFF";
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
                                  color: Color(int.parse(colors.values.toList()[index].replaceAll("#", "0xFF"))),
                                  shape: BoxShape.circle,
                                  border: isWhite
                                      ? Border.all(color: Colors.grey, width: 1.0)
                                      : Border.all(color: Colors.transparent),
                                ),
                              ),
                              if (_selectedColorIndex == index)
                                Icon(
                                  Icons.check,
                                  color: isWhite ? Colors.black : Colors.white,
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
         shoeModel: widget.shoe,
          onAddToCart: (value) {
            final cartCubit = context.read<CartCubit>();
            CartModel cartModel = CartModel(
              shoe: widget.shoe,
              selectedColor: colors.keys.toList()[_selectedColorIndex],
              selectedSize: widget.shoe.sizes[_selectedSizeIndex],
              totalPrice: double.parse(widget.shoe.price) * value,
              quantity: value,
            );
            cartCubit.addCartItem(
              cartModel
            );
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
