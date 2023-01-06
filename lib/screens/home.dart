import 'package:flutter/material.dart';
import 'package:movie/providers/common.dart';
import 'package:movie/screens/movies.dart';
import 'package:movie/screens/profile.dart';
import 'package:movie/screens/whishList.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Widget> _totalPage = const [
    MoviesPage(),
    WhishListPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<CommonProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: Color(0xff36393f),
          body: SafeArea(
            child: _totalPage[provider.currentIndex],
          ),
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: provider.currentIndex,
              onTap: provider.changeCurrentIndex,
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
      },
    );
  }
}
