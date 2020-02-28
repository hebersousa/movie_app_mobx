import 'package:mobx/mobx.dart';
import 'dart:async';
import 'package:movie_app_mobx/api.dart';
import 'package:movie_app_mobx/models/movie.dart';

part 'movies_controller.g.dart';


class MoviesController = MoviesControllerBase with _$MoviesController;

abstract class MoviesControllerBase with Store {


  API _api = API();

  @observable
  ObservableList<Movie> movies = ObservableList();

  @observable
  String busca = "";

  @observable
  bool loading = false;

  bool _endLoading = false;
  int _page = 0;


  @action
  buscar(String text) {
    busca = text;
  }



  MoviesControllerBase(){

    autorun((_) {

      if(busca.isNotEmpty){
        print('$busca $_page ');

        movies = ObservableList<Movie>();
        _endLoading = false;
        _page = 0;


        loadMore();
      }else{
        movies = ObservableList<Movie>();
      }

    });



  }

@action
  Future<Null> loadMore() async{


    if(busca.length > 0)

      if(!loading  && !_endLoading ) {

        loading = true;

        _page++;


        List<Movie> list = await _api.get(busca, _page);


        loading = false;

        if (list.isEmpty) {
          _endLoading = true;
          //  _movies.addError("sem resultado");
        }

        if(busca.length >0) {


          movies.addAll( list );

        }

      }

  }


  void dispose(){
    // _movies.close();
    //  _busca.close();
    //  _loading.close();
  }
}
