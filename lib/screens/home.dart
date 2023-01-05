import 'package:flutter/material.dart';
import 'package:movie/screens/movies.dart';
import 'package:movie/screens/profile.dart';
import 'package:movie/screens/whishList.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 2;

  // final List<Widget> _totalPage = const [
  //   MoviesPage(),
  //   WhishListPage(),
  //   ProfilePage()
  // ];

  List<int> _wishListIds = [];
  late List<Widget> _totalPage;
  @override
  void initState() {
    super.initState();
    _totalPage = [
      MoviesPage(_wishListIds, _toggleWishList),
      WhishListPage(_wishListIds, _toggleWishList),
      ProfilePage()
    ];
  }

  void _toggleWishList(int index) {
    setState(() => {
          if (_wishListIds.any((el) => el == index))
            {_wishListIds.remove(index)}
          else
            {_wishListIds.add(index)}
        });
  }

  void _setCurrentIndex(int val) {
    setState(() {
      _currentIndex = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff36393f),
      body: SafeArea(
        child: _totalPage[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _setCurrentIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.movie),
              label: "Кино",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Дуртай",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Профайл",
            ),
          ]),
    );
  }
}
