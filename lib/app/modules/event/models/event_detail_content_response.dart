import 'package:json_annotation/json_annotation.dart';
import 'package:sde_007/app/modules/event/models/event.dart';

part 'event_detail_content_response.g.dart';

@JsonSerializable()
class EventDetailContent {
  ErrorBean? error;
  ContentBean? content;
  bool status;

  EventDetailContent({this.error, required this.status, this.content});

  factory EventDetailContent.fromJson(Map<String, dynamic> json) =>
      _$EventDetailContentFromJson(json);

  Map<String, dynamic> toJson() => _$EventDetailContentToJson(this);
}

@JsonSerializable()
class ErrorBean {
  String message;

  ErrorBean({required this.message});

  factory ErrorBean.fromJson(Map<String, dynamic> json) =>
      _$ErrorBeanFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorBeanToJson(this);
}

@JsonSerializable()
class ContentBean {
  Event data;

  ContentBean({required this.data});

  factory ContentBean.fromJson(Map<String, dynamic> json) =>
      _$ContentBeanFromJson(json);

  Map<String, dynamic> toJson() => _$ContentBeanToJson(this);
}
