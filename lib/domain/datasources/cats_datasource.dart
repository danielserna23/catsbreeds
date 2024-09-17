import 'package:catbreeds/domain/entities/cat_entity.dart';

abstract class CatsDatasource {
  Future<List<Cat>> getCats();
}
