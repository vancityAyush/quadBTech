import 'package:flutter/material.dart';
import 'package:sde_007/app/modules/event/ui/event_screen.dart';

import '../../../../main.dart';
import '../../../../utils/app_theme/app_config.dart';
import '../../../../utils/app_theme/app_theme.dart';
import '../../../../utils/app_theme/app_theme_dark.dart';
import '../../../../utils/app_theme/ui_helper.dart';
import '../../../../utils/helper/connectivity/connectivity_helper.dart';
import '../../../../utils/helper/connectivity/connectivity_listner.dart';
import '../../../../utils/screen_util/screenutil.dart';
import '../../../../utils/strings_resources/language_factory.dart';
import '../../../../utils/strings_resources/strings_resource.dart';

class AppWatcher extends StatefulWidget {
  final bool isDarkTheme;
  final String locale;

  const AppWatcher({Key? key, this.isDarkTheme = false, this.locale = 'en'})
      : super(key: key);

  @override
  _AppWatcherState createState() => _AppWatcherState();

  static _AppWatcherState of(BuildContext context) {
    return context.findAncestorStateOfType<_AppWatcherState>()!;
  }
}

class _AppWatcherState extends State<AppWatcher> {
  late AppTheme _appTheme;
  late StringResource _strings;
  final LanguageFactory langFactory = LanguageFactory();

  void changeTheme() async {
    _appTheme = AppThemeLight();
    setState(() {});
  }

  void changeLanguage(AppLanguage lang) async {
    _strings = langFactory.provideStringResource(lang.languageCode);
    setState(() {});
  }

  @override
  void initState() {
    _appTheme = AppThemeLight();
    _strings = langFactory.provideStringResource(widget.locale);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppConfig(
      strings: _strings,
      appTheme: _appTheme,
      child: MaterialApp(
        scrollBehavior: CustomScrollBehavior(),
        debugShowCheckedModeBanner: false,
        title: flavor.appName,
        theme: ThemeData(
            scaffoldBackgroundColor: _appTheme.colorBackground,
            // useMaterial3: true,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            primaryColor: _appTheme.colorPrimary,
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            iconTheme: IconThemeData(
              color: _appTheme.colorAccentText,
            ),
            colorScheme: ColorScheme.fromSwatch(
              primarySwatch:
                  UIHelper.generateMaterialColor(_appTheme.colorBackground),
            ),
            fontFamily: 'Inter'),
        home: const MyApp(),
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> implements ConnectivityListener {
  @override
  void initState() {
    ConnectivityHelper.instance.addListener(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return const EventScreen();
  }

  @override
  void dispose() {
    ConnectivityHelper.instance.removeListener(this);
    super.dispose();
  }

  @override
  onNetworkChanged(bool hasInternet) {
    throw UnimplementedError();
  }
}

class CustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
