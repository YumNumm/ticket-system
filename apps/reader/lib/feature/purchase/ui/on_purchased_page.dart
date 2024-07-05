import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:ticket_reader/core/router/router.dart';
import 'package:ticket_reader/feature/purchase/data/purchase_repository.dart';

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
      body: Center(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: _OnPurchaseHandlerView(
              sessionId: sessionId,
            ),
          ),
        ),
      ),
    );
  }
}

class _OnPurchaseHandlerView extends HookConsumerWidget {
  const _OnPurchaseHandlerView({
    required this.sessionId,
  });
  final String sessionId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repository = ref.watch(purchaseRepositoryProvider);
    // ignore: discarded_futures
    final onPurchasedFuture = useMemoized(
      () async => repository.onPurchased(
        sessionId: sessionId,
        authorization:
            Supabase.instance.client.auth.currentSession!.accessToken,
      ),
    );
    final onPurchasedSnapshot = useFuture(onPurchasedFuture);
    log('onPurchasedSnapshot: $onPurchasedSnapshot');

    if (onPurchasedSnapshot.hasData) {
      return const _OnVerifySuccessedView();
    }
    if (onPurchasedSnapshot.hasError) {
      final error = onPurchasedSnapshot.error;
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.error,
            size: 48,
            color: Colors.redAccent,
          ),
          const SizedBox(height: 16),
          const Text(
            '購入セッションの完了に失敗しました😢\n'
            'ページをリロードして再度お試し下さい。\n'
            '問題が解決しない場合はお問い合わせ下さい。',
          ),
          if (kDebugMode)
            if (error is DioException)
              Column(
                children: [
                  const SizedBox(height: 8),
                  Text(
                    'エラーコード: ${error.response?.statusCode} '
                    '${error.response?.statusMessage}\n'
                    'エラーメッセージ: ${error.response?.data}',
                  ),
                ],
              ),
          const SizedBox(height: 8),
          FilledButton.tonal(
            onPressed: () => const HomeRoute().go(context),
            child: const Text('ホームに戻る'),
          ),
        ],
      );
    }

    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircularProgressIndicator.adaptive(),
        SizedBox(height: 16),
        Text(
          '購入セッションを完了しています...\n'
          'しばらくお待ち下さい...',
        ),
      ],
    );
  }
}

class _OnVerifySuccessedView extends HookWidget {
  const _OnVerifySuccessedView();

  @override
  Widget build(BuildContext context) {
    // 5秒後にホーム画面に遷移
    final timer = useState(5);
    useEffect(
      () {
        final timer = Timer.periodic(
          const Duration(seconds: 1),
          (timer) {
            if (timer.tick == 5) {
              timer.cancel();
              const HomeRoute().go(context);
            }
          },
        );
        return timer.cancel;
      },
      [],
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.check_circle,
          size: 48,
          color: Colors.blueAccent,
        ),
        const SizedBox(height: 16),
        Text(
          '購入が完了しました！🎉\n'
          '${timer.value}秒後にホーム画面に遷移します...',
        ),
      ],
    );
  }
}
