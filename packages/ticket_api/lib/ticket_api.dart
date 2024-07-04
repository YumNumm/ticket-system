import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'ticket_api.g.dart';

@RestApi()
abstract class TicketApiClient {
  factory TicketApiClient(Dio dio, {String baseUrl}) = _TicketApiClient;

  // MEMO(YumNumm): めんどくさいので とりあえずMapで返す
  @POST('/verify_purchase')
  Future<HttpResponse<void>> verifyPurchase({
    @Query('session_id') required String sessionId,
    @Header('Authorization') required String authorization,
  });
}
