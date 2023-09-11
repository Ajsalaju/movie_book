import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviebook/responsive/responsivesize.dart';
import 'package:moviebook/view/homepagescreen/Detailedpage/detailpagescreen.dart';
import 'package:moviebook/view/homepagescreen/Detailedpage/detailpagescreen2.dart';
import 'package:moviebook/view/homepagescreen/categoryscreen.dart';
import 'package:moviebook/view/homepagescreen/homescreenprovider.dart';
import 'package:moviebook/view/homepagescreen/searchpage.dart';
import 'package:moviebook/view/loginpages/widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../providers/apiproviders.dart';

class MainHomePage extends ConsumerWidget {
  MainHomePage({super.key});
  final apiservice = apiserviceprovider;
  final pageController1 = PageController();
  final carouselController1 = CarouselController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trendinglist = ref.watch(trendingproviderday);
    final tvserieslist = ref.watch(tvseriesprovider);
    final popularlist = ref.watch(popularmovieprovider);
    final toggleswitch = ref.watch(toggleprovider);
    final upcominglist = ref.watch(upcomingmovieprovider);
    final bottomindex = ref.watch(bottomindexprovider);
    final toggletrend = ref.watch(toggletrendprovider);
    final trendinglist2 = ref.watch(trendingproviderweek);
    final anytrendinglist = toggletrend == 0 ? trendinglist : trendinglist2;
    return Scaffold(
      extendBody: true,
      backgroundColor: toggleswitch
          ? Color.fromARGB(255, 14, 30, 38)
          : Color.fromARGB(255, 249, 245, 245),
      drawer: Drawer(
        backgroundColor: toggleswitch
            ? Color.fromARGB(219, 49, 59, 77)
            : const Color.fromARGB(226, 255, 255, 255),
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: Sizing.width(34, context),
                  backgroundImage: const AssetImage(
                      "assets/homepagescreen/Best-Quality-Profile-Images-Pic-Download-2023.jpg"),
                ),
                const Whiteline(),
                // const Heightbetween(width: ),
                Drawertext(
                  text1: "User Name",
                ),
                const Whiteline(),
                Drawertext(text1: "User Settings"),
                const Whiteline(),
                Drawertext(text1: "About"),
                const Whiteline(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(toggleswitch ? Icons.dark_mode : Icons.light_mode),
                    Switch(
                      activeColor: const Color.fromARGB(255, 233, 15, 88),
                      value: toggleswitch,
                      onChanged: (value) {
                        ref.read(toggleprovider.notifier).state =
                            !ref.read(toggleprovider.notifier).state;
                      },
                    ),
                  ],
                ),
                const Whiteline(),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(
                Icons.menu,
                color: toggleswitch
                    ? const Color.fromARGB(255, 227, 227, 227)
                    : Colors.black,
              ));
        }),
        backgroundColor: toggleswitch
            ? const Color.fromARGB(255, 35, 55, 65)
            : Color.fromARGB(255, 249, 245, 245),
        title: const Moviebook(),
        centerTitle: true,
        elevation: 0,
      ),
      body: PageView(
        controller: pageController1,
        onPageChanged: (pageviewindex) {
          ref.read(bottomindexprovider.notifier).state = pageviewindex;
        },
        children: [
          SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  const Heightbetween(width: 10),
                  const MainScreenTitle(text1: "Popular"),
                  const Heightbetween(width: 20),
                  popularlist.when(
                    data: (data) {
                      if (data == null) {
                        return const Center(
                          child: Text("Something went wrong"),
                        );
                      }
                      return Column(
                        children: [
                          CarouselSlider.builder(
                            carouselController: carouselController1,
                            itemCount: data.results!.length,
                            itemBuilder: (context, index, realIndex) => InkWell(
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
                              child: Stack(
                                children: [
                                  ShaderMask(
                                    shaderCallback: (bounds) =>
                                        const LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                          Colors.transparent,
                                          Colors.black
                                        ]).createShader(bounds),
                                    blendMode: BlendMode.srcATop,
                                    child: Container(
                                      width: Sizing.width(360, context),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            Sizing.width(18, context)),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                'https://image.tmdb.org/t/p/w500${data.results![index].backdropPath!}'),
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 0,
                                    left: 0,
                                    bottom: Sizing.width(10, context),
                                    child: Text(
                                      data.results![index].originalTitle!,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: Sizing.width(22, context),
                                        color: Color.fromARGB(255, 209, 58, 3),
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            options: CarouselOptions(
                                onPageChanged: (index, reason) => ref
                                    .read(indicatorprovider.notifier)
                                    .state = index,
                                enlargeCenterPage: true,
                                viewportFraction: 1,
                                height: Sizing.width(210, context),
                                autoPlayInterval: const Duration(seconds: 2),
                                // scrollPhysics: const BouncingScrollPhysics(),
                                autoPlay: true),
                          ),
                          const Heightbetween(width: 10),
                          AnimatedSmoothIndicator(
                              onDotClicked: (index) {
                                carouselController1.jumpToPage(
                                  index,
                                  // duration: const Duration(milliseconds: 200),
                                  // curve: Curves.linear,
                                );
                              },
                              effect: const ScrollingDotsEffect(
                                  fixedCenter: true,
                                  dotColor: Color.fromARGB(162, 255, 152, 186),
                                  activeDotColor: Colors.pinkAccent),
                              activeIndex: ref.watch(indicatorprovider),
                              count: data.results!.length)
                        ],
                      );
                    },
                    error: (error, stackTrace) => Center(
                      child: Text("$error"),
                    ),
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  const Heightbetween(width: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Sizing.width(18, context)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const MainScreenTitle(
                          text1: "Trending",
                        ),
                        Container(
                          height: Sizing.width(44, context),
                          width: Sizing.width(210, context),
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: Sizing.width(2, context),
                                color:
                                    toggleswitch ? Colors.white : Colors.black),
                            borderRadius: BorderRadius.circular(
                              Sizing.width(30, context),
                            ),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    ref
                                        .read(toggletrendprovider.notifier)
                                        .state = 0;
                                  },
                                  child: Container(
                                    height: Sizing.width(40, context),
                                    width: Sizing.width(90, context),
                                    decoration: BoxDecoration(
                                      color: toggletrend == 0
                                          ? Colors.pinkAccent
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(
                                        Sizing.width(20, context),
                                      ),
                                    ),
                                    child: Center(
                                      child: toggletext(
                                          toggleswitch: toggleswitch,
                                          text1: "This Day"),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    ref
                                        .read(toggletrendprovider.notifier)
                                        .state = 1;
                                  },
                                  child: Container(
                                    height: Sizing.width(40, context),
                                    width: Sizing.width(110, context),
                                    decoration: BoxDecoration(
                                      color: toggletrend == 1
                                          ? Colors.pinkAccent
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(
                                        Sizing.width(20, context),
                                      ),
                                    ),
                                    child: Center(
                                      child: toggletext(
                                          toggleswitch: toggleswitch,
                                          text1: "This Week"),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Heightbetween(width: 10),
                  const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [],
                    ),
                  ),
                  const Heightbetween(width: 14),
                  anytrendinglist.when(
                    data: (data) {
                      if (data == null) {
                        return const Center(
                          child: Text("Something went wrong"),
                        );
                      }
                      return SizedBox(
                        height: Sizing.width(210, context),
                        child: ListView.separated(
                            padding: EdgeInsets.only(
                                left: Sizing.width(20, context)),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DetailPageScreen(
                                            moviedetails: data.results![index]),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    height: Sizing.width(170, context),
                                    width: Sizing.width(168, context),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        Sizing.width(20, context),
                                      ),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              "https://image.tmdb.org/t/p/w500${data.results![index].posterPath}"),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                ),
                            separatorBuilder: (context, index) =>
                                const Gapbetween(width: 10),
                            itemCount: data.results!.length),
                      );
                    },
                    error: (error, stackTrace) => Center(
                      child: Text("$error"),
                    ),
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  const Heightbetween(width: 18),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18),
                    child: Row(
                      children: [MainScreenTitle(text1: "Upcoming")],
                    ),
                  ),
                  const Heightbetween(width: 14),
                  upcominglist.when(
                    data: (data) {
                      if (data == null) {
                        return const Center(
                          child: Text("Something went wrong"),
                        );
                      }
                      return CarouselSlider.builder(
                        itemCount: data.results!.length,
                        itemBuilder: (context, index, realIndex) => InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailPageScreen(
                                    moviedetails: data.results![index]),
                              ),
                            );
                          },
                          child: Container(
                            width: Sizing.width(176, context),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                Sizing.width(20, context),
                              ),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://image.tmdb.org/t/p/w500${data.results![index].posterPath}"),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ),
                        options: CarouselOptions(
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 500),
                          reverse: true,
                          autoPlayCurve: Curves.easeInCubic,
                          viewportFraction: .5,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 2),
                          height: Sizing.width(220, context),
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
                  const Heightbetween(width: 10),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18),
                    child: Row(
                      children: [MainScreenTitle(text1: "Trending TV Series")],
                    ),
                  ),
                  const Heightbetween(width: 10),
                  tvserieslist.when(
                    data: (data) {
                      if (data == null) {
                        return const Center(
                          child: Text("Something went wrong"),
                        );
                      }
                      return CarouselSlider.builder(
                        itemCount: data.results!.length,
                        itemBuilder: (context, index, realIndex) => InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailPageScreen2(
                                    tvdetails: data.results![index]),
                              ),
                            );
                          },
                          child: Container(
                            width: Sizing.width(176, context),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                Sizing.width(20, context),
                              ),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://image.tmdb.org/t/p/w500${data.results![index].posterPath}"),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ),
                        options: CarouselOptions(
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 500),
                          autoPlayCurve: Curves.linear,
                          enlargeCenterPage: true,
                          viewportFraction: .5,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 2),
                          height: Sizing.width(220, context),
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
                  const Heightbetween(width: 60),
                ],
              ),
            ),
          ),
          SearchPage(),
          const CategoryScreen(),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
            left: Sizing.width(10, context),
            right: Sizing.width(10, context),
            bottom: Sizing.width(10, context)),
        child: BottomNavigationBar(
            backgroundColor: const Color.fromARGB(90, 115, 8, 43),
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: Colors.pinkAccent,
            unselectedItemColor: const Color.fromARGB(207, 255, 255, 255),
            selectedIconTheme: IconThemeData(size: Sizing.width(42, context)),
            unselectedIconTheme: IconThemeData(size: Sizing.width(28, context)),
            elevation: 0,
            currentIndex: bottomindex,
            onTap: (index1) {
              ref.read(bottomindexprovider.notifier).state = index1;
              pageController1.animateToPage(
                ref.watch(bottomindexprovider),
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined), label: "home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: "search"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.category), label: "regions")
            ]),
      ),
    );
  }
}
