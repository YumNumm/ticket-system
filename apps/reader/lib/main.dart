import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:ticket_reader/core/app.dart';
import 'package:ticket_reader/core/env/env.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: Env.supabaseUrl,
    anonKey: Env.supabaseAnonKey,
    debug: kDebugMode,
  );

  await GoogleFonts.pendingFonts([
    GoogleFonts.robotoMono(
      fontWeight: FontWeight.w200,
    ),
    GoogleFonts.robotoMono(
      fontWeight: FontWeight.w400,
    ),
  ]);

  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
