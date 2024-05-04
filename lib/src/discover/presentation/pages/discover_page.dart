import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shoesly_app/core/widgets/build_cart_button.dart';
import 'package:shoesly_app/shared/cubit/brand_cubit.dart';
import 'package:shoesly_app/shared/cubit/brand_state.dart';
import 'package:shoesly_app/src/discover/domain/models/shoe_model.dart';
import 'package:shoesly_app/src/discover/presentation/cubit/product_cubit.dart';
import 'package:shoesly_app/src/discover/presentation/cubit/product_state.dart';
import 'package:shoesly_app/src/discover/presentation/widgets/build_tab_bar.dart';
import 'package:shoesly_app/src/discover/presentation/widgets/shoe_card.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> with
SingleTickerProviderStateMixin{
  late TabController _tabController;
  List<String> brandList = ["All" ,"Nike", "Adidas", "Puma", "Reebok", "Jordan"];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 6);
    context.read<BrandCubit>().getBrands();
    context.read<ProductCubit>().getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Discover'),
          titleTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: 30.sp,
                fontWeight: FontWeight.bold,
              ),
          actions: const [
            BuildCartIconButton(),
          ],
        ),
        body: BlocBuilder<BrandCubit, BrandState>(
          builder: (context, state) {
            return NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    SliverPersistentHeader(
                      delegate: CustomSliverHeaderDelegate(
                        tabController: _tabController,
                        brandList: brandList,
                      ),
                      floating: true,
                      pinned: false,
                    ),
                  ];
                },
                body: BlocBuilder<ProductCubit, ProductState>(
                  builder: (context, state) {
                    return state.when(
                      initial: () => const SizedBox(),
                      loading: () => const Center(child: CircularProgressIndicator.adaptive(),),
                      loaded: (products) {
                        return TabBarView(
                          controller: _tabController,
                          children: brandList.map((brand) {
                            List<ShoeModel> filteredShoes = brand == 'All'
                                ? products
                                : products.where((shoe) => shoe.brandName == brand).toList();

                            return GridView.builder(
                              padding: EdgeInsets.only(left: 20.w, top: 10.h, right: 20.w),
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.65,
                                crossAxisSpacing: 15,
                              ),
                              itemCount: filteredShoes.length,
                              itemBuilder: (context, index) {
                                ShoeModel shoe = filteredShoes[index];
                                return ShoeCard(shoe: shoe);
                              },
                            );
                          }).toList(),
                        );
                      },
                      error: (error) => Center(child: Text(error)),
                    );
                  },
                )
            );
          },
        ),
        floatingActionButton: SizedBox(
          height: 40.h,
          child: FloatingActionButton.extended(
            onPressed: () {
              context.push('/filter');
            },
            label: Row(
              children: [
                Badge(
                  offset: const Offset(2, -1),
                  largeSize: 8,
                  label: const SizedBox(),
                  child: SvgPicture.asset("assets/icons/filter.svg"),
                ),
                SizedBox(width: 16.w),
                Text('Filter'.toUpperCase()),
              ],
            ),
            isExtended: true,
          ),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerFloat,
      );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}



class CustomSliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  final TabController tabController;
  final List<String> brandList;

  CustomSliverHeaderDelegate({required this.tabController, required this.brandList});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return BuildTabBar(
      tabController: tabController,
      tabBarItems: brandList,
    );
  }

  @override
  double get maxExtent => 48.0;

  @override
  double get minExtent => 48.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
