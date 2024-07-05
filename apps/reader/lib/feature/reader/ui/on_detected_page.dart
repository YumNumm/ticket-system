import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ticket_database_types/models/attendances.dart';
import 'package:ticket_database_types/models/profiles.dart';
import 'package:ticket_database_types/models/purchases.dart';
import 'package:ticket_reader/feature/attendance/data/attendance_notifier.dart';
import 'package:ticket_reader/feature/profile/data/profile_notifier.dart';
import 'package:ticket_reader/feature/ticket/data/ticket_notifier.dart';
import 'package:ticket_reader/feature/ticket/ui/ticket_summary_view.dart';

class OnDetectedRoute extends GoRouteData {
  const OnDetectedRoute({
    required this.userId,
  });

  final String userId;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return OnDetectedPage(userId: userId);
  }
}

class OnDetectedPage extends StatelessWidget {
  const OnDetectedPage({
    required this.userId,
    super.key,
  });

  final String userId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _Body(userId: userId),
    );
  }
}

class _Body extends ConsumerWidget {
  const _Body({
    required this.userId,
  });
  final String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ticketState = ref.watch(ticketFromUserIdProvider(userId));
    final profileState = ref.watch(profileFromIdProvider(userId));
    return switch ((ticketState, profileState)) {
      (AsyncLoading(), _) || (_, AsyncLoading()) => const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      (AsyncData(value: final ticket), AsyncData(value: final profile))
          when ticket != null =>
        _DetectedResultView(profile: profile, ticket: ticket),
      (AsyncError(:final error), _) ||
      (_, AsyncError(:final error)) =>
        Text('Error: $error'),
      _ => const Center(
          child: Text('No matched data! チケット情報が見つかりませんでした'),
        ),
    };
  }
}

class _DetectedResultView extends ConsumerWidget {
  const _DetectedResultView({
    required this.profile,
    required this.ticket,
  });

  final Profiles profile;
  final Purchases ticket;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final attendanceState =
        ref.watch(attendanceNotifierProvider(ticket.userId));
    return Column(
      children: [
        TicketCard(
          profile: profile,
          purchase: ticket,
          showAvatar: false,
        ),
        const SizedBox(height: 8),
        const Divider(),
        const SizedBox(height: 8),
        switch (attendanceState) {
          AsyncLoading() => const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          AsyncError(:final error) => Text('Error: $error'),
          AsyncData(:final value) => () {
              final lastAttendance =
                  value.sortedBy((e) => e.createdAt).lastOrNull;

              return Column(
                children: [
                  Card(
                    clipBehavior: Clip.antiAlias,
                    color: lastAttendance?.status.color.withOpacity(0.2),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: lastAttendance != null
                            ? [
                                Chip(
                                  label: Text(
                                    lastAttendance.status.displayName,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  backgroundColor: lastAttendance.status.color,
                                ),
                                const SizedBox(width: 8),
                                Flexible(
                                  child: Text(
                                    '${lastAttendance.createdAt.toLocal()}',
                                  ),
                                ),
                              ]
                            : [
                                const Icon(Icons.close),
                                const SizedBox(width: 8),
                                const Flexible(child: Text('入場・退場記録はありません')),
                              ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      for (final type in AttendanceStatus.values)
                        Expanded(
                          child: _AttendanceRecordButton(
                            status: type,
                            onPressed: (lastAttendance?.status == type ||
                                    (lastAttendance == null &&
                                        type == AttendanceStatus.leave))
                                ? null
                                : () async {
                                    unawaited(HapticFeedback.selectionClick());
                                    unawaited(
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return const Center(
                                            child: CircularProgressIndicator
                                                .adaptive(),
                                          );
                                        },
                                      ),
                                    );
                                    try {
                                      await ref
                                          .read(
                                            attendanceNotifierProvider(
                                              ticket.userId,
                                            ).notifier,
                                          )
                                          .addAttendance(
                                            nextStatus: type,
                                          );
                                      unawaited(HapticFeedback.heavyImpact());
                                      if (context.mounted) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content:
                                                Text('記録しました: ${type.name}'),
                                          ),
                                        );
                                      }
                                    } on Exception catch (e) {
                                      if (context.mounted) {
                                        await showDialog<void>(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: const Text('Error'),
                                              content: Text('Error: $e'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text('OK'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      }
                                    } finally {
                                      if (context.mounted &&
                                          Navigator.canPop(context)) {
                                        Navigator.pop(context);
                                        if (Navigator.canPop(context)) {
                                          Navigator.pop(context);
                                        }
                                      }
                                    }
                                  },
                          ),
                        ),
                    ],
                  ),
                ],
              );
            }()
        },
      ],
    );
  }
}

class _AttendanceRecordButton extends StatelessWidget {
  const _AttendanceRecordButton({
    required this.status,
    required this.onPressed,
  });
  final AttendanceStatus status;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      foregroundDecoration: onPressed == null
          ? const BoxDecoration(
              color: Colors.grey,
              backgroundBlendMode: BlendMode.saturation,
            )
          : null,
      child: Card(
        color: switch (status) {
          AttendanceStatus.present => Colors.green,
          AttendanceStatus.leave => Colors.red,
        }
            .withOpacity(0.4),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 32,
              horizontal: 16,
            ),
            child: Row(
              children: [
                Icon(
                  switch (status) {
                    AttendanceStatus.present => Icons.check,
                    AttendanceStatus.leave => Icons.close,
                  },
                  size: 24,
                ),
                const SizedBox(width: 8),
                Flexible(
                  child: Text(
                    status.displayName,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

extension _AttendanceStatusEx on AttendanceStatus {
  String get displayName => switch (this) {
        AttendanceStatus.present => '入場',
        AttendanceStatus.leave => '退場',
      };

  Color get color => switch (this) {
        AttendanceStatus.present => Colors.green,
        AttendanceStatus.leave => Colors.red,
      };
}
