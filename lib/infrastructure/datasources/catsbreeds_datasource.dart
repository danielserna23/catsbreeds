import 'package:catbreeds/config/constants/environment.dart';
import 'package:catbreeds/domain/datasources/cats_datasource.dart';
import 'package:catbreeds/domain/entities/cat_entity.dart';
import 'package:catbreeds/infrastructure/mappers/cat_mapper.dart';
import 'package:catbreeds/infrastructure/models/cat_breeds_response.dart';
import 'package:dio/dio.dart';

class CatsbreedsDatasource extends CatsDatasource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.thecatapi.com/v1',
      headers: {
        'x-api-key': Environment.theCatApiKey,
      },
    ),
  );

  @override
  Future<List<Cat>> getCats() async {
    final response = await dio.get('/breeds');
    if (response.statusCode != 200) {
      throw Exception('Error al cargar los datos');
    }
    List<dynamic> data = response.data;
    final catsResponse =
        data.map((json) => CatBreedsResponse.fromJson(json)).toList();
    final List<Cat> cats =
        catsResponse.map((data) => CatMapper.catToEntity(data)).toList();

    return cats;
  }
}
