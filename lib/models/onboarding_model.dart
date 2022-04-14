import 'dart:convert';

import 'package:cbc_online/global_constants.dart';

class OnboardingData {
  String assetName;
  String title;
  String text;
  OnboardingData({
    required this.assetName,
    required this.title,
    required this.text,
  });

  OnboardingData copyWith({
    String? assetName,
    String? title,
    String? text,
  }) {
    return OnboardingData(
      assetName: assetName ?? this.assetName,
      title: title ?? this.title,
      text: text ?? this.text,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      onboradingAssetName: assetName,
      onboardingTitle: title,
      onboardingText: text,
    };
  }

  factory OnboardingData.fromMap(Map<String, dynamic> map) {
    return OnboardingData(
      assetName: map[onboradingAssetName] ?? '',
      title: map[onboardingTitle] ?? '',
      text: map[onboardingText] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory OnboardingData.fromJson(Map<String, dynamic> json) {
    return OnboardingData(
      assetName: json[onboradingAssetName] ?? '',
      title: json[onboardingTitle] ?? '',
      text: json[onboardingText] ?? '',
    );
  }
  @override
  String toString() =>
      'OnboardingData(assetName: $assetName, title: $title, text: $text)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OnboardingData &&
        other.assetName == assetName &&
        other.title == title &&
        other.text == text;
  }

  @override
  int get hashCode => assetName.hashCode ^ title.hashCode ^ text.hashCode;
}
