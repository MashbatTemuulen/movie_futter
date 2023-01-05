import "package:flutter/material.dart";
import "package:movie/model/movie/index.dart";
import "package:movie/screens/movie_detail.dart";

class MovieCard extends StatelessWidget {
  final MovieModel data;

  void _onCardTap(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => MovieDetailPage(data)));
  }

  const MovieCard(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width / 3 - 20;
    return InkWell(
        onTap: () => _onCardTap(context),
        child: Column(
          children: [
            Container(
              width: size,
              height: size * 1.3,
              margin: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage(data.imgUrl), fit: BoxFit.fill)),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: size,
              child: Text(
                data.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18, color: Colors.white.withOpacity(0.8)),
              ),
            ),
            SizedBox(height: 10),
          ],
        ));
  }
}
