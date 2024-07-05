import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ticket_app/feature/auth/data/supabase_auth.dart';
import 'package:ticket_app/feature/purchase/data/purchase_repository.dart';

class BuyTicketCard extends ConsumerWidget {
  const BuyTicketCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () async {
          final user = ref.read(currentUserProvider)!;
          final email = user.email!;
          final uid = user.id;

          await ref.read(purchaseRepositoryProvider).transitToPurchasePage(
                email: email,
                uid: uid,
                promoCode: 'DAEJX5PV',
              );
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
