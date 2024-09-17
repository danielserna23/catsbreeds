import 'package:catbreeds/infrastructure/datasources/catsbreeds_datasource.dart';
import 'package:catbreeds/infrastructure/repositories/cats_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final catsRepositoryprovider = Provider((ref) {
  return CatsRepositoryImpl(CatsbreedsDatasource());
});
