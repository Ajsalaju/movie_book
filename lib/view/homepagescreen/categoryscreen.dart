import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviebook/responsive/responsivesize.dart';
import 'package:moviebook/view/homepagescreen/categories/Malayalammovies.dart';
import 'package:moviebook/view/homepagescreen/categories/englishmovies.dart';
import 'package:moviebook/view/homepagescreen/categories/hindimovies.dart';
import 'package:moviebook/view/homepagescreen/categories/tamilmovies.dart';
import 'package:moviebook/view/homepagescreen/homescreenprovider.dart';

import '../loginpages/widgets.dart';

class CategoryScreen extends ConsumerWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final toggleswitch = ref.watch(toggleprovider);
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: toggleswitch
            ? const Color.fromARGB(255, 14, 30, 38)
            : const Color.fromARGB(255, 249, 245, 245),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                TabBar(
                  indicatorPadding: EdgeInsets.symmetric(
                    horizontal: Sizing.width(10, context),
                  ),
                  indicatorWeight: Sizing.width(4, context),
                  indicatorColor: Colors.pinkAccent,
                  tabs: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: Sizing.width(10, context)),
                      child: const Categorybartext(text1: "English"),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: Sizing.width(10, context)),
                      child: const Categorybartext(text1: "Hindi"),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: Sizing.width(10, context)),
                      child: const Categorybartext(text1: "Malayal"),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: Sizing.width(10, context)),
                      child: const Categorybartext(text1: "Tamil"),
                    ),
                  ],
                ),
                Container(
                  height: Sizing.width(680, context),
                  width: MediaQuery.of(context).size.width,
                  color: Colors.amber,
                  child: const TabBarView(children: [
                    Englishmovies(),
                    HindiMovies(),
                    Malayalammovies(),
                    Tamilmovies(),
                  ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
