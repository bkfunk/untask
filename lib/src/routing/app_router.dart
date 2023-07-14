import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:untask/src/features/memos/ui/create_memo_view.dart';

import '../features/memos/ui/memo_details_view.dart';
import '../features/memos/ui/memos_list_view.dart';

enum AppRoute { home, memo, memos, create }

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: '/',
        name: AppRoute.home.name,
        builder: (context, state) => const MemosListView(),
      ),
      GoRoute(
        path: '/memos',
        name: AppRoute.memos.name,
        builder: (context, state) => const MemosListView(),
      ),
      GoRoute(
          path: '/memo/:id',
          name: AppRoute.memo.name,
          builder: (context, state) => MemoDetailsView(
                memoID: state.pathParameters['id']!,
              )),
      GoRoute(
        path: '/create',
        name: AppRoute.create.name,
        builder: (context, state) => const CreateMemoView(),
      )
    ],
    // TODO: Add error screen
  );
});
