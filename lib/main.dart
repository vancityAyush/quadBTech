import 'package:flutter/material.dart';
import 'package:sde_007/utils/flavours/art_generator.dart';
import 'package:sde_007/utils/flavours/flavour.dart';
import 'package:sde_007/utils/helper/connectivity/connectivity_helper.dart';

import 'app/modules/app/ui/app.dart';

final Flavor flavor = SDE007();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ConnectivityHelper.instance.init();
  runApp(const AppWatcher());
}
