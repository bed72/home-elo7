import 'package:flutter/material.dart';

import 'package:elo7/widgets/inner_content_widget.dart';
import 'package:elo7/widgets/scroll_view_content_widget.dart';
import 'package:flutter/services.dart';

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
  int _selectedIndex = 0;

  final _minChildSize = 0.08;
  final _maxChildSize = 1.00;

  final _tabs = <Tab>[
    const Tab(
      icon: Icon(
        Icons.add_circle_sharp,
        color: Colors.black26,
      ),
    ),
    const Tab(
      child: Text('explore o novo', style: TextStyle(color: Colors.black54)),
    ),
    const Tab(
      child: Text('casamento', style: TextStyle(color: Colors.black54)),
    ),
    const Tab(
      child: Text('festa & evento', style: TextStyle(color: Colors.black54)),
    ),
    const Tab(
      child: Text('maternidade', style: TextStyle(color: Colors.black54)),
    ),
    const Tab(
      child: Text('decoração', style: TextStyle(color: Colors.black54)),
    ),
    const Tab(
      child: Text('bebê & infantil', style: TextStyle(color: Colors.black54)),
    ),
    const Tab(
      child: Text('aniversário', style: TextStyle(color: Colors.black54)),
    ),
    const Tab(
      child: Text('Harry Potter', style: TextStyle(color: Colors.black54)),
    ),
  ];

  final _bottom = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      label: '',
      icon: const Icon(Icons.home),
      backgroundColor: Colors.grey[900],
    ),
    BottomNavigationBarItem(
      label: '',
      icon: const Icon(Icons.shopping_cart),
      backgroundColor: Colors.grey[900],
    ),
    BottomNavigationBarItem(
      label: '',
      icon: const Icon(Icons.message),
      backgroundColor: Colors.grey[900],
    ),
    BottomNavigationBarItem(
      label: '',
      icon: const Icon(Icons.favorite),
      backgroundColor: Colors.grey[900],
    ),
    BottomNavigationBarItem(
      label: '',
      icon: const Icon(Icons.menu),
      backgroundColor: Colors.grey[900],
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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.grey[900],
        leading: const Icon(Icons.camera_alt),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
        ),
        title: const Text(
          'Bed - 88521-300',
          style: TextStyle(fontSize: 14),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.search),
          )
        ],
      ),
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
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: CustomScrollView(
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
                        isScrollable: true,
                        controller: _tabController,
                        indicatorSize: TabBarIndicatorSize.label,
                        onTap: (_) => _openDraggable(to: _maxChildSize),
                        overlayColor: MaterialStateProperty.all<Color>(
                            Colors.transparent),
                      ),
                    ),
                    SliverFillRemaining(
                      child: TabBarView(
                        clipBehavior: Clip.antiAlias,
                        controller: _tabController,
                        children: const [
                          ScrollViewContentWidget(),
                          ScrollViewContentWidget(),
                          ScrollViewContentWidget(),
                          ScrollViewContentWidget(),
                          ScrollViewContentWidget(),
                          ScrollViewContentWidget(),
                          ScrollViewContentWidget(),
                          ScrollViewContentWidget(),
                          ScrollViewContentWidget(),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _bottom,
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[500],
      ),
    );
  }
}
