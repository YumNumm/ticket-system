import 'dart:convert';
import 'dart:developer';

import 'package:collection/collection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ticket_database_types/models/attendances.dart';
import 'package:ticket_reader/feature/attendance/data/attendance_repository.dart';

part 'attendance_notifier.g.dart';

@riverpod
class AttendanceNotifier extends _$AttendanceNotifier {
  @override
  Future<List<Attendances>> build(String userId) async {
    final repository = ref.watch(attendanceRepositoryProvider);

    return repository.getAttendances(userId: userId);
  }

  Future<void> addAttendance({required AttendanceStatus nextStatus}) async {
    // 直近の登録と同じステータスの場合は登録しない
    if (state case AsyncData(:final value)) {
      final lastStatus =
          value.sortedBy<DateTime>((e) => e.createdAt).lastOrNull?.status;
      if (lastStatus == nextStatus) {
        throw Exception('Already $nextStatus');
      }
    }
    final repository = ref.read(attendanceRepositoryProvider);
    final response = await repository.insertAttendance(
      nextStatus: nextStatus,
      userid: userId,
    );
    log('response: $response');
    if (state case AsyncData(:final value)) {
      state = AsyncData([...value, response]);
      log('state: ${const JsonEncoder.withIndent('  ').convert(state.value)}');
    }
  }

  Future<void> deleteAttendance({required String attendanceId}) async {
    final repository = ref.read(attendanceRepositoryProvider);
    await repository.deleteAttendance(attendanceId: attendanceId);
    if (state case AsyncData(:final value)) {
      state = AsyncData(
        value.where((element) => element.id != attendanceId).toList(),
      );
    }
  }
}
