import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shoesly_app/src/cart/presentation/cubit/cart_cubit.dart';
import 'package:shoesly_app/src/cart/presentation/cubit/cart_state.dart';

class BuildCartIconButton extends StatelessWidget {
  const BuildCartIconButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          error: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message),
                backgroundColor: Colors.red,
              ),
            );
          },
        );

      },
      buildWhen: (previous, current) {
        return previous != current;
      },
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => IconButton(
            icon: SvgPicture.asset("assets/icons/cart.svg"),
            onPressed: () {
              context.push('/cart');
            },
          ),
          loaded: (cartItems) => cartItems.isNotEmpty
              ? Badge(
                  offset: const Offset(-12, 15),
                  largeSize: 8,
                  label: const SizedBox(),
                  child: IconButton(
                    icon: SvgPicture.asset("assets/icons/cart.svg"),
                    onPressed: () {
                      context.push('/cart');
                    },
                  ),
                )
              : IconButton(
                  icon: SvgPicture.asset("assets/icons/cart.svg"),
                  onPressed: () {
                    context.push('/cart');
                  },
                ),
        );
      },
    );
  }
}
