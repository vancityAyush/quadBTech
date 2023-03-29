import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:glass/glass.dart';
import 'package:intl/intl.dart';
import 'package:sde_007/app/modules/event/resources/event_repository.dart';
import 'package:sde_007/utils/image_resources/image_path.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../utils/app_theme/app_config.dart';
import '../../../../utils/app_theme/app_theme.dart';
import '../../../../utils/font_size.dart';
import '../../../../utils/strings_resources/strings_resource.dart';
import '../../../data/models/dto/response.dart';
import '../models/event.dart';
import '../models/event_detail_content_response.dart';

class EventDetailsScreen extends StatelessWidget {
  final int eventId;
  final EventRepository _eventRepository = EventRepository.instance;
  EventDetailsScreen({Key? key, required this.eventId}) : super(key: key);

  final double padding = 24;
  @override
  Widget build(BuildContext context) {
    final StringResource stringResource = AppConfig.of(context).strings;
    final AppTheme theme = AppConfig.of(context).appTheme;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          // titleSpacing: 30,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                stringResource.eventDetails,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: FontSize.m,
                  fontWeight: FontWeight.w600,
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: 45,
                  height: 45,
                  color: const Color.fromRGBO(255, 225, 255, 0.3),
                  child: const Icon(
                    Icons.bookmark,
                    color: Colors.white,
                  ),
                ).asGlass(),
              )
            ],
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: FutureBuilder(
        future: _eventRepository.getEventDetail(eventId),
        builder: (BuildContext context,
            AsyncSnapshot<RepoResponse<EventDetailContent>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            );
          }
          if (snapshot.hasData) {
            Event event = snapshot.data!.data!.content!.data;
            return SingleChildScrollView(
              child: CupertinoScrollbar(
                child: Column(
                  children: [
                    CachedNetworkImage(
                      imageUrl: event.bannerImage,
                      fit: BoxFit.cover,
                      height: 300,
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          height: 300,
                          width: double.infinity,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: padding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            event.title,
                            style: TextStyle(
                              color: theme.colorTextPrimary,
                              fontSize: FontSize.xxxl,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            horizontalTitleGap: 8,
                            leading: CachedNetworkImage(
                              imageUrl: event.organiserIcon,
                              fit: BoxFit.cover,
                              height: 50,
                              width: 50,
                            ),
                            title: Text(
                              event.organiserName,
                              style: TextStyle(
                                color: theme.colorTextPrimary,
                                fontSize: FontSize.xxs,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            subtitle: Text(
                              stringResource.organizer,
                              style: TextStyle(
                                color: const Color(0xff706E8F),
                                fontSize: FontSize.xxxxs,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            horizontalTitleGap: 8,
                            leading: Container(
                              alignment: Alignment.center,
                              // padding: const EdgeInsets.all(5),
                              height: 55,
                              width: 55,
                              decoration: BoxDecoration(
                                color: const Color(0xff5669FF).withOpacity(0.1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Image.asset(
                                ImagePath.calendar,
                                fit: BoxFit.cover,
                                height: 35,
                                width: 35,
                              ),
                            ),
                            title: Text(
                              DateFormat.yMMMMd().format(event.dateTime),
                              style: TextStyle(
                                color: theme.colorTextPrimary,
                                fontSize: FontSize.xxs,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            subtitle: Text(
                              formatTime(event.dateTime),
                              style: TextStyle(
                                color: const Color(0xff706E8F),
                                fontSize: FontSize.xxxxs,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            horizontalTitleGap: 8,
                            leading: Container(
                              alignment: Alignment.center,
                              // padding: const EdgeInsets.all(5),
                              height: 55,
                              width: 55,
                              decoration: BoxDecoration(
                                color: const Color(0xff5669FF).withOpacity(0.1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Image.asset(
                                ImagePath.location,
                                fit: BoxFit.cover,
                                height: 35,
                                width: 35,
                              ),
                            ),
                            title: Text(
                              event.venueName,
                              style: TextStyle(
                                color: theme.colorTextPrimary,
                                fontSize: FontSize.xxs,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            subtitle: Text(
                              "${event.venueCity}, ${event.venueCountry}",
                              style: TextStyle(
                                color: const Color(0xff706E8F),
                                fontSize: FontSize.xxxxs,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            stringResource.aboutEvent,
                            style: TextStyle(
                              color: theme.colorTextPrimary,
                              fontSize: FontSize.m,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            event.description,
                            style: TextStyle(
                              color: theme.colorTextPrimary,
                              fontSize: FontSize.xxs,
                              fontWeight: FontWeight.w400,
                              overflow: TextOverflow.fade,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                  ],
                ),
              ),
            );
          }
          return const Center(
            child: Text("Something went wrong"),
          );
        },
      ),
      floatingActionButton: MaterialButton(
        minWidth: MediaQuery.of(context).size.width * 0.8,
        height: 60,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        onPressed: () {},
        color: const Color(0xff5669FF),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Row(
            children: [
              const Spacer(),
              Text(
                stringResource.bookNow,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: FontSize.xs,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              const CircleAvatar(
                backgroundColor: Color(0xff3D56F0),
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  String formatTime(DateTime time) {
    String day = DateFormat('EEEE').format(time);
    String start = DateFormat('jm').format(time);
    String end = DateFormat('jm').format(time.add(const Duration(hours: 2)));
    return '$day, $start - $end';
  }
}
