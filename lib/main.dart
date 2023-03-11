import 'package:flutter/material.dart';

import 'package:elo7/widgets/inner_content_widget.dart';
import 'package:elo7/widgets/scroll_view_content_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    ),
  );
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _minChildSize = 0.20;
  final _maxChildSize = 0.96;

  late ScrollController _scrollViewController;
  late DraggableScrollableController _draggableScrollableController;

  @override
  void initState() {
    super.initState();

    _draggableScrollableController = DraggableScrollableController();
    _scrollViewController = ScrollController(initialScrollOffset: 0.0)
      ..addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollViewController.removeListener(_scrollListener);

    _scrollViewController.dispose();
    _draggableScrollableController.dispose();

    super.dispose();
  }

  void _scrollListener() {
    final value = _scrollViewController.position.extentAfter;

    if (value <= 10) {
      _draggableScrollableController.animateTo(
        0.60,
        curve: Curves.easeOutQuint,
        duration: const Duration(milliseconds: 1600),
      );
    } else {
      _draggableScrollableController.animateTo(
        _minChildSize,
        curve: Curves.easeOutQuint,
        duration: const Duration(milliseconds: 1600),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            controller: _scrollViewController,
            child: Container(
              margin: const EdgeInsets.only(top: 32, bottom: 200),
              child: const InnerContentWidget(),
            ),
          ),
          DraggableScrollableSheet(
            expand: true,
            minChildSize: _minChildSize,
            maxChildSize: _maxChildSize,
            initialChildSize: _minChildSize,
            controller: _draggableScrollableController,
            builder: (BuildContext context, ScrollController scrollController) {
              return SingleChildScrollView(
                controller: scrollController,
                child: const ScrollViewContentWidget(),
              );
            },
          ),
        ],
      ),
    );
  }
}
