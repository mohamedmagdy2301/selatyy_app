import 'package:selaty/core/constants/constants.dart';
import 'package:selaty/core/local_storage/shared_preferences_manager.dart';
import 'package:selaty/features/home/data/models/categories_model.dart';

abstract class HomeLocalSource {
  Future<List<Categories>> viewCategories();
}

class HomeLocalSourceImple extends HomeLocalSource {
  @override
  Future<List<Categories>> viewCategories() async {
    List<Categories> categoriesList =
        await SharedPreferencesManager.getData(key: categoriesKey) ?? [];
    return categoriesList;
  }
}
