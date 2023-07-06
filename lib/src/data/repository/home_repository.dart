import 'package:flutter_mini_project/src/data/model/home_model.dart';
import 'package:flutter_mini_project/src/data/provider/firebase_db.dart';

class HomeRepository {
  static Stream<List<HomeModel>> fetchTodos() => HomeApi.getTodos();
}
