import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ticket_api/ticket_api.dart';
import 'package:ticket_app/core/provider/dio.dart';

part 'ticket_api.g.dart';

@Riverpod(keepAlive: true)
TicketApiClient ticketApi(TicketApiRef ref) => TicketApiClient(
      ref.watch(dioProvider),
      baseUrl: 'https://api.ticket-system.yumnumm.dev/',
    );
