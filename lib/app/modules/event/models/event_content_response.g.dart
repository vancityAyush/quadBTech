// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_content_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventContent _$EventContentFromJson(Map<String, dynamic> json) => EventContent(
      content: ContentBean.fromJson(json['content'] as Map<String, dynamic>),
      status: json['status'] as bool,
    );

Map<String, dynamic> _$EventContentToJson(EventContent instance) =>
    <String, dynamic>{
      'content': instance.content,
      'status': instance.status,
    };

ContentBean _$ContentBeanFromJson(Map<String, dynamic> json) => ContentBean(
      data: (json['data'] as List<dynamic>)
          .map((e) => Event.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: MetaBean.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ContentBeanToJson(ContentBean instance) =>
    <String, dynamic>{
      'data': instance.data,
      'meta': instance.meta,
    };

MetaBean _$MetaBeanFromJson(Map<String, dynamic> json) => MetaBean(
      total: json['total'] as int,
    );

Map<String, dynamic> _$MetaBeanToJson(MetaBean instance) => <String, dynamic>{
      'total': instance.total,
    };
