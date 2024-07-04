import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ticket_app/feature/auth/data/supabase_auth.dart';
import 'package:url_launcher/url_launcher.dart';

class BuyTicketCard extends ConsumerWidget {
  const BuyTicketCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () async {
          final user = ref.read(currentUserProvider)!;
          final email = user.email;
          final uid = user.id;
          final url = 'https://buy.stripe.com/00gdRU6XC54b2Lm6oo?'
              'prefilled_email=${Uri.encodeComponent(email ?? "")}'
              '&client_reference_id=$uid'
              '&prefilled_promo_code=DAEJX5PV';

          final uri = Uri.parse(url);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri);
          }
        },
        child: const Padding(
          padding: EdgeInsets.all(24),
          child: Row(
            children: [
              Icon(Icons.money),
              SizedBox(width: 16),
              Text('チケットを購入する'),
            ],
          ),
        ),
      ),
    );
  }
}
