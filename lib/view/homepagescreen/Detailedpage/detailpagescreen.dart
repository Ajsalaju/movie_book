import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviebook/model/movie_model.dart';
import 'package:moviebook/providers/apiproviders.dart';
import 'package:moviebook/responsive/responsivesize.dart';
import 'package:moviebook/view/homepagescreen/homescreenprovider.dart';
import 'package:moviebook/view/loginpages/widgets.dart';
import 'package:percent_indicator/percent_indicator.dart';

class DetailPageScreen extends ConsumerWidget {
  DetailPageScreen({super.key, required this.moviedetails});
  final Result moviedetails;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final toggleswitch = ref.watch(toggleprovider);
    final castmovie = ref.watch(castmovieprovider(moviedetails.id!));
    final genremovie = ref.watch(genreprovider(moviedetails.id!));
    return Scaffold(
      backgroundColor: toggleswitch
          ? const Color.fromARGB(255, 14, 30, 38)
          : const Color.fromARGB(255, 249, 245, 245),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Stack(
                children: [
                  ShaderMask(
                    shaderCallback: (bounds) => const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Color.fromARGB(196, 0, 0, 0),
                        ]).createShader(bounds),
                    blendMode: BlendMode.srcATop,
                    child: Container(
                      height: Sizing.width(300, context),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(moviedetails.backdropPath ==
                                    null
                                ? "https://image.tmdb.org/t/p/w500${moviedetails.posterPath!}"
                                : "https://image.tmdb.org/t/p/w500${moviedetails.backdropPath}"),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  Positioned(
                    top: Sizing.width(50, context),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.white,
                        size: Sizing.width(20, context),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: Sizing.height(20, context),
                    left: 0,
                    right: 0,
                    child: Text(
                      moviedetails.title!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: Sizing.width(34, context),
                          fontWeight: FontWeight.w600,
                          color: toggleswitch
                              ? const Color.fromARGB(207, 255, 255, 255)
                              : Colors.black),
                    ),
                  ),
                ],
              ),
              Text(
                "Language:${moviedetails.originalLanguage}",
                style: TextStyle(
                    fontSize: Sizing.width(20, context),
                    fontWeight: FontWeight.w600,
                    color: toggleswitch
                        ? Color.fromARGB(207, 255, 255, 255)
                        : Colors.black),
              ),
              const Heightbetween(width: 20),
              CircularPercentIndicator(
                percent: moviedetails.voteAverage! / 10,
                lineWidth: Sizing.width(4, context),
                radius: Sizing.width(24, context),
                progressColor: Colors.pinkAccent,
                backgroundColor: Colors.transparent,
                center: Text(
                  moviedetails.voteAverage!.toStringAsFixed(2),
                  style: TextStyle(
                      fontSize: Sizing.width(16, context),
                      fontWeight: FontWeight.w700,
                      color: Colors.pinkAccent),
                ),
              ),
              Text(
                "Rating",
                style: TextStyle(
                    fontSize: Sizing.width(20, context),
                    fontWeight: FontWeight.w600,
                    color: toggleswitch
                        ? const Color.fromARGB(207, 255, 255, 255)
                        : Colors.black),
              ),
              const Heightbetween(width: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Genre:  ",
                    style: TextStyle(
                        fontSize: Sizing.width(18, context),
                        fontWeight: FontWeight.w600,
                        color: toggleswitch
                            ? const Color.fromARGB(207, 255, 255, 255)
                            : Colors.black),
                  ),
                  genremovie.when(
                    data: (data) {
                      if (data == null) {
                        return const Center(
                          child: Text("Something went wrong"),
                        );
                      }
                      return SizedBox(
                        height: Sizing.width(18, context),
                        child: ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => Text(
                                  data.genres![index].name!,
                                  style: TextStyle(
                                      fontSize: Sizing.width(14.5, context),
                                      fontWeight: FontWeight.w600,
                                      color: toggleswitch
                                          ? const Color.fromARGB(
                                              207, 255, 255, 255)
                                          : Colors.black),
                                ),
                            separatorBuilder: (context, index) => Text(
                                  "/",
                                  style: TextStyle(
                                      fontSize: Sizing.width(14.5, context),
                                      fontWeight: FontWeight.w600,
                                      color: toggleswitch
                                          ? const Color.fromARGB(
                                              207, 255, 255, 255)
                                          : Colors.black),
                                ),
                            itemCount: data.genres!.length),
                      );
                    },
                    error: (error, stackTrace) => Center(
                      child: Text("$error"),
                    ),
                    loading: () {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: Sizing.width(16, context),
                  top: Sizing.width(20, context),
                ),
                child: Row(
                  children: [
                    Text(
                      "Summary",
                      style: TextStyle(
                          fontSize: Sizing.width(22, context),
                          fontWeight: FontWeight.w600,
                          color: toggleswitch
                              ? const Color.fromARGB(207, 255, 255, 255)
                              : Colors.black),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: Sizing.width(16, context),
                  top: Sizing.width(10, context),
                ),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    moviedetails.overview!,
                    style: TextStyle(
                        fontSize: Sizing.width(20, context),
                        fontWeight: FontWeight.w600,
                        color: toggleswitch
                            ? const Color.fromARGB(207, 255, 255, 255)
                            : Colors.black),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: Sizing.width(16, context),
                  top: Sizing.width(20, context),
                ),
                child: Row(
                  children: [
                    Text(
                      "Casts",
                      style: TextStyle(
                          fontSize: Sizing.width(22, context),
                          fontWeight: FontWeight.w600,
                          color: toggleswitch
                              ? const Color.fromARGB(207, 255, 255, 255)
                              : Colors.black),
                    ),
                  ],
                ),
              ),
              const Heightbetween(width: 10),
              castmovie.when(
                data: (data) {
                  if (data == null) {
                    return const Center(
                      child: Text("Something went wrong"),
                    );
                  }
                  return SizedBox(
                    height: Sizing.width(120, context),
                    child: ListView.builder(
                      padding: EdgeInsets.only(left: Sizing.width(10, context)),
                      scrollDirection: Axis.horizontal,
                      itemCount: data.cast!.length,
                      itemBuilder: (context, index) =>
                          data.cast![index].profilePath == null
                              ? Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: Sizing.width(10, context)),
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: Colors.blueGrey,
                                        radius: Sizing.width(40, context),
                                        child: Center(
                                          child: Icon(
                                            Icons.person,
                                            color: Colors.white,
                                            size: Sizing.width(30, context),
                                          ),
                                        ),
                                      ),
                                      const Heightbetween(width: 10),
                                      Text(
                                        data.cast![index].originalName!,
                                        style: TextStyle(
                                          color: toggleswitch
                                              ? const Color.fromARGB(
                                                  207, 255, 255, 255)
                                              : Colors.black,
                                          fontSize: Sizing.width(16, context),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: Sizing.width(10, context),
                                  ),
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: Colors.blueGrey,
                                        radius: Sizing.width(35, context),
                                        backgroundImage: NetworkImage(
                                            "https://image.tmdb.org/t/p/w500${data.cast![index].profilePath}"),
                                      ),
                                      const Heightbetween(width: 10),
                                      Text(
                                        data.cast![index].originalName!,
                                        style: TextStyle(
                                          color: toggleswitch
                                              ? const Color.fromARGB(
                                                  207, 255, 255, 255)
                                              : Colors.black,
                                          fontSize: Sizing.width(16, context),
                                        ),
                                      ),
                                      SizedBox(
                                        child: Text(
                                          "As:${data.cast![index].character!}",
                                          style: TextStyle(
                                            color: toggleswitch
                                                ? const Color.fromARGB(
                                                    207, 255, 255, 255)
                                                : Colors.black,
                                            fontSize: Sizing.width(15, context),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                    ),
                  );
                },
                error: (error, stackTrace) => Center(
                  child: Text("$error"),
                ),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
