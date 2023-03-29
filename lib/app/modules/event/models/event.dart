import 'package:json_annotation/json_annotation.dart';

part 'event.g.dart';

@JsonSerializable()
class Event {
  int id;
  String title;
  String description;
  @JsonKey(name: 'banner_image')
  String bannerImage;
  @JsonKey(
      name: 'date_time', fromJson: _dateTimeFromJson, toJson: _dateTimeToJson)
  DateTime dateTime;
  @JsonKey(name: 'organiser_name')
  String organiserName;
  @JsonKey(name: 'organiser_icon')
  String organiserIcon;
  @JsonKey(name: 'venue_name')
  String venueName;
  @JsonKey(name: 'venue_city')
  String venueCity;
  @JsonKey(name: 'venue_country')
  String venueCountry;

  Event({
    required this.id,
    required this.title,
    required this.description,
    required this.bannerImage,
    required this.dateTime,
    required this.organiserName,
    required this.organiserIcon,
    required this.venueName,
    required this.venueCity,
    required this.venueCountry,
  });

  Event.empty()
      : id = 0,
        title = '',
        description = '',
        bannerImage = '',
        dateTime = DateTime.now(),
        organiserName = '',
        organiserIcon = '',
        venueName = '',
        venueCity = '',
        venueCountry = '';

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

  Map<String, dynamic> toJson() => _$EventToJson(this);

  static int _dateTimeToJson(DateTime value) => value.millisecondsSinceEpoch;

  static DateTime _dateTimeFromJson(String value) =>
      DateTime.parse(value).toLocal();
}
