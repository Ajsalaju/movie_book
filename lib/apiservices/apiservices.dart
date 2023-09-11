import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:moviebook/model/Tv_model.dart';
import 'package:moviebook/model/cast_model.dart';
import 'package:moviebook/model/genremovies.dart';
import 'package:moviebook/model/movie_model.dart';
import 'package:moviebook/model/tvcast.dart';

class Apiservice {
  Dio dio = Dio(BaseOptions(
      baseUrl: "https://api.themoviedb.org/3",
      queryParameters: {"api_key": "d452d0781938a2a0744c75cf945e1b79"}));

  Future<MovieModel?> gettrendingday() async {
    try {
      Response response = await dio.get("/trending/movie/day");
      if (response.statusCode == 200) {
        String json = jsonEncode(response.data);
        return movieModelFromJson(json);
      }
      return null;
    } on DioException catch (e) {
      log("error $e");
      return null;
    }
  }

  Future<MovieModel?> gettrendingweek() async {
    try {
      Response response = await dio.get("/trending/movie/week");
      if (response.statusCode == 200) {
        String json = jsonEncode(response.data);
        return movieModelFromJson(json);
      }
      return null;
    } on DioException catch (e) {
      log("error $e");
      return null;
    }
  }

  Future<CastModel?> getcast(int movieid) async {
    try {
      Response response = await dio.get("/movie/$movieid/credits");
      if (response.statusCode == 200) {
        String json = jsonEncode(response.data);
        return castModelFromJson(json);
      }
    } on DioException catch (e) {
      log("error $e");
    }
    return null;
  }

  Future<MovieModel?> getupcoming() async {
    try {
      Response response = await dio.get("/movie/upcoming");
      if (response.statusCode == 200) {
        String json = jsonEncode(response.data);
        return movieModelFromJson(json);
      }
      return null;
    } on DioException catch (e) {
      log("error $e");
    }
    return null;
  }

  Future<MovieModel?> getpopular() async {
    try {
      Response response = await dio.get("/movie/popular");
      if (response.statusCode == 200) {
        String json = jsonEncode(response.data);
        return movieModelFromJson(json);
      }
    } on DioException catch (e) {
      log("error $e");
    }
    return null;
  }

  Future<TvModel?> gettvseries() async {
    try {
      Response response = await dio.get("/trending/tv/day");
      if (response.statusCode == 200) {
        String json = jsonEncode(response.data);
        return tvModelFromJson(json);
      }
      return null;
    } on DioException catch (e) {
      log("error $e");
    }
    return null;
  }

  Future<Tvcast?> gettvcast(int seriesid) async {
    try {
      Response response = await dio.get("/tv/$seriesid/credits");
      if (response.statusCode == 200) {
        String json = jsonEncode(response.data);
        return tvcastFromJson(json);
      }
    } on DioException catch (e) {
      log("Error $e");
    }
    return null;
  }

  Future<MovieModel?> getmalayalam() async {
    try {
      Response response = await dio.get("/discover/movie",
          queryParameters: {"with_original_language": "ml"});
      if (response.statusCode == 200) {
        String json = jsonEncode(response.data);
        return movieModelFromJson(json);
      }
    } on DioException catch (e) {
      log("error $e");
    }
    return null;
  }

  Future<MovieModel?> gethindi() async {
    try {
      Response response = await dio.get("/discover/movie",
          queryParameters: {"with_original_language": "hi"});
      if (response.statusCode == 200) {
        String json = jsonEncode(response.data);
        return movieModelFromJson(json);
      }
    } on DioException catch (e) {
      log("error $e");
    }
    return null;
  }

  Future<MovieModel?> getenglish() async {
    try {
      Response response = await dio.get("/discover/movie",
          queryParameters: {"with_original_language": "en"});
      if (response.statusCode == 200) {
        String json = jsonEncode(response.data);
        return movieModelFromJson(json);
      }
    } on DioException catch (e) {
      log("error $e");
    }
    return null;
  }

  Future<MovieModel?> gettamil() async {
    try {
      Response response = await dio.get("/discover/movie",
          queryParameters: {"with_original_language": "ta"});
      if (response.statusCode == 200) {
        String json = jsonEncode(response.data);
        return movieModelFromJson(json);
      }
    } on DioException catch (e) {
      log("error $e");
    }
    return null;
  }

  Future<MovieModel?> getsearch(String value) async {
    try {
      Response response =
          await dio.get("/search/movie", queryParameters: {"query": value});
      if (response.statusCode == 200) {
        String json = jsonEncode(response.data);
        return movieModelFromJson(json);
      }
    } on DioException catch (e) {
      log("error $e");
    }
    return null;
  }

  Future<Moviegenre?> getgenre(int genre) async {
    try {
      Response response = await dio.get("/movie/$genre");
      if (response.statusCode == 200) {
        String json = jsonEncode(response.data);
        return moviegenreFromJson(json);
      }
    } on DioException catch (e) {
      log("error $e");
    }
    return null;
  }
}
