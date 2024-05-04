import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoesly_app/core/routes/app_routes.dart';
import 'package:shoesly_app/core/themes/theme.dart';
import 'package:shoesly_app/shared/cubit/brand_cubit.dart';
import 'package:shoesly_app/shared/data/datasource/brand_datasource.dart';
import 'package:shoesly_app/shared/data/repositories/brand_repository_impl.dart';
import 'package:shoesly_app/shared/domain/usecase/brand_usecase.dart';
import 'package:shoesly_app/src/cart/data/datasource/cart_datasource.dart';
import 'package:shoesly_app/src/cart/data/repositories/cart_repositories_impl.dart';
import 'package:shoesly_app/src/cart/presentation/cubit/cart_cubit.dart';
import 'package:shoesly_app/src/discover/data/datasource/product_datasource.dart';
import 'package:shoesly_app/src/discover/data/repositories/product_repository_impl.dart';
import 'package:shoesly_app/src/discover/domain/repositories/product_repository.dart';
import 'package:shoesly_app/src/discover/domain/usecase/product_usecase.dart';
import 'package:shoesly_app/src/discover/presentation/cubit/product_cubit.dart';
import 'package:shoesly_app/src/review/data/datasource/review_datasource.dart';
import 'package:shoesly_app/src/review/data/repositories/review_repository_impl.dart';
import 'package:shoesly_app/src/review/domain/usecase/review_usecase.dart';
import 'package:shoesly_app/src/review/presentation/cubit/review_cubit.dart';


class MainApp extends StatelessWidget {
  MainApp({super.key});

  final appRouter = AppRoutes();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BrandCubit(
            GetBrandsUseCase(
              BrandRepositoryImpl(
                BrandDataSourceImpl(),
              ),
            ),
          ),
        ),
        RepositoryProvider<ProductRepository>(create: (context) => ProductRepositoryImpl(productDataSource: ProductDataSourceImpl())),
        RepositoryProvider<GetProductUseCase>(
          create: (context) => GetProductUseCase(context.read<ProductRepository>()),
        ),
        BlocProvider(
          create: (context) => ProductCubit(
            context.read<GetProductUseCase>(),
          ),
        ),
        BlocProvider(
            create: (context) => CartCubit(cartRepository: CartRepositoryImpl(cartDataSource: CartDataSource())
            ),
        ),
        BlocProvider(
          create: (context) => ReviewCubit(
              getReviewUseCase: GetReviewsUsecase(
                reviewRepository: ReviewRepositoryImpl(
                  reviewDataSource: ReviewDataSourceImpl()
                ),
              )
          )
        ),
      ],
      child: MaterialApp.router(
        routeInformationProvider: appRouter.router.routeInformationProvider,
        routerDelegate: appRouter.router.routerDelegate,
        routeInformationParser: appRouter.router.routeInformationParser,
        title: 'Shoes Market Place',
        debugShowCheckedModeBanner: false,
        builder: (context, child) {
          ScreenUtil.init(context, designSize: const Size(375, 812));
          return Theme(
            data: lightMode,
            child: child!,
          );
        },
      ),
    );
  }
}


