import 'dart:convert';
import 'package:http/http.dart';
import 'package:movie_app/model/popular_movie_model.dart';
import 'package:movie_app/networking/api_constant.dart';

mixin HomeRepository {
  Future<List<PopularMovie>> getListMovie(int page);
}

class HomeRepositoryImpl implements HomeRepository {
  final Client client;
  HomeRepositoryImpl(this.client);

  @override
  Future<List<PopularMovie>> getListMovie(int page) async {
    final List<PopularMovie> result = [];

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
          .map((e) => PopularMovie.fromJson(e))
          .toList());
    }
    return result;
  }
}
