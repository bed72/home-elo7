import 'package:flutter/material.dart';

import 'package:elo7/widgets/category_widget.dart';

class HorizontallyScrollingWidget extends StatelessWidget {
  const HorizontallyScrollingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          SizedBox(width: 16),
          CategoryWidget(),
          SizedBox(width: 12),
          CategoryWidget(),
          SizedBox(width: 12),
          CategoryWidget(),
          SizedBox(width: 12),
          CategoryWidget(),
          SizedBox(width: 12),
        ],
      ),
    );
  }
}
