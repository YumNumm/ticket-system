import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ticket_database_types/models/profiles.dart';
import 'package:ticket_database_types/models/purchases.dart';
import 'package:ticket_reader/core/env/env.dart';
import 'package:ticket_reader/feature/profile/data/profile_notifier.dart';
import 'package:ticket_reader/feature/purchase/ui/component/buy_ticket_card.dart';
import 'package:ticket_reader/feature/ticket/data/ticket_notifier.dart';
import 'package:url_launcher/link.dart';

class TicketSummaryView extends ConsumerWidget {
  const TicketSummaryView({super.key});
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
      AsyncData(:final value) => _TicketSummaryViewBody(profile: value),
    };
  }
}

class _TicketSummaryViewBody extends ConsumerWidget {
  const _TicketSummaryViewBody({
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
      AsyncData(:final value) when value != null => TicketView(
          purchase: value,
          profile: profile,
        ),
      AsyncData() => const BuyTicketCard(),
    };
  }
}

class TicketView extends StatelessWidget {
  const TicketView({
    required this.purchase,
    required this.profile,
    super.key,
  });

  final Purchases purchase;
  final Profiles profile;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final card = TicketCard(profile: profile, purchase: purchase);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
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
        const SizedBox(height: 16),
        const SizedBox(height: 16),
        Link(
          uri: Uri.parse(
            '${Env.apiBaseUrl}/ticket/apple?ticket_id=${purchase.sessionId}&user_id=${profile.id}',
          ),
          builder: (context, followLink) => FloatingActionButton.extended(
            label: const Text('Apple Walletに追加する'),
            onPressed: () async => followLink?.call(),
            icon: const Icon(Icons.apple),
          ),
        ),
      ],
    );
  }
}

class TicketCard extends StatelessWidget {
  const TicketCard({
    required this.profile,
    required this.purchase,
    this.showAvatar = true,
    super.key,
  });

  final Profiles profile;
  final Purchases purchase;
  final bool showAvatar;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Card(
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
                colorScheme.surfaceContainerLowest,
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
                        profile.comment ?? '',
                        style: GoogleFonts.robotoMono(
                          fontWeight: FontWeight.w400,
                          color:
                              colorScheme.onPrimaryContainer.withOpacity(0.8),
                        ),
                      ),
                    ),
                    const SizedBox(height: 48),
                    Text(
                      "No. ${purchase.id.toString().padLeft(5, '0')}",
                      style: GoogleFonts.robotoMono(
                        fontSize: 16,
                        fontWeight: FontWeight.w200,
                        letterSpacing: 2,
                        shadows: [
                          Shadow(
                            color:
                                colorScheme.onPrimaryContainer.withOpacity(0.4),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              if (showAvatar) AvatarView(profile: profile),
            ],
          ),
        ),
      ),
    );
  }
}

class AvatarView extends HookConsumerWidget {
  const AvatarView({
    required this.profile,
    super.key,
  });

  final Profiles profile;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return PhysicalModel(
      color: colorScheme.primaryContainer,
      elevation: 1,
      shape: BoxShape.circle,
      child: CircleAvatar(
        radius: 48,
        backgroundImage: profile.avatarName != null
            ? NetworkImage(
                '${Env.supabaseUrl}/storage/v1/object/public/${profile.avatarName!}',
              )
            : null,
        child: profile.avatarName == null
            ? Icon(
                Icons.person,
                size: 48,
                color: colorScheme.onPrimaryContainer,
              )
            : null,
      ),
    );
  }
}
