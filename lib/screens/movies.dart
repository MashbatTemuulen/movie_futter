import 'dart:convert';

import "package:flutter/material.dart";
import "package:movie/model/movie/index.dart";
import 'package:movie/widgets/movie_card.dart';
import 'package:movie/widgets/movie_special_card.dart';

class MoviesPage extends StatefulWidget {
  final List<int> wishListIds;
  final void Function(int) onToggleWishList;
  const MoviesPage(this.wishListIds, this.onToggleWishList, {super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  Future<List<MovieModel>> _getData() async {
    String res =
        await DefaultAssetBundle.of(context).loadString("assets/movies.json");
    return MovieModel.fromList(jsonDecode(res));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final _specialData = snapshot.data!.length > 3
                ? snapshot.data!.sublist(0, 3)
                : snapshot.data!;
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Text("Шилдэг",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        children: List.generate(
                            _specialData.length,
                            ((index) => MovieSpecialCard(_specialData[index],
                                widget.wishListIds, widget.onToggleWishList)))),
                  ),
                  const SizedBox(height: 20),
                  const Text("Бүх кинонууд",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  Wrap(
                    spacing: 10,
                    children: List.generate(
                        snapshot.data!.length,
                        (index) => MovieCard(snapshot.data![index],
                            widget.wishListIds, widget.onToggleWishList)),
                  )
                ],
              ),
            );
          } else {
            return const Center(
              child: SizedBox(
                height: 30,
                width: 30,
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
