import 'dart:convert';

import "package:flutter/material.dart";
import 'package:movie/providers/common.dart';
import "package:movie/widgets/movie_card.dart";
import 'package:provider/provider.dart';

class WhishListPage extends StatelessWidget {
  const WhishListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CommonProvider>(builder: (context, provider, child) {
      return SingleChildScrollView(
        child: Wrap(
          spacing: 10,
          children: List.generate(provider.wishMovies.length,
              (index) => MovieCard(provider.wishMovies[index])),
        ),
      );
    });
  }
}
