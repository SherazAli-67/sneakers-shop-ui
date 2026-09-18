import 'package:go_router/go_router.dart';
import 'package:sneakers_shop_ui/constants/string_const.dart';
import 'package:sneakers_shop_ui/presentation/screens/home_screen.dart';
import 'package:sneakers_shop_ui/presentation/screens/main_shell_screen.dart';
import 'package:sneakers_shop_ui/presentation/screens/placeholder_screen.dart';
import 'package:sneakers_shop_ui/presentation/screens/product_details_screen.dart';
import 'package:sneakers_shop_ui/presentation/screens/welcome_screen.dart';

GoRouter router = GoRouter(
  initialLocation: NamedRoutes.welcome.routeName,
  routes: [
    GoRoute(path: NamedRoutes.welcome.routeName, builder: (_, state) => const WelcomeScreen()),
    StatefulShellRoute.indexedStack(
      builder: (_, state, navigationShell) => MainShellScreen(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(path: NamedRoutes.home.routeName, builder: (_, state) => const HomeScreen()),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: NamedRoutes.search.routeName,
              builder: (_, state) => const PlaceholderScreen(title: StringConst.search),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: NamedRoutes.favorites.routeName,
              builder: (_, state) => const PlaceholderScreen(title: StringConst.favorites),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: NamedRoutes.profile.routeName,
              builder: (_, state) => const PlaceholderScreen(title: StringConst.profile),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: '${NamedRoutes.product.routeName}/:id',
      builder: (_, state) => ProductDetailsScreen(productId: state.pathParameters['id']!),
    ),
  ],
);

enum NamedRoutes {
  welcome('/welcome'),
  home('/home'),
  search('/search'),
  favorites('/favorites'),
  profile('/profile'),
  product('/product');

  final String routeName;
  const NamedRoutes(this.routeName);
}
