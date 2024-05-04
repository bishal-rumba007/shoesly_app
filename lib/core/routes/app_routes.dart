



import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shoesly_app/src/cart/presentation/pages/cart_page.dart';
import 'package:shoesly_app/src/discover/domain/entities/shoe_entity.dart';
import 'package:shoesly_app/src/discover/presentation/pages/discover_page.dart';
import 'package:shoesly_app/src/discover/presentation/pages/filter_page.dart';
import 'package:shoesly_app/src/discover/presentation/pages/product_detail_page.dart';
import 'package:shoesly_app/src/order/presentation/pages/order_summary_page.dart';
import 'package:shoesly_app/src/review/presentation/pages/review_page.dart';


class AppRoutes {

  final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) =>
        const MaterialPage(child: DiscoverPage()),
      ),
      GoRoute(
        path: '/product-detail',
        pageBuilder: (context, state) {
          final shoe = state.extra as Shoe;
          return MaterialPage(
            child: ProductDetailPage(shoe: shoe),
          );
        },
      ),
      GoRoute(
        path: '/filter',
        pageBuilder: (context, state) =>
        const MaterialPage(child: FilterPage()),
      ),
      GoRoute(
        path: '/cart',
        pageBuilder: (context, state) =>
        const MaterialPage(child: CartPage()),
      ),
      GoRoute(
        path: '/order-summary',
        pageBuilder: (context, state) =>
        const MaterialPage(child: OrderSummaryPage()),
      ),
      GoRoute(
        path: '/review',
        pageBuilder: (context, state) =>
        const MaterialPage(child: ReviewPage()),
      ),
    ],
    errorPageBuilder: (context, state) => MaterialPage<void>(
      child: Scaffold(
        body: Center(
          child: Text('Page not found: ${state.error}'),
        ),
      ),
    ),
  );
}