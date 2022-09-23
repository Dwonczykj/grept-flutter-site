import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:vegisite/constants.dart';

class DownloadVegiRedirectUrl extends StatelessWidget {
  DownloadVegiRedirectUrl({Key? key, required this.storeType})
      : super(key: key);
  final StoreType storeType;
  final Map<StoreType, String> storeTypeMap = <StoreType, String>{
    StoreType.AppStore: 'https://www.apple.com',
    StoreType.GooglePlayStore: 'https://google.com'
  };

  @override
  Widget build(BuildContext context) {
    final url = storeTypeMap[this.storeType]!;
    launchUrlString(url);
    return Container(child: Center(child: Text('taking you to $url')));
  }
}
