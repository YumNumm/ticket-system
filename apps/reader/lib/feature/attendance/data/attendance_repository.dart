import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:ticket_database_types/models/attendances.dart';

part 'attendance_repository.g.dart';

@Riverpod(keepAlive: true)
AttendanceRepository attendanceRepository(AttendanceRepositoryRef ref) =>
    AttendanceRepository(
      client: Supabase.instance.client,
    );

class AttendanceRepository {
  AttendanceRepository({
    required SupabaseClient client,
  }) : _client = client;

  final SupabaseClient _client;

  Future<List<Attendances>> getAttendances({
    required String userId,
  }) async =>
      _client
          .from('attendances')
          .select()
          .eq(
            'user_id',
            userId,
          )
          .withConverter(
            (result) => result.map(Attendances.fromJson).toList(),
          );

  Future<Attendances> insertAttendance({
    required AttendanceStatus nextStatus,
    required String userid,
  }) async =>
      _client
          .from('attendances')
          .insert({
            'user_id': userid,
            'status': nextStatus.name,
          })
          .select()
          .single()
          .withConverter(Attendances.fromJson);

  Future<void> deleteAttendance({
    required String attendanceId,
  }) async =>
      _client.from('attendances').delete().eq(
            'id',
            attendanceId,
          );
}
