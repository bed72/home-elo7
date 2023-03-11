import 'package:flutter/material.dart';

import 'package:elo7/widgets/featured_item_widget.dart';

class RecentPhotoLargeWidget extends StatelessWidget {
  const RecentPhotoLargeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: FeaturedItemWidget(),
    );
  }
}
