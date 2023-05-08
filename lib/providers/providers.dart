import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../routing/routing.dart';

part 'providers.g.dart';

@Riverpod(keepAlive: true)
GoRouter router(RouterRef ref) {
  return RouterBuilder().build();
}
