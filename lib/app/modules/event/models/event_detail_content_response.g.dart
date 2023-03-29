// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_detail_content_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventDetailContent _$EventDetailContentFromJson(Map<String, dynamic> json) =>
    EventDetailContent(
      error: json['error'] == null
          ? null
          : ErrorBean.fromJson(json['error'] as Map<String, dynamic>),
      status: json['status'] as bool,
      content: json['content'] == null
          ? null
          : ContentBean.fromJson(json['content'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EventDetailContentToJson(EventDetailContent instance) =>
    <String, dynamic>{
      'error': instance.error,
      'content': instance.content,
      'status': instance.status,
    };

ErrorBean _$ErrorBeanFromJson(Map<String, dynamic> json) => ErrorBean(
      message: json['message'] as String,
    );

Map<String, dynamic> _$ErrorBeanToJson(ErrorBean instance) => <String, dynamic>{
      'message': instance.message,
    };

ContentBean _$ContentBeanFromJson(Map<String, dynamic> json) => ContentBean(
      data: Event.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ContentBeanToJson(ContentBean instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
