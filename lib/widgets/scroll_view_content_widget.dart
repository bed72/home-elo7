import 'package:elo7/widgets/inner_content_widget.dart';
import 'package:flutter/material.dart';

class ScrollViewContentWidget extends StatelessWidget {
  const ScrollViewContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6.0,
      margin: const EdgeInsets.all(0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
        ),
        child: const InnerContentWidget(),
      ),
    );
  }
}
