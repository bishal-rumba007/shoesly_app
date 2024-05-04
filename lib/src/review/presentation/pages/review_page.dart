
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoesly_app/src/discover/domain/models/shoe_model.dart';
import 'package:shoesly_app/src/discover/presentation/widgets/build_tab_bar.dart';
import 'package:shoesly_app/src/review/domain/model/review_model.dart';
import 'package:shoesly_app/src/review/presentation/widgets/review_card.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({super.key, required this.shoeModel});
  final ShoeModel shoeModel;

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> reviewHeader = ['All', '5 Stars', '4 Stars', '3 Stars', '2 Stars', '1 Stars'];

  late List<ReviewModel> reviews;

  @override
  void initState() {
    reviews = widget.shoeModel.reviews;
    _tabController = TabController(vsync: this, length: reviewHeader.length);
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Review (${reviews.length})",
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 30.w),
            child: Row(
              children: [
                const Icon(Icons.star_rounded, color: Colors.yellow),
                Text(
                  '${reviews.map((e) => e.rating).reduce((a, b) => a + b) / reviews.length}',
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
            tabBarItems: reviewHeader,
          ),
          SizedBox(height: 30.h,),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: TabBarView(
                controller: _tabController,
                children: reviewHeader.map(
                        (header) {
                          List<ReviewModel> filteredReview = header == 'All'
                              ? reviews
                              : reviews.where((review) => review.rating == int.parse(header[0])).toList();
                          return ListView.builder(
                            itemCount: filteredReview.length,
                            itemBuilder: (context, index) {
                              return ReviewCard(
                                reviewModel: filteredReview[index],
                              );
                            },
                          );
                        }
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
