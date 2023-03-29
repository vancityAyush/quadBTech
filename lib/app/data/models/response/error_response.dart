class ErrorResponse {
  late String message;

  ErrorResponse({required this.message});

  ErrorResponse.fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      if (json.containsKey('message')) {
        message = json['message'];
      } else if (json.containsKey('detail')) {
        message = json['detail'];
      } else {
        message = "some error occurred";
      }
    } else {
      message = "some error occurred";
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    return data;
  }
}
