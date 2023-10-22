import 'package:epra/controllers.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class EpraPortalWidget extends StatelessWidget {
  const EpraPortalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(child: WebViewWidget(controller: controller)));
  }
}
