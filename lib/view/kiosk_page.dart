import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kiosk_mode/kiosk_mode.dart';
import 'package:webview_flutter/webview_flutter.dart';

class KioskPage extends StatefulWidget {
  const KioskPage({Key? key}) : super(key: key);

  @override
  State<KioskPage> createState() => _KioskPageState();
}

class _KioskPageState extends State<KioskPage> {

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom,SystemUiOverlay.top]);
    startKioskMode();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    super.initState();
  }
  @override
  Widget build(BuildContext context) => WillPopScope(
    onWillPop: _willPopCallback,
    child: const SafeArea(
        child: Center(child: WebView(
          initialUrl: 'https://farafeedback.com/poll/feedback',
          javascriptMode: JavascriptMode.unrestricted,
        ),),
      ),
  );

  Future<bool> _willPopCallback() async {
    return false;
  }
}