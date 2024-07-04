import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

part 'purchase_repository.g.dart';

@Riverpod(keepAlive: true)
PurchaseRepository purchaseRepository(PurchaseRepositoryRef ref) =>
    PurchaseRepository(
      supabase: Supabase.instance.client,
    );

class PurchaseRepository {
  PurchaseRepository({required SupabaseClient supabase}) : _supabase = supabase;

  final SupabaseClient _supabase;

  Future<bool> transitToPurchasePage({
    required String email,
    required String uid,
    String? promoCode,
  }) async {
    final url = 'https://buy.stripe.com/00gdRU6XC54b2Lm6oo?'
        'prefilled_email=${Uri.encodeComponent(email)}'
        '&client_reference_id=$uid'
        '&prefilled_promo_code=DAEJX5PV';

    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      return launchUrl(uri);
    }
    throw Exception('Failed to launch the URL');
  }

  Future<void> onPurchased({
    required String sessionId,
  }) async {
    final response = await _supabase.functions.invoke(
      'on_purchased',
      queryParameters: {
        'session_id': sessionId,
      },
    );
    final data = response.data as Map<String, dynamic>;
    if (response.status != 200) {
      throw Exception('Failed to check the purchase status: $data');
    }
    return;
  }
}
