import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ticket_api/models/verify_purchase_response.dart';
import 'package:ticket_api/ticket_api.dart';
import 'package:ticket_app/core/provider/ticket_api.dart';
import 'package:url_launcher/url_launcher.dart';

part 'purchase_repository.g.dart';

@Riverpod(keepAlive: true)
PurchaseRepository purchaseRepository(PurchaseRepositoryRef ref) =>
    PurchaseRepository(
      // ignore: avoid_manual_providers_as_generated_provider_dependency
      ticketApiClient: ref.watch(ticketApiProvider),
    );

class PurchaseRepository {
  PurchaseRepository({
    required TicketApiClient ticketApiClient,
  }) : _ticketApiClient = ticketApiClient;

  final TicketApiClient _ticketApiClient;
  Future<bool> transitToPurchasePage({
    required String email,
    required String uid,
    String? promoCode,
  }) async {
    var url = 'https://buy.stripe.com/4gwdRUgyc9kr0DedQR?'
        'prefilled_email=${Uri.encodeComponent(email)}'
        '&client_reference_id=$uid';
    if (promoCode != null) {
      url += '&prefilled_promo_code=$promoCode';
    }

    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      return launchUrl(uri);
    }
    throw Exception('Failed to launch the URL');
  }

  Future<VerifyPurchaseResponse> onPurchased({
    required String sessionId,
    required String authorization,
  }) async {
    final response = await _ticketApiClient.verifyPurchase(
      sessionId: sessionId,
      authorization: authorization,
    );
    log('onPurchased: $response');
    return response.data;
  }
}
