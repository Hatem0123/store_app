import 'package:store_pr1/models/product_model.dart';

abstract class App_state{}

class App_init_state  extends App_state{}


class App_screen_succes_state extends App_state {
  final dynamic model;
  App_screen_succes_state({this.model});
}


class app_error_state extends App_state{

  final String? err;

  app_error_state({this.err});
}