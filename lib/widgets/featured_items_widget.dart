import 'package:flutter/material.dart';

import 'package:elo7/widgets/featured_item_widget.dart';

class FeaturedItemsWidget extends StatelessWidget {
  const FeaturedItemsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        padding: const EdgeInsets.all(0),
        physics: const NeverScrollableScrollPhysics(),
        children: const <Widget>[
          FeaturedItemWidget(),
          FeaturedItemWidget(),
          FeaturedItemWidget(),
          FeaturedItemWidget(),
        ],
      ),
    );
  }
}
