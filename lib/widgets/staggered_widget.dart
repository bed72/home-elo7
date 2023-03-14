import 'package:flutter/material.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class StaggeredWidget extends StatelessWidget {
  const StaggeredWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: GridView.custom(
        physics: const ScrollPhysics(),
        scrollDirection: Axis.horizontal,
        gridDelegate: SliverQuiltedGridDelegate(
          crossAxisCount: 9,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          repeatPattern: QuiltedGridRepeatPattern.inverted,
          pattern: const [
            QuiltedGridTile(4, 6),
            QuiltedGridTile(4, 3),
            QuiltedGridTile(4, 3),
            QuiltedGridTile(4, 3),
            QuiltedGridTile(4, 3),
          ],
        ),
        childrenDelegate: SliverChildBuilderDelegate(
          childCount: 18,
          (context, index) => Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: Colors.grey[500],
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
    );
  }
}
