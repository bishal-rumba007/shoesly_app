
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoesly_app/src/discover/presentation/widgets/build_tab_bar.dart';
import 'package:shoesly_app/src/review/presentation/widgets/review_card.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({super.key});

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> reviewHeader = ['All', '5 Stars', '4 Stars', '3 Stars', '2 Stars', '1 Stars'];

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: reviewHeader.length);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Review (1050)",
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 30.w),
            child: Row(
              children: [
                const Icon(Icons.star_rounded, color: Colors.yellow),
                Text(
                  '4.5',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.bold
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 20.h,),
          BuildTabBar(
            tabController: _tabController,
            brands: reviewHeader,
          ),
          SizedBox(height: 30.h,),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: TabBarView(
                controller: _tabController,
                children: reviewHeader.map(
                        (header) => const ReviewCard()
                ).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

}
