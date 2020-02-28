
import 'dart:async';
import 'package:mobx/mobx.dart';
import 'package:movie_app_bloc/api.dart';
import 'package:flutter_mobx/flutter_mobx.dart';



class ImagesController {

  API _api = API();


  ObservableList<String> _imagesList =  ObservableList();

  Action setMovieId;



  ImagesController(){

    setMovieId = Action(_loadData);

  }


  // Recupera dados da stream

  List<String> get images => _imagesList.toList();



  // carrega dados

  Future<void> _loadData(id) async {

        try {
            _imagesList.clear();

            List<String> result = await _api.listImages(id);

            if(result != null && result.length > 0){

                result = result.map( (url)=>'https://image.tmdb.org/t/p/w200$url').toList();
                _imagesList.addAll(result);

            }else{
          //      _imagesController.sink.addError('sem resultado');
            }
        }catch (erro){
          //  _imagesController.sink.addError('erro $erro');

        }
  }

  void close(){

   // _imagesController.close();
  //  _idController.close();


  }
}