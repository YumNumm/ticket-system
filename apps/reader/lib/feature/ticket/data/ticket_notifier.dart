import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ticket_database_types/models/purchases.dart';
import 'package:ticket_reader/feature/auth/data/supabase_auth.dart';
import 'package:ticket_reader/feature/ticket/data/ticket_repository.dart';

part 'ticket_notifier.g.dart';

@riverpod
class TicketNotifier extends _$TicketNotifier {
  @override
  Future<Purchases?> build() async {
    final repository = ref.watch(ticketRepositoryProvider);
    final currentUser = ref.watch(currentUserProvider);
    if (currentUser == null) {
      throw Exception('User is not authenticated');
    }
    return repository.ticket(userId: currentUser.id);
  }
}

@riverpod
Future<Purchases?> ticketFromUserId(
  TicketFromUserIdRef ref,
  String userId,
) async {
  final repository = ref.watch(ticketRepositoryProvider);
  return repository.ticket(userId: userId);
}
