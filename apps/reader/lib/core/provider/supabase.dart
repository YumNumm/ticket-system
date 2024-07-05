import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:ticket_reader/core/env/env.dart';

part 'supabase.g.dart';

@Riverpod(keepAlive: true)
SupabaseClient supabase(SupabaseRef ref) => SupabaseClient(
      Env.supabaseUrl,
      Env.supabaseAnonKey,
    );
