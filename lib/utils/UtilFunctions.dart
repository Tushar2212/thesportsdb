import 'package:cached_network_image/cached_network_image.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

CachedNetworkImage showImage(String pUrl, [double pHeight, double pWidth]) =>
    CachedNetworkImage(
      imageUrl: pUrl,
      imageBuilder: (context, imageProvider) => Container(
        height: pHeight == null ? double.infinity : pHeight,
        width: pWidth == null ? double.infinity : pWidth,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: (pHeight != null || pWidth != null)
                ? BoxFit.fill
                : BoxFit.cover,
            colorFilter: (pHeight != null || pWidth != null)
                ? null
                : ColorFilter.mode(
                    Color.fromRGBO(0, 0, 0, .30), BlendMode.colorBurn),
          ),
        ),
      ),
      placeholder: (context, url) => CircularProgressIndicator(),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );

Future<bool> getCurrentNetworkStatus() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
return true;
  } else if (connectivityResult == ConnectivityResult.wifi) {
    return true;
  }
  return false;
}
