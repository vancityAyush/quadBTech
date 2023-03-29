import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sde_007/app/modules/event/resources/api_response.dart';
import 'package:sde_007/app/modules/event/ui/widgets/event_card.dart';
import 'package:sde_007/app/modules/event/ui/widgets/event_list_shimmer.dart';
import 'package:sde_007/utils/font_size.dart';
import 'package:sde_007/utils/image_resources/image_path.dart';

import '../../../../utils/app_theme/app_config.dart';
import '../../../../utils/app_theme/app_theme.dart';
import '../../../../utils/strings_resources/strings_resource.dart';
import '../bloc/event_bloc.dart';
import '../models/event.dart';
import 'widgets/custom_search_field.dart';

class EventSearch extends StatefulWidget {
  EventSearch({Key? key}) : super(key: key);

  @override
  State<EventSearch> createState() => _EventSearchState();
}

class _EventSearchState extends State<EventSearch> {
  /// Bloc object
  final EventBloc _eventBloc = EventBloc.instance;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppConfig.of(context).appTheme;
    final StringResource stringResource = AppConfig.of(context).strings;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: theme.colorPrimary,
      appBar: AppBar(
        elevation: 0,
        titleSpacing: 30,
        title: Text(
          stringResource.search,
          style: TextStyle(
            color: theme.colorSecondary,
            fontSize: FontSize.m,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            //Search bar
            Container(
              padding: const EdgeInsets.all(10),
              color: theme.colorBackground,
              child: CustomSearchField(
                onClear: _eventBloc.clearSearch,
                contentPadding: const EdgeInsets.only(top: 30),
                filter: _eventBloc.search,
                prefixIcon: Image.asset(ImagePath.searchIconBlue,
                    width: 25, height: 25),
                hintText: stringResource.eventSearchPrompt,
                fontsize: FontSize.xs,
              ),
            ),

            //body
            Expanded(
              child: StreamBuilder<ApiResponse<List<Event>>>(
                stream: _eventBloc.eventStream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData || snapshot.data!.data == null) {
                    return ListView.builder(
                      itemCount: _eventBloc.eventList.length,
                      itemBuilder: (context, index) {
                        return EventCard(
                          event: _eventBloc.eventList[index],
                        );
                      },
                    );
                  }
                  if (snapshot.data?.status == Status.loading) {
                    return const Expanded(
                        child: Center(child: EventListShimmer()));
                  }
                  if (snapshot.data!.status == Status.error) {
                    return Container();
                  }
                  if (snapshot.data!.status == Status.error) {
                    return Center(
                      child: Text(
                        snapshot.data!.message!,
                        style: TextStyle(
                          color: theme.colorSecondary,
                          fontSize: FontSize.m,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    );
                  }

                  return Expanded(
                    child: SingleChildScrollView(
                      child: CupertinoScrollbar(
                        child: Column(
                          children: [
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: snapshot.data!.data!.length,
                              itemBuilder: (context, index) {
                                return EventCard(
                                  event: snapshot.data!.data![index],
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
