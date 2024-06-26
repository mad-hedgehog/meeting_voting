import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meeting_voting/src/presentation/common/provider.dart';
import 'package:meeting_voting/src/presentation/feature/login/view/login_page.dart';
import 'package:meeting_voting/src/presentation/feature/main/view/main_page.dart';
import 'package:meeting_voting/src/presentation/feature/sign_up/view/sign_up_page.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'route.g.dart';

@riverpod
class Router extends _$Router {
  @override
  GoRouter build() {
    return GoRouter(
      initialLocation: '/login',
      redirect: (context, state) async {
        if (state.fullPath == '/sign-up') return null;

        if (ref.read(isAuthProvider)) {
          return null;
        }

        final token = await ref.read(readTokenProvider.future);

        if (token == null) {
          return '/login';
        }

        try {
          await ref.read(verificationProvider(token).future);
        } catch (e) {
          await ref.read(deleteTokenProvider.future);
        }

        if (ref.read(isAuthProvider)) {
          return null;
        }

        return '/login';
      },
      routes: [
        GoRoute(
          path: '/login',
          name: LoginPage.routeName,
          redirect: (context, state) {
            if (ref.read(isAuthProvider)) {
              return '/vote';
            }

            return null;
          },
          pageBuilder: (context, state) {
            return buildPageWithFadeTransition(
              context: context,
              state: state,
              child: const LoginPage(),
            );
          },
        ),
        GoRoute(
          path: '/sign-up',
          name: SignUpPage.routeName,
          pageBuilder: (context, state) {
            return buildPageWithFadeTransition(
              context: context,
              state: state,
              child: const SignUpPage(),
            );
          },
        ),
        GoRoute(
          path: '/vote',
          pageBuilder: (context, state) {
            return buildPageWithFadeTransition(
              context: context,
              state: state,
              child: const MainPage(path: 'vote'),
            );
          },
        ),
        GoRoute(
          path: '/record',
          pageBuilder: (context, state) {
            return buildPageWithFadeTransition(
              context: context,
              state: state,
              child: const MainPage(path: 'record'),
            );
          },
        ),
        GoRoute(
          path: '/setting',
          pageBuilder: (context, state) {
            return buildPageWithFadeTransition(
              context: context,
              state: state,
              child: const MainPage(path: 'setting'),
            );
          },
        ),
      ],
    );
  }
}

CustomTransitionPage<T> buildPageWithFadeTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    name: state.name,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: IgnorePointer(ignoring: animation.value < 1, child: child),
      );
    },
  );
}
