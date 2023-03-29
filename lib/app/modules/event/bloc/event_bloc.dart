import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sde_007/app/data/models/dto/response.dart';
import 'package:sde_007/app/modules/event/resources/event_repository.dart';

import '../../../../utils/bloc/bloc_interface.dart';
import '../../../../utils/helper/app_snackbar.dart';
import '../../../../utils/values/constants.dart';
import '../models/event.dart';
import '../models/event_content_response.dart';
import '../resources/api_response.dart';

class EventBloc extends BlocInterface {
  //Using Singleton pattern
  final EventRepository _eventRepository = EventRepository.instance;
  static EventBloc? _instance;

  EventBloc._() {
    _searchQuery
        .debounceTime(const Duration(milliseconds: 500))
        .listen((String query) => filter(query));
  }

  static EventBloc get instance => _instance ??= EventBloc._();

  EventContent? _eventContent;
  List<Event> _eventList = [];

  List<Event> get eventList => _eventList;

  final _searchQuery = PublishSubject<String>();

  final StreamController<ApiResponse<List<Event>>> _eventController =
      BehaviorSubject<ApiResponse<List<Event>>>();

  Stream<ApiResponse<List<Event>>> get eventStream => _eventController.stream;

  void clearSearch() => search('');

  void search(String query) async {
    if (query.isEmpty) {
      await Future.delayed(const Duration(milliseconds: 500));
      _eventController.sink.add(ApiResponse(''));
    }
    if (query.length > 1) {
      _searchQuery.add(query);
    }
  }

  void filter(String query) async {
    try {
      _eventController.sink.add(ApiResponse.loading());
      RepoResponse response = await _eventRepository.searchEvent(query);

      if (response.hasError) {
        _eventController.sink.add(ApiResponse.error(response.error!.message));
        return;
      }

      EventContent eventContent = response.data as EventContent;

      List<Event> eventList = eventContent.content.data;

      if (eventList.isEmpty) {
        _eventController.sink.add(ApiResponse.error('No Events found'));
        return;
      }

      _eventController.sink.add(ApiResponse.hasData(
        data: eventList,
        message: 'Events found',
      ));
    } catch (e) {
      _eventController.sink.add(ApiResponse.error(e.toString()));
    }
  }

  Stream<List<Event>> getEventStream(
      {int retryCnt = 0, required BuildContext? context}) async* {
    RepoResponse<EventContent>? result;
    // Done to let NetworkRequester initialise first
    await Future.delayed(const Duration(seconds: 1));
    // Query till we have no error or retryCnt runs out.
    for (int i = 0; i < retryCnt + 1; i++) {
      result = await _eventRepository.getAllEvents();

      if (!result.hasError) {
        _eventContent = result.data!;
        _eventList = _eventContent!.content.data;
        yield _eventContent!.content.data;
        break;
      } else {
        AppSnackBar.show(
            context!, result.error?.message ?? ErrorMessages.networkGeneral);
      }
    }
  }

  @override
  void dispose() {
    _eventController.close();
    _searchQuery.close();
    _instance = null;
  }
}
