import 'package:dio/dio.dart';
import 'package:movie_app/core/network/api_constant.dart';

class WebServices {
  static WebServices? _this;

  factory WebServices() {
    _this ??= WebServices._();
    return _this!;
  }

  final Dio freePrimaryDio = Dio();
  final Dio freeSecondaryDio = Dio();
  final Dio tokenDio = Dio();

  String lang = "en";
  String? nonce;
  String? myToken;
  final String storageKeyMobileToken = "Authorization";

  WebServices._() {
    freePrimaryDio.options.connectTimeout = const Duration(milliseconds: 30000);
    freePrimaryDio.options.baseUrl = ApiConstat.baseUrl;

    freeSecondaryDio.options.connectTimeout = const Duration(
      milliseconds: 30000,
    );

    tokenDio.options.connectTimeout = const Duration(milliseconds: 30000);
    tokenDio.options.baseUrl = ApiConstat.baseUrl;
  }
}
