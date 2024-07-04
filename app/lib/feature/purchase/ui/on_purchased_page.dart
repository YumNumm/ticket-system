import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ticket_app/feature/purchase/data/purchase_repository.dart';

class OnPurchasedRoute extends GoRouteData {
  const OnPurchasedRoute({
    required this.sessionId,
  });

  final String sessionId;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return OnPurchasedPage(
      sessionId: sessionId,
    );
  }
}

class OnPurchasedPage extends StatelessWidget {
  const OnPurchasedPage({
    required this.sessionId,
    super.key,
  });
  final String sessionId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _Body(
        sessionId: sessionId,
      ),
    );
  }
}

class _Body extends HookConsumerWidget {
  const _Body({
    required this.sessionId,
  });
  final String sessionId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repository = ref.watch(purchaseRepositoryProvider);
    // ignore: discarded_futures
    final onPurchasedFuture = useMemoized(
      () async => repository.onPurchased(sessionId: sessionId),
    );
    final onPurchasedSnapshot = useFuture(onPurchasedFuture);

    if (onPurchasedSnapshot.hasData) {
      return const Center(
        child: Column(
          children: [
            Icon(
              Icons.check_circle,
              size: 48,
              color: Colors.blueAccent,
            ),
            SizedBox(height: 16),
            Text(
              '購入が完了しました！🎉',
            ),
          ],
        ),
      );
    }
    if (onPurchasedSnapshot.hasError) {
      return const Center(
        child: Column(
          children: [
            Icon(
              Icons.error,
              size: 48,
              color: Colors.redAccent,
            ),
            SizedBox(height: 16),
            Text(
              '購入セッションの完了に失敗しました😢\n'
              'ページをリロードして再度お試し下さい。\n'
              '問題が解決しない場合はお問い合わせ下さい。',
            ),
          ],
        ),
      );
    }

    return const Center(
      child: Column(
        children: [
          CircularProgressIndicator.adaptive(),
          SizedBox(height: 16),
          Text(
            '購入セッションを完了しています...\n'
            'しばらくお待ち下さい...',
          ),
        ],
      ),
    );
  }
}
