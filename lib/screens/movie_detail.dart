import "package:flutter/material.dart";
import "package:movie/model/movie/index.dart";
import 'package:movie/providers/common.dart';
import 'package:provider/provider.dart';

class MovieDetailPage extends StatefulWidget {
  final MovieModel data;

  const MovieDetailPage(this.data, {super.key});

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (!Provider.of<CommonProvider>(context, listen: false).isLoggedIn) {
        Provider.of<CommonProvider>(context, listen: false)
            .changeCurrentIndex(2);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Нэвтэрнэ үү!")));
        Navigator.pop(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Consumer<CommonProvider>(builder: ((context, provider, child) {
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
                        onPressed: () => provider.addWishList(widget.data.id),
                        icon: Icon(
                          provider.isWishMovies(widget.data)
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
    }));
  }
}
