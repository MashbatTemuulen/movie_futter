import 'package:flutter/material.dart';
import 'package:movie/model/movie/index.dart';
import 'package:movie/screens/movie_detail.dart';

class MovieSpecialCard extends StatelessWidget {
  final MovieModel data;
  final List<int> whishListIds;
  final Function(int) onToggleWhishList;

  void _onCardTap(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) =>
                MovieDetailPage(data, whishListIds, onToggleWhishList)));
  }

  const MovieSpecialCard(this.data, this.whishListIds, this.onToggleWhishList,
      {super.key});

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width * 0.5;
    return InkWell(
        onTap: () => _onCardTap(context),
        child: Container(
          height: size * 1.5,
          // width: size.width * 0.7,
          width: size,
          margin: EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
                image: NetworkImage(data.imgUrl), fit: BoxFit.cover),
          ),
          child: const Icon(
            Icons.play_circle,
            size: 50,
          ),
        ));
  }
}
