import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ticket_reader/core/env/env.dart';

part 'dio.g.dart';

@Riverpod(keepAlive: true)
Dio dio(DioRef ref) => Dio(
      BaseOptions(
        baseUrl: Env.apiBaseUrl,
        validateStatus: (status) => status != null && status < 300,
      ),
    );
