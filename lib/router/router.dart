import 'package:go_router/go_router.dart';
import 'package:sneakers_shop_ui/presentation/screens/home_screen.dart';
import 'package:sneakers_shop_ui/presentation/screens/welcome_screen.dart';

GoRouter router = GoRouter(
  initialLocation: NamedRoutes.welcome.routeName,
  routes: [
    GoRoute(path: NamedRoutes.welcome.routeName, builder: (_, state) => const WelcomeScreen()),
    GoRoute(path: NamedRoutes.home.routeName, builder: (_, state) => const HomeScreen()),
  ],
);

enum NamedRoutes {
  welcome('/welcome'),
  home('/home');

  final String routeName;
  const NamedRoutes(this.routeName);
}
