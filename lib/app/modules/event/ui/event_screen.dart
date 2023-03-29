import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sde_007/app/modules/event/ui/widgets/event_card.dart';
import 'package:sde_007/app/modules/event/ui/widgets/event_list_shimmer.dart';
import 'package:sde_007/utils/font_size.dart';
import 'package:sde_007/utils/image_resources/image_path.dart';

import '../../../../utils/app_theme/app_config.dart';
import '../../../../utils/app_theme/app_theme.dart';
import '../../../../utils/strings_resources/strings_resource.dart';
import '../bloc/event_bloc.dart';
import '../models/event.dart';
import 'event_search.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({Key? key}) : super(key: key);

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  /// Bloc object
  final EventBloc _eventBloc = EventBloc.instance;

  late Stream<List<Event>> eventStream;

  @override
  void initState() {
    eventStream = _eventBloc.getEventStream(context: context);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _eventBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AppTheme appTheme = AppConfig.of(context).appTheme;
    final StringResource stringResource = AppConfig.of(context).strings;
    final MediaQueryData mediaQuery = MediaQuery.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: appTheme.colorPrimary,
      appBar: AppBar(
        elevation: 0,
        titleSpacing: 30,
        title: Text(
          stringResource.events,
          style: TextStyle(
            color: appTheme.colorSecondary,
            fontSize: FontSize.m,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EventSearch(),
                ),
              );
            },
            icon: Image.asset(
              ImagePath.searchIcon,
              width: mediaQuery.size.width * 0.05,
            ),
          ),
          Icon(
            Icons.more_vert,
            color: appTheme.colorSecondary,
          ),
          const SizedBox(width: 30)
        ],
      ),
      body: SafeArea(
        child: StreamBuilder<List<Event>>(
          stream: eventStream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const EventListShimmer();
            }
            if (snapshot.hasError) {
              return const Center(child: Text('Error'));
            }
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return EventCard(
                    event: snapshot.data![index],
                  );
                },
              );
            }
            return const Center(child: Text('No data'));
          },
        ),
      ),
    );
  }
}
