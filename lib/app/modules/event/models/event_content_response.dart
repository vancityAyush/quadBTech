import 'package:json_annotation/json_annotation.dart';
import 'package:sde_007/app/modules/event/models/event.dart';

part 'event_content_response.g.dart';

@JsonSerializable()
class EventContent {
  ContentBean content;
  bool status;

  EventContent({required this.content, required this.status});

  factory EventContent.fromJson(Map<String, dynamic> json) =>
      _$EventContentFromJson(json);

  Map<String, dynamic> toJson() => _$EventContentToJson(this);
}

@JsonSerializable()
class ContentBean {
  List<Event> data;
  MetaBean meta;

  ContentBean({required this.data, required this.meta});

  factory ContentBean.fromJson(Map<String, dynamic> json) =>
      _$ContentBeanFromJson(json);

  Map<String, dynamic> toJson() => _$ContentBeanToJson(this);
}

@JsonSerializable()
class MetaBean {
  int total;

  MetaBean({required this.total});

  factory MetaBean.fromJson(Map<String, dynamic> json) =>
      _$MetaBeanFromJson(json);

  Map<String, dynamic> toJson() => _$MetaBeanToJson(this);
}
