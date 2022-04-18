/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// ignore_for_file: directives_ordering,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsGifsGen {
  const $AssetsGifsGen();

  /// File path: assets/gifs/splash.gif
  AssetGenImage get splash => const AssetGenImage('assets/gifs/splash.gif');

  /// File path: assets/gifs/viewpagefive.gif
  AssetGenImage get viewpagefive =>
      const AssetGenImage('assets/gifs/viewpagefive.gif');

  /// File path: assets/gifs/viewpagefour.gif
  AssetGenImage get viewpagefour =>
      const AssetGenImage('assets/gifs/viewpagefour.gif');

  /// File path: assets/gifs/viewpageone.gif
  AssetGenImage get viewpageone =>
      const AssetGenImage('assets/gifs/viewpageone.gif');

  /// File path: assets/gifs/viewpagethree.gif
  AssetGenImage get viewpagethree =>
      const AssetGenImage('assets/gifs/viewpagethree.gif');

  /// File path: assets/gifs/viewpagetwo.gif
  AssetGenImage get viewpagetwo =>
      const AssetGenImage('assets/gifs/viewpagetwo.gif');
}

class $AssetsJsonsGen {
  const $AssetsJsonsGen();

  /// File path: assets/jsons/onboarding_data.json
  String get onboardingData => 'assets/jsons/onboarding_data.json';
}

class $AssetsPngsGen {
  const $AssetsPngsGen();

  /// File path: assets/pngs/facebook.png
  AssetGenImage get facebook => const AssetGenImage('assets/pngs/facebook.png');

  /// File path: assets/pngs/facebooktwo.png
  AssetGenImage get facebooktwo =>
      const AssetGenImage('assets/pngs/facebooktwo.png');

  /// File path: assets/pngs/google.png
  AssetGenImage get google => const AssetGenImage('assets/pngs/google.png');
}

class Assets {
  Assets._();

  static const $AssetsGifsGen gifs = $AssetsGifsGen();
  static const $AssetsJsonsGen jsons = $AssetsJsonsGen();
  static const $AssetsPngsGen pngs = $AssetsPngsGen();
}

class AssetGenImage extends AssetImage {
  const AssetGenImage(String assetName) : super(assetName);

  Image image({
    Key? key,
    ImageFrameBuilder? frameBuilder,
    ImageLoadingBuilder? loadingBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? width,
    double? height,
    Color? color,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    FilterQuality filterQuality = FilterQuality.low,
  }) {
    return Image(
      key: key,
      image: this,
      frameBuilder: frameBuilder,
      loadingBuilder: loadingBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      width: width,
      height: height,
      color: color,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      filterQuality: filterQuality,
    );
  }

  String get path => assetName;
}
