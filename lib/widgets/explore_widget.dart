import 'package:flutter/material.dart';

class ExploreWidget extends StatelessWidget {
  const ExploreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const <Widget>[
        Text(
          'Explore',
          style: TextStyle(fontSize: 22, color: Colors.black45),
        ),
      ],
    );
  }
}
