import 'dart:io';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:kiosk_mode/kiosk_mode.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom,SystemUiOverlay.top]);
    startKioskMode();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    super.initState();
  }
  @override
  Widget build(BuildContext context) => const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: Center(child: WebView(
            initialUrl: 'https://flutter.dev',
          ),),
        ),
      );
}

class _Home extends StatefulWidget {
  const _Home({
    Key? key,
  }) : super(key: key);

  @override
  State<_Home> createState() => _HomeState();
}

class _HomeState extends State<_Home> {
  late final Stream<KioskMode> _currentMode = watchKioskMode();

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (Platform.isAndroid) ...[
            const MaterialButton(
              onPressed: startKioskMode,
              child: Text('Start Kiosk Mode'),
            ),
            const MaterialButton(
              onPressed: stopKioskMode,
              child: Text('Stop Kiosk Mode'),
            ),
          ],
          MaterialButton(
            onPressed: () => getKioskMode().then(
              (value) => ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Kiosk mode: $value')),
              ),
            ),
            child: const Text('Check mode'),
          ),
          if (Platform.isIOS)
            StreamBuilder<KioskMode>(
              stream: _currentMode,
              builder: (context, snapshot) => Text(
                'Current mode: ${snapshot.data}',
              ),
            ),
  const WebView(
  initialUrl: 'https://flutter.dev',
  ),
          // Center(
          //   child: RaisedButton(
          //     onPressed: _launchURL,
          //     child: Text('Show Flutter homepage'),
          //   ),
          // ),
        ],
      );
  String _url = 'https://flutter.dev';
  void _launchURL() async =>
      await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
}
