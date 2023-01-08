import 'package:flutter/material.dart';
import 'package:movie/model/movie/index.dart';
import 'package:movie/screens/movie_detail.dart';

import 'my_bottomsheet.dart';

class MovieSpecialCard extends StatelessWidget {
  final MovieModel data;

  void _onCardTap(BuildContext context) {
    showBottomSheet(
        context: context, builder: ((context) => MyBottomSheet(data)));

    // Navigator.push(
    //     context, MaterialPageRoute(builder: (_) => MovieDetailPage(data)));
  }

  const MovieSpecialCard(this.data, {super.key});

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
