import 'package:flutter/cupertino.dart';

class NotificationPageLanguage {
  final String back;
  final String notification;
  final String version;
  final String versionDescriptionOne;
  final String versionDescriptionTwo;
  final String versionDescriptionThree;
  final String versionDescriptionFour;
  final String versionDescriptionFive;

  NotificationPageLanguage({
    @required this.back,
    @required this.notification,
    @required this.version,
    @required this.versionDescriptionOne,
    @required this.versionDescriptionTwo,
    @required this.versionDescriptionThree,
    @required this.versionDescriptionFour,
    @required this.versionDescriptionFive,
  });

  factory NotificationPageLanguage.fromJson(Map<String, dynamic> json) {
    return NotificationPageLanguage(
      back: json['back'],
      notification: json['notification'],
      version: json['version'],
      versionDescriptionOne: json['versionDescriptionOne'],
      versionDescriptionTwo: json['versionDescriptionTwo'],
      versionDescriptionThree: json['versionDescriptionThree'],
      versionDescriptionFour: json['versionDescriptionFour'],
      versionDescriptionFive: json['versionDescriptionFive'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'back': back,
      'notification': notification,
      'version': version,
      'versionDescriptionOne': versionDescriptionOne,
      'versionDescriptionTwo': versionDescriptionTwo,
      'versionDescriptionThree': versionDescriptionThree,
      'versionDescriptionFour': versionDescriptionFour,
      'versionDescriptionFive': versionDescriptionFive,
    };
  }
}
