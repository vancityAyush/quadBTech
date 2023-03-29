import 'dart:async';

import 'package:sde_007/app/modules/event/models/event_content_response.dart';
import 'package:sde_007/app/modules/event/models/event_detail_content_response.dart';

import '../../../../utils/helper/exception_handler.dart';
import '../../../../utils/values/urls.dart';
import '../../../data/models/dto/response.dart';
import '../../../data/network/network_requester.dart';

class EventRepository {
  EventRepository._();

  static EventRepository? _repository;

  static EventRepository get instance => _repository ??= EventRepository._();

  final NetworkRequester _networkRequester = NetworkRequester.instance;

  Future<RepoResponse<EventContent>> getAllEvents() async {
    var response = await _networkRequester.get(path: URLs.eventUrl);
    if (response is APIException) {
      return RepoResponse(error: response);
    } else {
      var eventContent = EventContent.fromJson(response);
      return RepoResponse(data: eventContent);
    }
  }

  Future<RepoResponse<EventContent>> searchEvent(String query) async {
    var response = await _networkRequester
        .get(path: URLs.eventUrl, query: {'search': query});
    if (response is APIException) {
      return RepoResponse(error: response);
    } else {
      var eventContent = EventContent.fromJson(response);
      return RepoResponse(data: eventContent);
    }
  }

  Future<RepoResponse<EventDetailContent>> getEventDetail(int id) async {
    var response = await _networkRequester.get(path: URLs.eventUrl + '/$id');
    if (response is APIException) {
      return RepoResponse(error: response);
    } else {
      var eventDetailContent = EventDetailContent.fromJson(response);
      return RepoResponse(data: eventDetailContent);
    }
  }
}
