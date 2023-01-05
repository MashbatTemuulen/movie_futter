import 'dart:convert';

import "package:flutter/material.dart";
import "package:movie/model/movie/index.dart";
import "package:movie/widgets/movie_card.dart";

class WhishListPage extends StatefulWidget {
  final List<int> whishListIds;
  final void Function(int) onToggleWishList;
  const WhishListPage(this.whishListIds, this.onToggleWishList, {super.key});

  @override
  State<WhishListPage> createState() => _WhishListPageState();
}

class _WhishListPageState extends State<WhishListPage> {
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
            List<MovieModel> wishMovies = snapshot.data!
                .where((e) => widget.whishListIds.any((el) => el == e.id))
                .toList();
            return SingleChildScrollView(
              child: Wrap(
                spacing: 10,
                children: List.generate(
                    wishMovies.length,
                    (index) => MovieCard(wishMovies[index], widget.whishListIds,
                        widget.onToggleWishList)),
              ),
            );
          } else
            return CircularProgressIndicator();
        });
  }
}
