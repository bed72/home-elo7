import 'package:elo7/widgets/featured_items_widget.dart';
import 'package:elo7/widgets/featured_widget.dart';
import 'package:elo7/widgets/horizontal_scrolling_widget.dart';
import 'package:elo7/widgets/recent_photo_large_widget.dart';
import 'package:elo7/widgets/recent_photo_small_widget.dart';
import 'package:elo7/widgets/recent_photos_widget.dart';
import 'package:flutter/material.dart';

import 'package:elo7/widgets/explore_widget.dart';

class InnerContentWidget extends StatelessWidget {
  const InnerContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const <Widget>[
        SizedBox(height: 16),
        ExploreWidget(),
        SizedBox(height: 16),
        HorizontallyScrollingWidget(),
        SizedBox(height: 24),
        FeaturedWidget(),
        SizedBox(height: 16),
        FeaturedItemsWidget(),
        SizedBox(height: 24),
        RecentPhotosWidget(),
        SizedBox(height: 16),
        RecentPhotoLargeWidget(),
        SizedBox(height: 12),
        RecentPhotosSmallWidget(),
        SizedBox(height: 16),
      ],
    );
  }
}
