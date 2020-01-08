import 'package:flutter/material.dart';
import 'package:movie_app_bloc/blocs/imagesController.dart';
import 'package:movie_app_bloc/blocs/movies_controller.dart';

class ApplicationStateProvider extends InheritedWidget{

  ImagesController _imagesController;
  MoviesController _moviesController;

  ApplicationStateProvider({Key key, Widget child})
      : super(key: key, child: child){

    _imagesController = ImagesController();
    _moviesController = MoviesController();

  }


  @override
  bool updateShouldNotify(_) => true;

  static ApplicationStateProvider of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(ApplicationStateProvider)
    as ApplicationStateProvider);
  }


  ImagesController get imagesController => _imagesController;
  MoviesController get moviesController => _moviesController;

}