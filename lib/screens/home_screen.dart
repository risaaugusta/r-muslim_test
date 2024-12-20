import 'package:flutter/material.dart';
import 'package:r_muslim/screens/doa_screen.dart';
import 'package:r_muslim/screens/ebooks_screen_draft.dart';
import 'package:r_muslim/screens/surah_screen.dart';
import 'package:r_muslim/screens/videos_screen.dart';
import 'package:r_muslim/style/style.dart'; 
import 'package:flutter_svg/flutter_svg.dart';  
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<String> _titles = ['Qur\'an', 'Doa', 'Ebooks', 'Video'];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, 
      appBar:  _selectedIndex == 2 || _selectedIndex == 3 ? null : AppBar(
        leading: null,
        title: const Text(
          'Malamatiyyah',
          style: TextStyle(
              color: Colors.black,
              fontFamily: Fonts.POPPINS,
              fontSize: 24,
              fontWeight: FontWeight.w900),
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: _selectedIndex == 0
          ? const SurahScreen()
          : _selectedIndex == 1
              ? const DoaScreen()
              : _selectedIndex == 2
                  // ? const EbooksScreen()
                  ? const EbooksScreenDraft()
                  : const VideosScreen(),
      bottomNavigationBar: BottomNavigationBar(
        useLegacyColorScheme: false,
        backgroundColor: Colors.white,
        elevation: 5,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Coloring.primary,
        unselectedItemColor: Coloring.tertiary,
        unselectedLabelStyle: const TextStyle(
            color: Coloring.tertiary, fontFamily: Fonts.POPPINS),
        selectedLabelStyle:
            const TextStyle(color: Coloring.primary, fontFamily: Fonts.POPPINS),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Qur\'an',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Doa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'Ebooks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_collection),
            label: 'Video',
          ),
        ],
      ),
    );
  }
}
