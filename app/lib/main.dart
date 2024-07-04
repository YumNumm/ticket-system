import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:ticket_app/core/app.dart';
import 'package:ticket_app/core/env/env.dart';

Future<void> main() async {
  if (kIsWeb) {
    // ignore: prefer_const_constructors
    setUrlStrategy(PathUrlStrategy());
  }
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: Env.supabaseUrl,
    anonKey: Env.supabaseAnonKey,
    debug: kDebugMode,
  );

  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
