import 'package:flutter/material.dart';

class RecentPhotosWidget extends StatelessWidget {
  const RecentPhotosWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Row(
        children: const <Widget>[
          Text('Photos', style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
