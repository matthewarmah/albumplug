import 'package:albumplug3/sceens/pages/search.dart';
import 'package:flutter/material.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(child: CustomScrollView(
        slivers: [
          CustomExploreAppBar(),
        ],
      )),
    );
  }
}
