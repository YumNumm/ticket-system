import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ticket_app/feature/profile/data/profile_notifier.dart';
import 'package:ticket_app/feature/purchase/ui/component/buy_ticket_card.dart';
import 'package:ticket_app/feature/ticket/data/ticket_notifier.dart';
import 'package:ticket_database/models/profiles.dart';
import 'package:ticket_database/models/purchases.dart';

class TicketView extends ConsumerWidget {
  const TicketView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final profileState = ref.watch(profileNotifierProvider);
    return switch (profileState) {
      AsyncLoading() => const Card(
          clipBehavior: Clip.antiAlias,
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Center(
              child: Row(
                children: [
                  CircularProgressIndicator.adaptive(),
                  SizedBox(width: 16),
                  Text('プロフィール情報を確認しています'),
                ],
              ),
            ),
          ),
        ),
      AsyncError(:final error) => Card(
          clipBehavior: Clip.antiAlias,
          color: colorScheme.errorContainer,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              children: [
                Icon(
                  Icons.error,
                  color: colorScheme.onErrorContainer,
                  size: 24,
                ),
                const SizedBox(width: 16),
                Flexible(
                  child: Text(
                    'プロフィール情報の取得に失敗しました\n'
                    'Error: $error',
                    style: TextStyle(
                      color: colorScheme.onErrorContainer,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      AsyncData(:final value) => _TicketView(profile: value),
    };
  }
}

class _TicketView extends ConsumerWidget {
  const _TicketView({
    required this.profile,
  });

  final Profiles profile;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final state = ref.watch(ticketNotifierProvider);
    return switch (state) {
      AsyncLoading() => const Card(
          clipBehavior: Clip.antiAlias,
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Center(
              child: Row(
                children: [
                  CircularProgressIndicator.adaptive(),
                  SizedBox(width: 16),
                  Text('チケットの状況を確認しています'),
                ],
              ),
            ),
          ),
        ),
      AsyncError(:final error) => Card(
          clipBehavior: Clip.antiAlias,
          color: colorScheme.errorContainer,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              children: [
                Icon(
                  Icons.error,
                  color: colorScheme.onErrorContainer,
                  size: 24,
                ),
                const SizedBox(width: 16),
                Flexible(
                  child: Text(
                    'チケットの取得に失敗しました\n'
                    'Error: $error',
                    style: TextStyle(
                      color: colorScheme.onErrorContainer,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      AsyncData(:final value) when value != null => _TicketCard(
          purchase: value,
          profile: profile,
        ),
      AsyncData() => const BuyTicketCard(),
    };
  }
}

class _TicketCard extends StatelessWidget {
  const _TicketCard({
    required this.purchase,
    required this.profile,
  });

  final Purchases purchase;
  final Profiles profile;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final card = Card(
      color: Colors.transparent,
      clipBehavior: Clip.antiAlias,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              colorScheme.primaryContainer,
              Color.lerp(
                colorScheme.primaryContainer,
                colorScheme.surface,
                0.5,
              )!,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Text(
                        profile.name?.isEmpty ?? true
                            ? 'NO NAME'
                            : profile.name!,
                        style: theme.textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: colorScheme.onPrimaryContainer,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Flexible(
                      child: Text(
                        profile.comment?.isEmpty ?? true
                            ? 'NO COMMENT'
                            : profile.comment!,
                        style: theme.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w200,
                          color:
                              colorScheme.onPrimaryContainer.withOpacity(0.7),
                        ),
                      ),
                    ),
                    const SizedBox(height: 48),
                    Text(
                      "No. ${purchase.id.toString().padLeft(4, '0')}",
                      style: GoogleFonts.robotoMono(
                        fontSize: 16,
                        fontWeight: FontWeight.w200,
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              CircleAvatar(
                radius: 48,
                backgroundImage: profile.avatarId != null
                    // TODO(YumNumm): fix url
                    ? NetworkImage(profile.avatarId!)
                    : null,
                child: profile.avatarId == null
                    ? Icon(
                        Icons.person,
                        size: 48,
                        color: colorScheme.onPrimaryContainer,
                      )
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            const SizedBox(width: 16),
            Icon(Icons.check, color: colorScheme.primary, size: 24),
            const SizedBox(width: 16),
            Flexible(
              child: Text(
                'チケット購入済み',
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.primary,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.all(16),
          child: DecoratedBox(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: colorScheme.primaryContainer.withOpacity(0.8),
                  blurRadius: 12,
                ),
              ],
            ),
            child: card,
          ),
        ),
      ],
    );
  }
}
