// Constants class including global messages and UI constants
import 'package:flutter/cupertino.dart';

abstract class Constants {
  static const String unknownErrorMsg =
      'An unknown error has occurred! Please try again later.';
  static const String serverErrorMsg =
      'A server error has occurred! Please try again later.';
  static const String noInternetErrorMsg =
      'No Internet connection found! Please try again later.';
  static const String appTitle = 'NY Times Most Popular';
  static const String loadingMsg = 'Loading..';
  static const String defaultThumbnail =
      'https://www.ledr.com/colours/grey.jpg';
  static const String articleDetailTitle = 'Article Details';
  static const Color subtitleColor = Color.fromRGBO(128, 128, 128, 1);
}
