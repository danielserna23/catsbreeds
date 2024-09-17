import 'package:catbreeds/domain/entities/cat_entity.dart';
import 'package:catbreeds/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/detail',
      name: CatDetailScreen.name,
      builder: (context, state) {
        final cat = state.extra as Cat;
        return CatDetailScreen(cat: cat);
      },
    ),
  ],
);
