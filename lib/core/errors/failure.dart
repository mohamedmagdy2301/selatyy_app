import 'package:dio/dio.dart';

class Failure {
  final String message;
  const Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.sendTimeout:
        return ServerFailure("انتهت مهلة إرسال الاتصال بخادم API");
      case DioExceptionType.receiveTimeout:
        return ServerFailure("انتهت مهلة استقبال الاتصال بخادم API");
      case DioExceptionType.connectionTimeout:
        return ServerFailure("انتهت مهلة الاتصال بخادم API");
      case DioExceptionType.cancel:
        return ServerFailure("تم إلغاء الطلب إلى خادم API");
      case DioExceptionType.badResponse:
        final statusCode = dioException.response?.statusCode ?? 500;
        final data = dioException.response?.data;
        String errorMessage = "حدث خطأ في الخادم";
        if (data is Map<String, dynamic> && data.containsKey("error_message")) {
          errorMessage = data["error_message"];
        }

        return ServerFailure.fromBadResponse(statusCode, errorMessage);
      case DioExceptionType.badCertificate:
        return ServerFailure("شهادة غير صالحة");
      case DioExceptionType.connectionError:
        return ServerFailure("لا يوجد اتصال بالإنترنت");
      case DioExceptionType.unknown:
        if (dioException.message?.contains("SocketException") ?? false) {
          return ServerFailure("لا يوجد اتصال بالإنترنت");
        } else {
          return ServerFailure("حدث خطأ غير متوقع");
        }
      default:
        return ServerFailure("حدث خطأ ما!!!");
    }
  }

  factory ServerFailure.fromBadResponse(int statusCode, dynamic response) {
    switch (statusCode) {
      case 400:
        return ServerFailure("طلب غير صالح، يرجى إبلاغ المطور\n$response");
      case 401:
        return ServerFailure("دخول غير مصرح به\n$response");
      case 403:
        return ServerFailure("الوصول محظور\n$response");
      case 404:
        return ServerFailure("لم يتم العثور على أي معلومات\n$response");
      case 409:
        return ServerFailure("تعارض في الوصول\n$response");
      case 422:
        return ServerFailure("كيان غير قابل للمعالجة\n$response");
      case 429:
        return ServerFailure("طلبات كثيرة جدًا\n$response");
      case 502:
        return ServerFailure("بوابة سيئة\n$response");
      case 503:
        return ServerFailure("الخدمة غير متوفرة\n$response");
      case 500:
        return ServerFailure("خطأ في الخادم الداخلي\n$response");
      default:
        if (statusCode == 200 && response != null) {
          return ServerFailure("$response");
        }
        return ServerFailure("حدث خطأ ما");
    }
  }
}
