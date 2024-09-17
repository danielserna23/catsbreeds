import 'package:catbreeds/domain/entities/cat_entity.dart';
import 'package:catbreeds/domain/repositories/cats_repository.dart';
import 'package:catbreeds/infrastructure/datasources/catsbreeds_datasource.dart';

class CatsRepositoryImpl extends CatsRepository {
  final CatsbreedsDatasource catsbreedsDatasource;

  CatsRepositoryImpl(this.catsbreedsDatasource);
  @override
  Future<List<Cat>> getCats() {
    return catsbreedsDatasource.getCats();
  }
}
