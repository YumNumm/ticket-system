import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'ticket_api.g.dart';

@RestApi()
abstract class TicketApiApiClient {
  factory TicketApiApiClient(Dio dio, {String baseUrl}) = _TicketApiApiClient;

  // MEMO(YumNumm): めんどくさいので とりあえずMapで返す
  @GET('/verify_purchase')
  Future<Map<String,dynamic>> verifyPurchase({
    @Query('session_id') required String sessionId,
    @Header('Authorization') required String authorization,
  });
}
