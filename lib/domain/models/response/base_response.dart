import 'package:dio/dio.dart';

class BaseResponse {
  BaseResponse({
    required this.meta,
    required this.response,
  });

  final Meta? meta;
  final dynamic response;

  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    return BaseResponse(
      meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      response: json["response"],
    );
  }
}

class Meta {
  Meta({
    required this.status,
    required this.message,
  });

  final int? status;
  final String? message;

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      status: json["status"],
      message: json["message"],
    );
  }
}
