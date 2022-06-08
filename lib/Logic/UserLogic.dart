import 'package:flutter/cupertino.dart';
import 'package:json_api/Loadding/Loadding.dart';
import 'package:json_api/Model/UserModel.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
class MovieLogic extends ChangeNotifier{
  MovieModel _movieModel = MovieModel();
  MovieModel get movieModel => _movieModel;
  Loadding _loadding = Loadding.none;
  Loadding get loadding =>_loadding;
  void setLoadding(){
    _loadding =Loadding.loadding;
    notifyListeners();

  }
  void read() async{
    try{
      final String url ="https://www.omdbapi.com/?s=Batman&page=2&apikey=564727fa";
      http.Response response = await http.get(Uri.parse(url));
      if(response.statusCode ==200){
        _movieModel = await compute(movieModelFromMap, response.body);
        _loadding = Loadding.done;
      }else{
        print("Error");
      }

    }catch(e){
      _loadding = Loadding.error;
    }finally{
      notifyListeners();
    }
  }
}