import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviebook/providers/apiproviders.dart';
import 'package:moviebook/view/homepagescreen/homescreenprovider.dart';
import '../../../responsive/responsivesize.dart';
import '../Detailedpage/detailpagescreen.dart';

class Englishmovies extends ConsumerWidget {
  const Englishmovies({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final englishmovies1 = ref.watch(englishprovider);
    final toggleswitch = ref.watch(toggleprovider);
    return Scaffold(
      backgroundColor: toggleswitch
          ? const Color.fromARGB(255, 14, 30, 38)
          : const Color.fromARGB(255, 249, 245, 245),
      body: SafeArea(
        child: englishmovies1.when(
          data: (data) {
            if (data == null) {
              return const Center(
                child: Text("something went wrong"),
              );
            }
            return Padding(
              padding: EdgeInsets.only(
                top: Sizing.width(10, context),
              ),
              child: GridView.builder(
                itemCount: data.results!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 220,
                  crossAxisCount: 3,
                  mainAxisSpacing: Sizing.width(8, context),
                  crossAxisSpacing: Sizing.width(6, context),
                ),
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPageScreen(
                          moviedetails: data.results![index],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    width: Sizing.width(90, context),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        Sizing.width(12, context),
                      ),
                      image: DecorationImage(
                          image: NetworkImage(
                            "https://image.tmdb.org/t/p/w500${data.results![index].posterPath}",
                          ),
                          fit: BoxFit.cover),
                    ),
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
      ),
    );
  }
}
