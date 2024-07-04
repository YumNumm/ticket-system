import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ticket_app/feature/auth/data/supabase_auth.dart';
import 'package:ticket_app/feature/ticket/data/ticket_repository.dart';
import 'package:ticket_database/models/purchases.dart';

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
