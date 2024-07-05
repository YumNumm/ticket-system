import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:ticket_database_types/models/purchases.dart';

part 'ticket_repository.g.dart';

@Riverpod(keepAlive: true)
TicketRepository ticketRepository(TicketRepositoryRef ref) => TicketRepository(
      client: Supabase.instance.client,
    );

class TicketRepository {
  TicketRepository({
    required SupabaseClient client,
  }) : _client = client;

  final SupabaseClient _client;

  Future<Purchases?> ticket({
    required String userId,
  }) async {
    final response = await _client
        .from('purchases')
        .select()
        .eq('user_id', userId)
        .maybeSingle()
        .withConverter<Purchases?>(
          (r) => r != null ? Purchases.fromJson(r) : null,
        );
    return response;
  }
}
