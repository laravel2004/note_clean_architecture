import 'package:flutter/material.dart';
import 'package:mobile/features/idea/presentation/pages/idea.dart';
import 'package:mobile/features/idea/presentation/pages/lean_canvas.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key, required this.index});
  final int index;

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> with SingleTickerProviderStateMixin {

  late int _currentIndex;
  late PageController _pageController;

  final List<Widget> _children = [
    const IdeaPage(),
    const LeanCanvasPage(),
  ];

  @override
    void initState() {
    _currentIndex = widget.index;
    _pageController = PageController(initialPage: _currentIndex);
    super.initState();
  }

  void onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }


  void _onItemTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/add_idea');
        },
        child: Container(
          width: 60,
          height: 60,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [Colors.white, Color.fromRGBO(99, 205, 255, 1)],
            ),
          ),
          child: const Icon(
            Icons.add,
            size: 30,
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: const Color.fromRGBO(99, 205, 255, 1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            IconButton(
              icon: const Icon(
                Icons.list_alt_outlined,
                size: 30,
              ),
              onPressed: () {
                _onItemTapped(0);
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.bar_chart_outlined,
                size: 30,
              ),
              onPressed: () {
                _onItemTapped(1);
              },
            ),
          ],
        ), 
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: _children,
      ),
    );
  }
}