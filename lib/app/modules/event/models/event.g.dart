// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) => Event(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      bannerImage: json['banner_image'] as String,
      dateTime: Event._dateTimeFromJson(json['date_time'] as String),
      organiserName: json['organiser_name'] as String,
      organiserIcon: json['organiser_icon'] as String,
      venueName: json['venue_name'] as String,
      venueCity: json['venue_city'] as String,
      venueCountry: json['venue_country'] as String,
    );

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'banner_image': instance.bannerImage,
      'date_time': Event._dateTimeToJson(instance.dateTime),
      'organiser_name': instance.organiserName,
      'organiser_icon': instance.organiserIcon,
      'venue_name': instance.venueName,
      'venue_city': instance.venueCity,
      'venue_country': instance.venueCountry,
    };
