import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviebook/providers/apiproviders.dart';
import 'package:moviebook/responsive/responsivesize.dart';
import 'package:moviebook/view/homepagescreen/Detailedpage/detailpagescreen.dart';
import 'package:moviebook/view/homepagescreen/homescreenprovider.dart';
import 'package:moviebook/view/loginpages/widgets.dart';

class SearchPage extends ConsumerWidget {
  SearchPage({super.key});
  final textcontroller1 = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final toggle = ref.watch(toggleprovider);
    final searchresult = ref.watch(searchprovider(ref.watch(searchstring)));
    return Scaffold(
      backgroundColor: toggle
          ? Color.fromARGB(255, 14, 30, 38)
          : const Color.fromARGB(255, 249, 245, 245),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Heightbetween(width: 20),
              Stack(
                children: [
                  SizedBox(
                    height: Sizing.width(60, context),
                    width: Sizing.width(320, context),
                    child: TextField(
                      style: TextStyle(
                        color: toggle
                            ? const Color.fromARGB(255, 249, 245, 245)
                            : Colors.black,
                      ),
                      controller: textcontroller1,
                      onChanged: (value) {
                        ref.read(searchstring.notifier).state = value;
                      },
                      decoration: InputDecoration(
                        hintText: "Search here",
                        hintStyle: const TextStyle(color: Colors.pinkAccent),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: toggle ? Colors.white70 : Colors.black,
                              width: Sizing.width(2, context)),
                          borderRadius: BorderRadius.circular(
                            Sizing.width(14, context),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.pinkAccent,
                            width: Sizing.width(2, context),
                          ),
                          borderRadius: BorderRadius.circular(
                            Sizing.width(14, context),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: Sizing.width(6, context),
                    left: Sizing.width(270, context),
                    child: IconButton(
                      onPressed: () {
                        ref.read(searchstring.notifier).state =
                            textcontroller1.text;
                      },
                      icon: Icon(
                        Icons.search,
                        color: toggle
                            ? const Color.fromARGB(255, 249, 245, 245)
                            : Colors.black,
                      ),
                    ),
                  )
                ],
              ),
              const Heightbetween(width: 10),
              Expanded(
                child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: searchresult.when(
                      data: (data) {
                        if (data == null) {
                          return const Center(
                            child: Text("Something went wrong"),
                          );
                        }
                        return ListView.separated(
                            padding: EdgeInsets.symmetric(
                              horizontal: Sizing.width(38, context),
                            ),
                            itemBuilder: (context, index) {
                              if (data.results![index].posterPath == null) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              DetailPageScreen(
                                                  moviedetails:
                                                      data.results![index]),
                                        ));
                                  },
                                  child: Row(
                                    children: [
                                      Container(
                                        height: Sizing.width(120, context),
                                        width: Sizing.width(90, context),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            Sizing.width(10, context),
                                          ),
                                        ),
                                        child: const Center(
                                          child: Icon(Icons.person),
                                        ),
                                      ),
                                      const Gapbetween(width: 20),
                                      SizedBox(
                                        width: Sizing.width(170, context),
                                        child: Text(
                                          data.results![index].title!,
                                          style: TextStyle(
                                            fontFamily: "Sans",
                                            color: toggle
                                                ? const Color.fromARGB(
                                                    255, 249, 245, 245)
                                                : Colors.black,
                                            fontSize: Sizing.width(20, context),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DetailPageScreen(
                                            moviedetails: data.results![index]),
                                      ));
                                },
                                child: Row(
                                  children: [
                                    Container(
                                      height: Sizing.width(120, context),
                                      width: Sizing.width(90, context),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          Sizing.width(10, context),
                                        ),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                "https://image.tmdb.org/t/p/w500${data.results![index].posterPath}"),
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                    const Gapbetween(width: 20),
                                    SizedBox(
                                      width: Sizing.width(170, context),
                                      child: Text(
                                        data.results![index].title!,
                                        style: TextStyle(
                                          fontFamily: "Sans",
                                          color: toggle
                                              ? const Color.fromARGB(
                                                  255, 249, 245, 245)
                                              : Colors.black,
                                          fontWeight: FontWeight.w600,
                                          fontSize: Sizing.width(20, context),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) => SizedBox(
                                  height: Sizing.width(22, context),
                                ),
                            itemCount: data.results!.length);
                      },
                      error: (error, stackTrace) => Center(
                        child: Text("$error"),
                      ),
                      loading: () {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
