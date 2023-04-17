import 'package:dio/dio.dart';



import '../api.dart';
import '../models/news.dart';



class NewsService{


  static Future<List<News>>  getQueryNews(String query) async{
    final dio = Dio();
    try{

      final response = await dio.get(Api.searchNewsApi,
          queryParameters: {
            'q': query,
            'lang':'en'
          },
          options: Options(
              headers: {
                'X-RapidAPI-Host': 'free-news.p.rapidapi.com',
                'X-RapidAPI-Key': '89e53c72d7msh16aa8c041814a4cp1f3e79jsn333d7bcaf747'
              }
          )
      );
      if(response.data['status'] == 'No matches for your search.'){
        return [
          News(
              author: '',
              link: '',
              media: '',
              published_date: '',
              summary: '',
              title: 'No matches for your search'
          )
        ];
      }else{
        final data = (response.data['articles'] as List).map((news) => News.fromJson(news)).toList();
        return data;
      }



    }on DioError catch (err){
      print(err);
      return [];
    }
  }



  static Future<List<News>>  getNews() async{
    final dio = Dio();
    try{
      await Future.delayed(Duration(seconds: 4));
      final response = await dio.get(Api.searchNewsApi,
          queryParameters: {
            'q': 'science',
            'lang':'en'
          },
          options: Options(
              headers: {
                'X-RapidAPI-Host': 'free-news.p.rapidapi.com',
                'X-RapidAPI-Key': '89e53c72d7msh16aa8c041814a4cp1f3e79jsn333d7bcaf747'
              }
          )
      );
      final data = (response.data['articles'] as List).map((news) => News.fromJson(news)).toList();
      return data;
    }on DioError catch (err){
      print(err);
      return [];
    }
  }





}