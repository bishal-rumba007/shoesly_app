import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shoesly_app/src/discover/domain/entities/shoe_entity.dart';
import 'package:shoesly_app/src/discover/presentation/widgets/build_tab_bar.dart';
import 'package:shoesly_app/src/discover/presentation/widgets/shoe_card.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> brands = ['All', 'Nike', 'Jordan', 'Adidas', 'Reebok', 'Puma'];
  final List<Shoe> allShoes = [...dummyShoes]; // Replace with your actual data

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: brands.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Discover'),
        titleTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
          color: Colors.black,
          fontSize: 30.sp,
          fontWeight: FontWeight.bold,
          fontFamily: 'Urbanist',
        ),
        actions: [
          Badge(
            offset: const Offset(-12, 15),
            largeSize: 8,
            label: const SizedBox(),
            child: IconButton(
              icon: SvgPicture.asset("assets/icons/cart.svg"),
              onPressed: () {
               /// Todo: Navigate to Cart page
              },
            ),
          ),
        ],
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverPersistentHeader(
              delegate: CustomSliverHeaderDelegate(
                tabController: _tabController,
                brands: brands,
              ),
              pinned: false,
              floating: true,
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: brands.map((brand) {
            List<Shoe> filteredShoes = brand == 'All'
                ? allShoes
                : allShoes.where((shoe) => shoe.brand == brand).toList();

            return GridView.builder(
              padding: EdgeInsets.only(left: 20.w, top: 10.h, right: 20.w),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.65,
                crossAxisSpacing: 15,
              ),
              itemCount: filteredShoes.length,
              itemBuilder: (context, index) {
                Shoe shoe = filteredShoes[index];
                return ShoeCard(shoe: shoe);
              },
            );
          }).toList(),
        ),
      ),
      floatingActionButton: SizedBox(
        height: 40.h,
        child: FloatingActionButton.extended(
          onPressed: () {},
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class CustomSliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  final TabController tabController;
  final List<String> brands;

  CustomSliverHeaderDelegate({required this.tabController, required this.brands});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return BuildTabBar(tabController: tabController, brands: brands);
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



