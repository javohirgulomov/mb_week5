import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

CustomTransitionPage<void> buildPage(Widget child, GoRouterState state) {
  return CustomTransitionPage<void>(
    key: state.pageKey,
    child: child,
    transitionDuration: const Duration(milliseconds: 500),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final slideAnimation = Tween<Offset>(
        begin: const Offset(1, 0),
        end: Offset.zero,
      ).animate(animation);

      final scaleAnimation = Tween<double>(
        begin: 0.8,
        end: 1.0,
      ).animate(animation);

      return SlideTransition(
        position: slideAnimation,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: child,
        ),
      );
    },
  );
}

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      pageBuilder: (context, state) =>
          buildPage(const HomeScreen(), state),
    ),
    GoRoute(
      path: '/details',
      name: 'details',
      pageBuilder: (context, state) =>
          buildPage(const DetailsScreen(), state),
    ),
    GoRoute(
      path: '/settings',
      name: 'settings',
      pageBuilder: (context, state) =>
          buildPage(const SettingsScreen(), state),
    ),
  ],
);

void main() {
  runApp(
    MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    ),
  );
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => context.pushNamed('details'),
              child: const Text('Open Details'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => context.pushNamed('settings'),
              child: const Text('Open Settings'),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.pop(),
          child: const Text('Back'),
        ),
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.pop(),
          child: const Text('Back'),
        ),
      ),
    );
  }
}