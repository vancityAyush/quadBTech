import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../main.dart';

class Utils {
  ///This function is used to print long outputs for debug purposes only
  static void logPrint(Object? object) async {
    int defaultPrintLength = 1020;
    if (object == null || object.toString().length <= defaultPrintLength) {
      print(object);
    } else {
      String log = object.toString();
      int start = 0;
      int endIndex = defaultPrintLength;
      int logLength = log.length;
      int tmpLogLength = log.length;
      while (endIndex < logLength) {
        print(log.substring(start, endIndex));
        endIndex += defaultPrintLength;
        start += defaultPrintLength;
        tmpLogLength -= defaultPrintLength;
      }
      if (tmpLogLength > 0) {
        print(log.substring(start, logLength));
      }
    }
  }

  static List<String> months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];

  static String sizeInMB(int size) {
    double mb = size / 1000000.0;
    double gb = size / 1000000000.0;
    double kb = size / 1000.0;
    String sizeInMb;
    if (gb > 1) {
      sizeInMb = '${gb.toStringAsFixed(2)} GB';
    } else if (mb > 1) {
      sizeInMb = '${mb.toStringAsFixed(2)} MB';
    } else if (kb > 1) {
      sizeInMb = '${kb.toStringAsFixed(2)} KB';
    } else {
      sizeInMb = '$size B';
    }
    return sizeInMb;
  }

  static Future<Uint8List> downloadImage(String url) async {
    var httpClient = HttpClient();
    var request = await httpClient.getUrl(Uri.parse(url));
    var response = await request.close();
    if (response.statusCode == 200) {
      var bytes = await consolidateHttpClientResponseBytes(response);
      return bytes;
    }
    throw Exception('Image Error');
  }

  static Future<String> getStorageDirectory() async {
    if (Platform.isAndroid) {
      // Directory? dir = await getExternalStorageDirectory();
      // // if (dir != null) {
      // //   return dir.path;
      // // }
      return "/storage/emulated/0/Download";
    } else {
      return (await getApplicationDocumentsDirectory()).path;
    }
  }

  static Future<String> saveImage(
      {required Uint8List bytes, String? fileName}) async {
    String dir = await getStorageDirectory();
    fileName ??= DateTime.now().millisecondsSinceEpoch.toString();
    File file = File("$dir/$fileName.png");
    file = await file.writeAsBytes(bytes);
    return file.path;
  }

  static void shareImage(
      {required Uint8List bytes, required String shareText}) async {
    String tempPath =
        "${(await getTemporaryDirectory()).path}/${generateFileName()}.png";
    File file = File(tempPath);
    file = await file.writeAsBytes(bytes);
    await Share.shareFiles([file.path],
        mimeTypes: ['image/png'], text: shareText);
  }

  static Future<dynamic> parseJson(String data) => compute(jsonDecode, data);

  static Color colorFromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  static void launchUrlIfPossible(String link,
      {bool launchInApp = true}) async {
    Uri uri = Uri.parse(link);
    if (await canLaunchUrl(uri)) {
      if (launchInApp) {
        launchUrl(uri);
      } else {
        launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    }
  }

  static String convertBase64Image({required String imagePath}) {
    const Base64Codec base64 = Base64Codec();
    return base64.decode(imagePath).toString();
  }

  static Future<Directory> getCacheDirectory() async {
    return await getTemporaryDirectory()
      ..createSync(recursive: true);
  }

  static Future<Directory> getApplicationDirectory() async {
    Directory directory = await getApplicationDocumentsDirectory();
    return directory;
  }

  static String generateFileName() {
    DateTime time = DateTime.now();
    return "${flavor.appName}_${time.millisecondsSinceEpoch}";
  }

  static String getHumanReadableTime(DateTime dateTime) {
    return "${dateTime.day} ${months[dateTime.month - 1]}  ${dateTime.year}";
  }
}
