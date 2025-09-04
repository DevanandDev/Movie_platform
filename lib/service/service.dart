import 'package:dio/dio.dart';
import 'package:movie/model/model.dart';

class MovieService {
  Dio dio =Dio();
  final String url ="https://api.themoviedb.org/3/trending/movie/day?api_key=d26a8dd97ecb04414d11287cd30cca91";

  Future<List<MovieModel>> fetchMovieService()async{
    try {
      final response = await dio.get(url);
      if (response.statusCode == 200){
        List data = response.data["results"];
        return data.map((a)=> MovieModel.fromJson(a)).toList();
      }
      else{
        throw Exception('Movies not found');
      }
    } catch (e) {
      throw Exception('Movie not found : try again :$e');
    }
  }
}