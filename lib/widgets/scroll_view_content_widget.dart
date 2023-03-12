import 'package:elo7/widgets/inner_content_widget.dart';
import 'package:flutter/material.dart';

class ScrollViewContentWidget extends StatelessWidget {
  const ScrollViewContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      elevation: 6.0,
      margin: EdgeInsets.all(0),
      child: InnerContentWidget(),
    );
  }
}
