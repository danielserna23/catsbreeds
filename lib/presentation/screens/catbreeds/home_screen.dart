import 'package:animate_do/animate_do.dart';
import 'package:catbreeds/presentation/providers/cats/cats_providers.dart';
import 'package:catbreeds/presentation/providers/shared/theme_provider.dart';
import 'package:catbreeds/presentation/screens/screens.dart';
import 'package:catbreeds/presentation/widgets/cats_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerWidget {
  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSearching = ref.watch(isSearchingProvider);
    TextEditingController searchController = TextEditingController();
    final searchQueryNotifier = ref.read(searchQueryProvider.notifier);

    final colors = Theme.of(context).colorScheme;
    final bool isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              leading: IconButton(
                  icon: isDarkMode
                      ? const Icon(Icons.dark_mode_outlined)
                      : const Icon(Icons.light_mode_outlined),
                  onPressed: () {
                    ref.read(themeNotifierProvider.notifier).toogleDarkMode();
                  }),
              title: isSearching
                  ? TextField(
                      controller: searchController,
                      autofocus: true,
                      decoration: const InputDecoration(
                        hintText: 'Buscar por raza...',
                        border: InputBorder.none,
                      ),
                      onChanged: (value) {
                        searchQueryNotifier.state = value;
                      },
                    )
                  : const Text('Cats Beeds'),
              centerTitle: true,
              floating: true,
              forceElevated: innerBoxIsScrolled,
              actions: [
                IconButton(
                  icon: Icon(
                    isSearching ? Icons.close : Icons.search,
                    color: colors.primary,
                  ),
                  onPressed: () {
                    if (isSearching) {
                      searchController.clear();
                      searchQueryNotifier.state = '';
                      ref.read(isSearchingProvider.notifier).state = false;
                    } else {
                      ref.read(isSearchingProvider.notifier).state = true;
                    }
                  },
                ),
              ],
            )
          ],
          body: const Center(child: _HomeView()),
        ),
      ),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    ref.read(catsbreedsProvider.notifier).getCatsBreeds();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final catList = ref.watch(filteredCatsProvider);

    if (catList.isEmpty) {
      if (ref.watch(searchQueryProvider).isEmpty) {
        return const Center(child: CircularProgressIndicator());
      } else {
        return const Center(
            child:
                Text('No se encontraron gatos que coincidan con la búsqueda.'));
      }
    }
    return ListView.builder(
      itemCount: catList.length,
      itemBuilder: (context, index) {
        final cat = catList[index];
        return FadeInUp(
          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        cat.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          context.pushNamed(CatDetailScreen.name, extra: cat);
                        },
                        child: const Text(
                          'Más...',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: ImageWidget(cat: cat),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 30),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(cat.origin, style: textStyle.bodyLarge),
                          const Spacer(),
                          Text('Intelligence: ${cat.intelligence}',
                              style: textStyle.bodyLarge),
                          const SizedBox(height: 20),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        );
      },
    );
  }
}
