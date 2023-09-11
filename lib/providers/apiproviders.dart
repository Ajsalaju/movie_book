import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviebook/model/Tv_model.dart';
import 'package:moviebook/model/cast_model.dart';
import 'package:moviebook/model/genremovies.dart';
import 'package:moviebook/model/tvcast.dart';

import '../apiservices/apiservices.dart';
import '../model/movie_model.dart';

final apiserviceprovider = Provider((ref) => Apiservice());
final trendingproviderday = FutureProvider<MovieModel?>(
  (ref) => ref.read(apiserviceprovider).gettrendingday(),
);

final trendingproviderweek = FutureProvider<MovieModel?>(
    (ref) => ref.watch(apiserviceprovider).gettrendingweek());
final castmovieprovider = FutureProviderFamily<CastModel?, int>(
  (ref, movieid) {
    return ref.watch(apiserviceprovider).getcast(movieid);
  },
);

final upcomingmovieprovider = FutureProvider<MovieModel?>(
    (ref) => ref.watch(apiserviceprovider).getupcoming());

final popularmovieprovider = FutureProvider<MovieModel?>(
    (ref) => ref.watch(apiserviceprovider).getpopular());

final tvseriesprovider = FutureProvider<TvModel?>(
    (ref) => ref.watch(apiserviceprovider).gettvseries());

final tvcastprovider = FutureProviderFamily<Tvcast?, int>(
    (ref, id) => ref.watch(apiserviceprovider).gettvcast(id));

final malayalamprovider = FutureProvider<MovieModel?>(
    (ref) => ref.watch(apiserviceprovider).getmalayalam());

final hindiprovider = FutureProvider<MovieModel?>(
    (ref) => ref.watch(apiserviceprovider).gethindi());

final englishprovider = FutureProvider<MovieModel?>(
    (ref) => ref.watch(apiserviceprovider).getenglish());

final tamilprovider = FutureProvider<MovieModel?>(
    (ref) => ref.watch(apiserviceprovider).gettamil());

final searchprovider = FutureProviderFamily<MovieModel?, String>(
    (ref, value) => ref.watch(apiserviceprovider).getsearch(value));

final searchstring = StateProvider<String>((ref) => "");

final genreprovider = FutureProviderFamily<Moviegenre?, int>(
    (ref, genre) => ref.watch(apiserviceprovider).getgenre(genre));
