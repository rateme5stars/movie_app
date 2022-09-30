import 'dart:convert';
import 'package:http/http.dart';
import 'package:movie_app/model/popular_movie_model.dart';
import 'package:movie_app/model/upcoming_movie_model.dart';
import 'package:movie_app/networking/api_constant.dart';

mixin RemoteRepository {
  Future<List<PopularMovie>> getPopularMovies(int page);
  Future<List<UpComingMovie>> getUpcomingMovies(int page);
}

class RemoteRepositoryImpl implements RemoteRepository {
  final Client client;
  RemoteRepositoryImpl(this.client);

  @override
  Future<List<PopularMovie>> getPopularMovies(int page) async {
    final List<PopularMovie> result = [];

    final queryParameter = {
      "api_key": ApiConstant.apiKey,
      "language": "en-US",
      "page": "$page",
    };

    final response = await client.get(
      Uri.https(
        ApiConstant.baseUrl,
        ApiConstant.GET_POPULAR_MOVIE,
        queryParameter,
      ),
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final jsonResult = json['results'];

      result.addAll(List.from(jsonResult as List<dynamic>)
          .map((e) => PopularMovie.fromJson(e))
          .toList());
    }
    return result;
  }

  @override
  Future<List<UpComingMovie>> getUpcomingMovies(int page) async {
    final List<UpComingMovie> result = [];

    final queryParameter = {
      "api_key": ApiConstant.apiKey,
      "language": "en-US",
      "page": "$page",
    };

    final response = await client.get(
      Uri.https(
        ApiConstant.baseUrl,
        ApiConstant.GET_UPCOMING_MOVIE,
        queryParameter,
      ),
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final jsonResult = json['results'];

      result.addAll(List.from(jsonResult as List<dynamic>)
          .map((e) => UpComingMovie.fromJson(e))
          .toList());
    }
    return result;
  }
}
