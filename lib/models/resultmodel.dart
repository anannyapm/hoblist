
import 'package:assignment/models/moviemodel.dart';


//tmdb returns a json file with main fields => current page,list of movie results,totalpages of results,total resultscount
//following model is to store above related data.

//results will be all movie details with respective details of  movie like id,name,descroption,images etc. so we store it in movieinfomodel class
class ResultModel {
  List<MovieModel> results = [];

  ResultModel.fromJson(Map data) {
    results = List<MovieModel>.from(data['result'].map((item) {
      MovieModel movieInfo = MovieModel.fromJson(item);
      return movieInfo;
    }));
   
  }

 
}
