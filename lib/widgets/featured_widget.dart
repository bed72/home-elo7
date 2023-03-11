import 'package:flutter/material.dart';

class FeaturedWidget extends StatelessWidget {
  const FeaturedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Row(
        children: const <Widget>[
          Text('Featured', style: TextStyle(fontSize: 14))
        ],
      ),
    );
  }
}
