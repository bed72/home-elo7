import 'package:flutter/material.dart';

class FeaturedItemWidget extends StatelessWidget {
  const FeaturedItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.grey[500],
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
