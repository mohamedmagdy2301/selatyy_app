// import 'package:dio/dio.dart';

// class Failure {
//   final String message;
//   const Failure(this.message);
// }

// class ServerFailure extends Failure {
//   ServerFailure(super.message);

//   factory ServerFailure.fromDioException(DioException dioException) {
//     switch (dioException.type) {
//       case DioExceptionType.sendTimeout:
//         return ServerFailure("Send timeout in connection with API server");
//       case DioExceptionType.receiveTimeout:
//         return ServerFailure("Receive timeout in connection with API server");
//       case DioExceptionType.connectionTimeout:
//         return ServerFailure("Connection timeout with API server");
//       case DioExceptionType.cancel:
//         return ServerFailure("Request to API server was cancelled");
//       case DioExceptionType.badResponse:
//         return ServerFailure.fromBadResponse(dioException.response!.statusCode!,
//             dioException.response!.data!["error"]["message"]);
//       case DioExceptionType.badCertificate:
//         return ServerFailure("Bad Certificate");
//       case DioExceptionType.connectionError:
//         return ServerFailure("No internet connection");
//       case DioExceptionType.unknown:
//         if (dioException.message?.contains("SocketException") ?? false) {
//           return ServerFailure("No internet connection");
//         } else {
//           return ServerFailure("Unexpected error occurred");
//         }
//       default:
//         return ServerFailure("Something went wrong !!!");
//     }
//   }
//   factory ServerFailure.fromBadResponse(int statusCode, dynamic response) {
//     switch (statusCode) {
//       case 400:
//         return ServerFailure("Bad Request, please tell developer\n$response");
//       case 401:
//         return ServerFailure("Unauthorized Access\n$response");
//       case 403:
//         return ServerFailure("Forbidden Access\n$response");
//       case 404:
//         return ServerFailure("Not Found any book");
//       case 409:
//         return ServerFailure("Conflict Access\n$response");
//       case 422:
//         return ServerFailure("Unprocessable Entity\n$response");
//       case 429:
//         return ServerFailure("Too Many Requests\n$response");
//       case 502:
//         return ServerFailure("Bad Gateway\n$response");
//       case 503:
//         return ServerFailure("Service Unavailable\n$response");
//       case 500:
//         return ServerFailure("Internal Server Error\n$response");
//       default:
//         return ServerFailure("Something went wrong");
//     }
//   }
// }
