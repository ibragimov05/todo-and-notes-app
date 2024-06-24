import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:todo_and_notes/views/screens/home_screen/home_screen.dart';
import 'package:todo_and_notes/views/screens/note_screen/note_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentPage = 0;
  final List<Widget> _pages = const [
    HomeScreen(),
    NoteScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pages[_currentPage],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        items: const [
          Icon(
            Icons.task,
            color: Colors.black,
          ),
          Icon(
            Icons.note,
            color: Colors.black,
          ),
        ],
        // color: Colors.white,
        buttonBackgroundColor: Colors.blue,
        backgroundColor: Colors.blue,
        onTap: (value) {
          _currentPage = value;
          setState(() {});
        },
      ),
    );
  }
}
