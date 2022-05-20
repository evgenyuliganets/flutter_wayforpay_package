import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wayforpay_package/model/wayforpay_response.dart';
import 'package:webview_flutter/webview_flutter.dart';

class VerificationScreen extends StatefulWidget {
  final WayForPayResponse? wayForPayResponse;

  const VerificationScreen({Key? key, this.wayForPayResponse})
      : super(key: key);

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final flutterWebViewPlugin = WebView();
  static const String POST_BACK_URL =
      'https://demo.cloudpayments.ru/WebFormPost/GetWebViewData';

  late String url;

  String buildUrl() {
    return '''<form name='downloadForm' action='${widget.wayForPayResponse!.d3AcsUrl}' method='POST'>
  <input type='hidden' name='PaReq' value='${widget.wayForPayResponse!.d3Pareq}'>
  <input type='hidden' name='MD' value='${widget.wayForPayResponse!.d3Pareq}'>
  <input type='hidden' name='TermUrl' value='$POST_BACK_URL'>
  </form>
  <script>
  window.onload = submitForm;
  function submitForm() { downloadForm.submit(); }
  </script>''';
  }

  @override
  void initState() {
    super.initState();

    url = buildUrl();
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: Uri.dataFromString(url, mimeType: 'text/html').toString(),
    );
  }
}
