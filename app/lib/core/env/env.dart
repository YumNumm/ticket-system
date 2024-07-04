// ignore_for_file: avoid_classes_with_only_static_members

import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(
  obfuscate: true,
  requireEnvFile: true,
  useConstantCase: true,
)
abstract class Env {
  @EnviedField()
  static final String supabaseUrl = _Env.supabaseUrl;
  @EnviedField()
  static final String supabaseAnonKey = _Env.supabaseAnonKey;
}
