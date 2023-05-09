import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../routing/builder.dart';

part 'providers.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  return const RouterBuilder().build();
}
