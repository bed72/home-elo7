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

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final _minChildSize = 0.16;
  final _maxChildSize = 0.96;

  final _tabs = [
    const Tab(
      icon: Icon(
        Icons.dashboard,
        color: Colors.blueGrey,
      ),
    ),
    const Tab(
      icon: Icon(
        Icons.beach_access_sharp,
        color: Colors.blueGrey,
      ),
    ),
    const Tab(
      icon: Icon(
        Icons.notifications_active,
        color: Colors.blueGrey,
      ),
    ),
  ];

  late TabController _tabController;
  late ScrollController _scrollViewController;
  late DraggableScrollableController _draggableScrollableController;

  @override
  void initState() {
    super.initState();

    _draggableScrollableController = DraggableScrollableController();
    _tabController = TabController(vsync: this, length: _tabs.length);
    _scrollViewController = ScrollController(initialScrollOffset: 0.0)
      ..addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollViewController.removeListener(_scrollListener);

    _tabController.dispose();
    _scrollViewController.dispose();
    _draggableScrollableController.dispose();

    super.dispose();
  }

  void _scrollListener() {
    final value = _scrollViewController.position.extentAfter;

    if (value <= 10) {
      _openDraggable();
    } else {
      _closeDraggable();
    }
  }

  void _openDraggable({double to = 0.80}) {
    _draggableScrollableController.animateTo(
      to,
      curve: Curves.easeOutQuint,
      duration: const Duration(milliseconds: 1600),
    );
  }

  void _closeDraggable() {
    _draggableScrollableController.animateTo(
      _minChildSize,
      curve: Curves.easeOutQuint,
      duration: const Duration(milliseconds: 1600),
    );
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
              return CustomScrollView(
                controller: scrollController,
                slivers: [
                  SliverAppBar(
                    elevation: 0,
                    pinned: true,
                    floating: true,
                    toolbarHeight: 0,
                    backgroundColor: Colors.white,
                    shape: const ContinuousRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    bottom: TabBar(
                      tabs: _tabs,
                      controller: _tabController,
                      indicatorSize: TabBarIndicatorSize.label,
                      onTap: (_) => _openDraggable(to: _maxChildSize),
                      overlayColor:
                          MaterialStateProperty.all<Color>(Colors.transparent),
                    ),
                  ),
                  SliverFillRemaining(
                    child: TabBarView(
                      controller: _tabController,
                      children: const [
                        ScrollViewContentWidget(),
                        ScrollViewContentWidget(),
                        ScrollViewContentWidget(),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
