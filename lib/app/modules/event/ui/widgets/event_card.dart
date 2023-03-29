import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sde_007/app/modules/event/models/event.dart';
import 'package:sde_007/utils/app_theme/app_config.dart';
import 'package:sde_007/utils/app_theme/app_theme.dart';
import 'package:sde_007/utils/font_size.dart';
import 'package:sde_007/utils/image_resources/image_path.dart';
import 'package:shimmer/shimmer.dart';

import '../event_details.dart';

class EventCard extends StatelessWidget {
  final Event event;
  const EventCard({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppTheme appTheme = AppConfig.of(context).appTheme;
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EventDetailsScreen(eventId: event.id),
        ),
      ),
      child: Card(
        elevation: 0,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: event.bannerImage,
                    imageBuilder: (context, imageProvider) => Image(
                      image: imageProvider,
                      width: 80,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    placeholder: (context, url) => Shimmer.fromColors(
                      direction: appTheme.shimmerDirection,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: appTheme.colorSecondary,
                        ),
                        height: 100,
                        width: 80,
                      ),
                      baseColor: appTheme.shimmerBaseColor,
                      highlightColor: appTheme.shimmerHighlightColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Flexible(
                flex: 4,
                child: SizedBox(
                  height: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        formatDateTime(event.dateTime),
                        style: TextStyle(
                          color: appTheme.colorAccentText,
                          fontSize: FontSize.xxxxxs,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        event.title,
                        style: TextStyle(
                          color: appTheme.colorTextPrimary,
                          fontSize: FontSize.xxs,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Spacer(
                        flex: 2,
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            WidgetSpan(
                              child: Image.asset(
                                ImagePath.mapPin,
                                width: FontSize.xxxxxs,
                                height: FontSize.xxxxxs,
                              ),
                            ),
                            TextSpan(
                              text:
                                  ' ${event.venueName} • ${event.venueCity}, ${event.venueCountry}',
                              style: TextStyle(
                                color: appTheme.colorTextPrimary,
                                fontSize: FontSize.xxxxxs,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String formatDateTime(DateTime dateTime) {
    return DateFormat('EEE, MMM d • h:mm a').format(dateTime);
  }
}
