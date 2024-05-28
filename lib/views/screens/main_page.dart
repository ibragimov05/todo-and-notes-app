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

  void _onButtonTapped(int index) {
    _currentPage = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pages[_currentPage],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.task), label: 'ToDo'),
          BottomNavigationBarItem(icon: Icon(Icons.note), label: 'Note'),
        ],
        currentIndex: _currentPage,
        onTap: _onButtonTapped,
      ),
    );
  }
}
