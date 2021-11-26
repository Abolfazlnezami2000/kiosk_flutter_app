import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NormalPage extends StatefulWidget {
  const NormalPage({Key? key}) : super(key: key);

  @override
  _NormalPageState createState() => _NormalPageState();
}

class _NormalPageState extends State<NormalPage> {

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom,SystemUiOverlay.top]);
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    super.initState();
  }
  @override
  Widget build(BuildContext context) => const SafeArea(
    child: Center(child: WebView(
        initialUrl: 'https://farafeedback.com/poll/feedback',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    ),
  );
}
