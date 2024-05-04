import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoesly_app/core/themes/theme_export.dart';


class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {

  String selectedBrand = "";
  RangeValues selectedPriceRange = const RangeValues(200, 750);
  List<String> selectedSortOptions = [];
  List<String> selectedColors = [];


  // Reset all filters to default state
  void resetFilters() {
    setState(() {
      selectedBrand = "";
      selectedPriceRange = const RangeValues(200, 750);
      selectedSortOptions.clear();
      selectedColors.clear();
    });
  }

  // Get selected filter values
  Map<String, dynamic> getSelectedFilters() {
    return {
      'brand': selectedBrand,
      'priceRange': selectedPriceRange,
      'sortOption': selectedSortOptions,
      'color': selectedColors,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter'),
      ),
      body: Column(
        children: [
          BrandFilter(
              selectedBrand: selectedBrand,
              onSelectBrand: (brand) {
                setState(() {
                  selectedBrand = brand;
                });
          }),
          SizedBox(height: 30.h,),
          const PriceRangeFilter(),
          SizedBox(height: 30.h,),
          const SortByFilter(
            title: 'Sort By',
            sortOptions: [
              'Most Recent',
              'Lowest price',
              'Highest price',
              'Popularity',
            ],
          ),
          SizedBox(height: 30.h,),
          const SortByFilter(
            title: 'Gender',
            sortOptions: [
              "Male",
              "Female",
              "Unisex"
            ],
          ),
          SizedBox(height: 30.h,),
          const ColorFilter(),
        ],
      ),
      bottomSheet: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
        height: 90.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFD7D7D7).withOpacity(0.2),
              blurRadius: 30,
              offset: const Offset(0, -20),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () {},
                child: Text(
                  'Reset (4)'.toUpperCase(),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColor.primaryColor,
                  ),
                ),
              ),
            ),
            SizedBox(width: 20.w,),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Apply'.toUpperCase(),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}

class BrandFilter extends StatefulWidget {
  const BrandFilter({
    super.key,
    required this.selectedBrand,
    required this.onSelectBrand,
  });

  final String selectedBrand;
  final Function(String) onSelectBrand;

  @override
  State<BrandFilter> createState() => _BrandFilterState();
}
class _BrandFilterState extends State<BrandFilter> {
  int _selectedBrand = 0;

  final List<String> brands = [
    'Nike',
    'Adidas',
    'Puma',
    'Reebok',
    'Jordan',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 30.w),
          child: Text(
            'Brands',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(height: 20.h,),
        SizedBox(
          height: 97.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: brands.length,
            itemBuilder: (context, index) {
              final isSelected = widget.selectedBrand.contains(brands[index]);
              return GestureDetector(
                onTap: () {
                  setState(() {
                    if (isSelected) {
                      _selectedBrand = -1;
                      widget.onSelectBrand("");
                    } else {
                      widget.onSelectBrand(brands[_selectedBrand]);
                      _selectedBrand = index;
                    }
                  });
                },
                child: Container(
                  margin: index == 0 ? EdgeInsets.only(left: 30.w) : index == 7 ? EdgeInsets.only(right: 30.w) : null,
                  height: 97.h,
                  width: 72.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 50.h,
                        width: 50.h,
                        child: Stack(
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundColor: AppColor.grey200,
                              child: SvgPicture.asset(
                                'assets/icons/nike.svg',
                              )
                            ),
                            if(_selectedBrand == index)
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  height: 20.h,
                                  width: 20.h,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  child: Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: 15.sp,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.h,),
                      Text(
                        brands[index],
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "1001 items",
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: AppColor.grey300,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(width: 10.w,);
            },
          ),
        ),
      ],
    );
  }
}

class PriceRangeFilter extends StatefulWidget {
  const PriceRangeFilter({super.key});

  @override
  State<PriceRangeFilter> createState() => _PriceRangeFilterState();
}
class _PriceRangeFilterState extends State<PriceRangeFilter> {
  RangeValues _currentRangeValues = const RangeValues(200, 750);
  @override
  Widget build(BuildContext context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 30.w),
            child: Text(
              'Price Range',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: 20.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: RangeSlider(
              values: _currentRangeValues,
              min: 0,
              max: 1750,
              labels: RangeLabels(
                '\$${_currentRangeValues.start.round()}',
                '\$${_currentRangeValues.end.round()}',
              ),
              activeColor: Colors.black,
              inactiveColor: Colors.grey[300],
              onChanged: (values) {
                setState(() {
                  _currentRangeValues = values;
                });
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$0',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: AppColor.grey300,
                    fontWeight: FontWeight.bold,
                  )
                ),
                Text(
                  '\$1750',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: AppColor.grey300,
                      fontWeight: FontWeight.bold,
                    )
                ),
              ],
            ),
          ),
        ],
      );
  }
}


class SortByFilter extends StatefulWidget {
  const SortByFilter({super.key, required this.title, required this.sortOptions});
  final String title;
  final List<String> sortOptions;

  @override
  State<SortByFilter> createState() => _SortByFilterState();
}

class _SortByFilterState extends State<SortByFilter> {
  int _selectedSort = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 30.w),
          child: Text(
            widget.title,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(height: 20.h,),
        SizedBox(
          height: 40.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: widget.sortOptions.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedSort = index;
                  });
                },
                child: Container(
                  margin: index == 0 ? EdgeInsets.only(left: 30.w) : index == widget.sortOptions.length - 1 ? EdgeInsets.only(right: 30.w) : null,
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 7.h),
                  decoration: BoxDecoration(
                    color: _selectedSort == index ? AppColor.primaryColor : Colors.white,
                    borderRadius: BorderRadius.circular(20.r),
                    border: Border.all(
                      color: _selectedSort == index ? AppColor.primaryColor : AppColor.grey200,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      widget.sortOptions[index],
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: _selectedSort == index ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (_, __) => SizedBox(width: 10.w,),
          ),
        )
      ],
    );
  }
}


class ColorFilter extends StatefulWidget {
  const ColorFilter({super.key});

  @override
  State<ColorFilter> createState() => _ColorFilterState();
}

class _ColorFilterState extends State<ColorFilter> {

  Map<String, String> colors = {
    'Black': "0xFF000000",
    'White': "0xFFFFFFFF",
    'Red': "0xFFD32F2F",
    'Blue': "0xFF1976D2",
  };

  int _selectedSort = 0;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 30.w),
          child: Text(
            "Color",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(height: 20.h,),
        SizedBox(
          height: 40.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: colors.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedSort = index;
                  });
                },
                child: Container(
                  margin: index == 0 ? EdgeInsets.only(left: 30.w) : index == colors.length - 1 ? EdgeInsets.only(right: 30.w) : null,
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 7.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.r),
                    border: Border.all(
                      color: _selectedSort == index ? AppColor.primaryColor : AppColor.grey200,
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 20.h,
                        width: 20.h,
                        decoration: BoxDecoration(
                          color: Color(int.parse(colors.values.elementAt(index))),
                          borderRadius: BorderRadius.circular(10.r),
                          border: colors.keys.elementAt(index) == "White" ? Border.all(
                            color: AppColor.grey200,
                          ) : const Border(),
                        ),
                      ),
                      SizedBox(width: 10.w,),
                      Text(
                        colors.keys.elementAt(index),
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (_, __) => SizedBox(width: 10.w,),
          ),
        )
      ],
    );
  }
}
