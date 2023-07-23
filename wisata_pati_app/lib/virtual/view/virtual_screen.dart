import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:wisata_pati_app/Template/view/template_scaffold.dart';
import 'package:wisata_pati_app/detail/models/datum/datum.dart';

class VirtualScreen extends StatefulWidget {
  final Datum data;
  const VirtualScreen({super.key, required this.data});

  @override
  State<VirtualScreen> createState() => _VirtualScreenState();
}

class _VirtualScreenState extends State<VirtualScreen> {
  late final WebViewController webViewController;

  @override
  void initState() {
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            debugPrint("statement progress: $progress");
          },
          onPageStarted: (String url) {
            debugPrint("statement pageStarted: $url");
          },
          onPageFinished: (String url) {
            debugPrint("statement pageFinished: $url");
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint("statement error: ${error.description}");
            debugPrint("statement error: ${error.errorCode}");
            debugPrint("statement error: ${error.errorType}");
            debugPrint("statement error: ${error.isForMainFrame}");
            debugPrint("statement error: ${error.url}");
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.google.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(
          'https://kuula.co/share/collection/7YykL?fs=1&vr=1&zoom=1&sd=1&initload=0&thumbs=1&info=0&logo=1&logosize=162'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TemplateScaffold(
      appBar: AppBar(
        title: Text("Virtual Tour ${widget.data.destinationName}"),
      ),
      body: SafeArea(child: WebViewWidget(controller: webViewController)),
    );
  }
}
