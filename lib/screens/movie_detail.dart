import "package:flutter/material.dart";
import "package:movie/model/movie/index.dart";

class MovieDetailPage extends StatefulWidget {
  final MovieModel data;
  final List<int> whishListIds;
  final Function(int) ontToggleWishList;

  const MovieDetailPage(this.data, this.whishListIds, this.ontToggleWishList,
      {super.key});

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 33, 34, 37),
      body: CustomScrollView(
        slivers: [
          // SliverAppBar(
          //   title: Text(data.title),
          // ),
          SliverList(
              delegate: SliverChildListDelegate([
            SizedBox(
              width: width,
              height: height / 1.8,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  SafeArea(
                      child: Image.network(widget.data.imgUrl,
                          width: width,
                          fit: BoxFit.fitWidth,
                          alignment: Alignment.topCenter)),
                  Container(
                    color: Colors.black.withOpacity(0.7),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      const Icon(Icons.play_circle,
                          color: Colors.white, size: 60),
                      const SizedBox(
                        height: 50,
                      ),
                      Text(widget.data.title,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                          "${widget.data.publishedYear} | ${widget.data.durationMin} | ${widget.data.type}",
                          style: const TextStyle(
                              color: Colors.white60,
                              fontWeight: FontWeight.w500)),
                      const SizedBox(
                        height: 50,
                      )
                    ]),
                  ),
                  SafeArea(
                      child: Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(
                        Icons.chevron_left,
                        color: Colors.white,
                      ),
                    ),
                  )),
                  SafeArea(
                      child: Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: () => {
                        setState(
                            () => {widget.ontToggleWishList(widget.data.id)})
                      },
                      icon: Icon(
                        widget.whishListIds.any((el) => el == widget.data.id)
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Colors.white,
                      ),
                    ),
                  ))
                ],
              ),
            ),
            Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text("Тайлбар",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 10,
                ),
                Text(widget.data.description ?? "",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.white60, fontWeight: FontWeight.w500)),
                const SizedBox(
                  height: 60,
                ),
              ],
            ),
          ]))
        ],
      ),
    );
  }
}
