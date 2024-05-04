import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shoesly_app/core/themes/theme_export.dart';
import 'package:shoesly_app/core/widgets/build_button.dart';
import 'package:shoesly_app/src/discover/domain/models/shoe_model.dart';

class BottomSheetWidget extends StatefulWidget {
  const BottomSheetWidget({super.key, required this.onAddToCart, required this.shoeModel});
  final Function(int) onAddToCart;
  final ShoeModel shoeModel;

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  final TextEditingController _controller = TextEditingController();
  int _quantity = 1;


  @override
  void initState() {
    _controller.addListener(() {
      if (_controller.text.isNotEmpty) {
        setState(() {
          _quantity = int.parse(_controller.text);
        });
      }
    });
    super.initState();
  }

  void _add() {
    setState(() {
      _quantity++;
      _controller.text = _quantity.toString();
    });
  }

  void _remove() {
    if (_quantity > 1) {
      setState(() {
        _quantity--;
      });
      _controller.text = _quantity.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Add to cart',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.black,),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            SizedBox(height: 30.h,),
            Text(
              'Quantity',
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              controller: _controller,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: InputDecoration(
                hintText: '1',
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    buildIconButton(
                          (){
                        _remove();
                      },
                      const Icon(Icons.remove),
                    ),
                    buildIconButton(
                          (){
                        _add();
                      },
                      const Icon(Icons.add,),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total Price',
                        style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColor.grey300,
                        ),
                      ),
                      SizedBox(height: 5.h,),
                      Text(
                        '\$${double.parse(widget.shoeModel.price) * _quantity}',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 65.w,),
                SizedBox(
                  width: 167.w,
                  child: BuildButton(
                    onPressed: () {
                      widget.onAddToCart(_quantity);
                    },
                    buttonWidget: Text("Add to Cart".toUpperCase()),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h,),
          ],
        ),
      ),
    );
  }

  IconButton buildIconButton(VoidCallback onPressed, Icon icon) {
    return IconButton(
      icon: icon,
      onPressed: onPressed,
      iconSize: 20,
      color: _quantity == 1 && icon.icon == Icons.remove ? Colors.grey : AppColor.primaryColor,
      style: IconButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: const Size(24, 24),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
            side: BorderSide(
              color: _quantity == 1 && icon.icon == Icons.remove ? Colors.grey : AppColor.primaryColor,
              width: 1.5.w,
            )
        ),
      ),
    );
  }
}




class SuccessBottomSheet extends StatefulWidget {
  const SuccessBottomSheet({super.key, required this.totalItem});
  final int totalItem;

  @override
  State<SuccessBottomSheet> createState() => _SuccessBottomSheetState();
}

class _SuccessBottomSheetState extends State<SuccessBottomSheet> {
  @override
  Widget build(BuildContext context) {
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
            'Added to cart',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(height: 5.h,),
          Text(
            "${widget.totalItem} Item Total",
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: AppColor.grey300,
            ),
          ),
          SizedBox(height: 20.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             Expanded(
               child: BuildOutlinedButton(
                 onPressed: (){
                   Navigator.pop(context);
                   context.go("/");
                 },
                 buttonWidget: Text("Back explore".toUpperCase()),
               ),
             ),
              SizedBox(width: 15.w,),
              Expanded(
                child: BuildButton(
                  onPressed: () {
                    Navigator.pop(context);
                    context.push('/cart');
                  },
                  buttonWidget: Text("to cart".toUpperCase()),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
