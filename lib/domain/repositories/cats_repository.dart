import 'package:catbreeds/domain/entities/cat_entity.dart';

abstract class CatsRepository {
  Future<List<Cat>> getCats();
}
