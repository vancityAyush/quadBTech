import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../utils/app_theme/app_config.dart';
import '../../../../../utils/app_theme/app_theme.dart';
import '../../models/event.dart';
import 'event_card.dart';

class EventListShimmer extends StatelessWidget {
  final int itemCount;
  const EventListShimmer({Key? key, this.itemCount = 8}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppTheme appTheme = AppConfig.of(context).appTheme;
    return ListView(
      shrinkWrap: true,
      children: List.filled(
        itemCount,
        Shimmer.fromColors(
          direction: appTheme.shimmerDirection,
          child: EventCard(
            event: Event.empty(),
          ),
          baseColor: appTheme.shimmerBaseColor,
          highlightColor: appTheme.shimmerHighlightColor,
        ),
      ),
    );
  }
}
