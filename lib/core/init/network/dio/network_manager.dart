import 'package:dio/dio.dart';
import 'package:flutter_my_core_library/core/constant/enum/service_path_enum.dart';

import 'ICoreDio.dart';
import 'core_dio.dart';

class NetworkManager {
  static NetworkManager? _instance;
  static NetworkManager? get instance {
    _instance ??= NetworkManager._init();
    return _instance;
  }

  ICoreDioNullSafety? coreDio;

  NetworkManager._init() {
    final baseOptions = BaseOptions(
      baseUrl: ServicePath.base.path,
    );
    // _dio = Dio(baseOptions);

    coreDio = CoreDio(baseOptions);

    // _dio.interceptors.add(InterceptorsWrapper(
    //   onRequest: (options) {
    //     options.path += "veli";
    //   },
    //   onError: (e) {
    //     return BaseError(e.message);
    //   },
    // ));
  }
}
