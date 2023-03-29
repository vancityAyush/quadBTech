import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../utils/app_theme/app_config.dart';
import '../../../../utils/app_theme/app_theme.dart';
import '../../../../utils/strings_resources/strings_resource.dart';

class EventDetailsScreen extends StatelessWidget {
  final int eventId;
  const EventDetailsScreen({Key? key, required this.eventId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final StringResource stringResource = AppConfig.of(context).strings;
    final AppTheme theme = AppConfig.of(context).appTheme;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(stringResource.eventDetails),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
          child: CupertinoScrollbar(
        child: Column(
          children: [],
        ),
      )),
    );
  }
}
