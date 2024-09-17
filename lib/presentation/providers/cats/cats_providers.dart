import 'package:catbreeds/domain/entities/cat_entity.dart';
import 'package:catbreeds/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final catsbreedsProvider =
    StateNotifierProvider<CatsNotifier, List<Cat>>((ref) {
  final fetchMoreCats = ref.watch(catsRepositoryprovider).getCats;
  return CatsNotifier(fetchCats: fetchMoreCats);
});

final searchQueryProvider = StateProvider<String>((ref) => '');

final isSearchingProvider = StateProvider<bool>((ref) => false);

typedef CatCallback = Future<List<Cat>> Function();
typedef CatDetilCallback = Future<List<Cat>> Function({String id});

class CatsNotifier extends StateNotifier<List<Cat>> {
  CatCallback fetchCats;
  CatsNotifier({
    required this.fetchCats,
  }) : super([]);

  Future<void> getCatsBreeds() async {
    final List<Cat> cats = await fetchCats();
    state = [...state, ...cats];
  }
}

final filteredCatsProvider = Provider<List<Cat>>((ref) {
  final cats = ref.watch(catsbreedsProvider);
  final searchQuery = ref.watch(searchQueryProvider).toLowerCase();

  if (searchQuery.isEmpty || searchQuery.length < 2) {
    return cats; // Retorna todos si la búsqueda es vacía o tiene menos de 3 letras
  }

  return cats
      .where((cat) => cat.name.toLowerCase().contains(searchQuery))
      .toList();
});
