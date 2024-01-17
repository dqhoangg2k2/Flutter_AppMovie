/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/search.svg
  String get search => 'assets/icons/search.svg';

  /// List of all assets
  List<String> get values => [search];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/icon_action_grey.png
  AssetGenImage get iconActionGrey =>
      const AssetGenImage('assets/images/icon_action_grey.png');

  /// File path: assets/images/icon_action_white.png
  AssetGenImage get iconActionWhite =>
      const AssetGenImage('assets/images/icon_action_white.png');

  /// File path: assets/images/icon_clock_grey.png
  AssetGenImage get iconClockGrey =>
      const AssetGenImage('assets/images/icon_clock_grey.png');

  /// File path: assets/images/icon_clock_white.png
  AssetGenImage get iconClockWhite =>
      const AssetGenImage('assets/images/icon_clock_white.png');

  /// File path: assets/images/icon_home.png
  AssetGenImage get iconHome =>
      const AssetGenImage('assets/images/icon_home.png');

  /// File path: assets/images/icon_home_select.png
  AssetGenImage get iconHomeSelect =>
      const AssetGenImage('assets/images/icon_home_select.png');

  /// File path: assets/images/icon_info_circle.png
  AssetGenImage get iconInfoCircle =>
      const AssetGenImage('assets/images/icon_info_circle.png');

  /// File path: assets/images/icon_movie.png
  AssetGenImage get iconMovie =>
      const AssetGenImage('assets/images/icon_movie.png');

  /// File path: assets/images/icon_search.png
  AssetGenImage get iconSearch =>
      const AssetGenImage('assets/images/icon_search.png');

  /// File path: assets/images/icon_search_select.png
  AssetGenImage get iconSearchSelect =>
      const AssetGenImage('assets/images/icon_search_select.png');

  /// File path: assets/images/icon_star.png
  AssetGenImage get iconStar =>
      const AssetGenImage('assets/images/icon_star.png');

  /// File path: assets/images/icon_top_left.png
  AssetGenImage get iconTopLeft =>
      const AssetGenImage('assets/images/icon_top_left.png');

  /// File path: assets/images/icon_top_right.png
  AssetGenImage get iconTopRight =>
      const AssetGenImage('assets/images/icon_top_right.png');

  /// File path: assets/images/icon_watches.png
  AssetGenImage get iconWatches =>
      const AssetGenImage('assets/images/icon_watches.png');

  /// File path: assets/images/icon_watches_select.png
  AssetGenImage get iconWatchesSelect =>
      const AssetGenImage('assets/images/icon_watches_select.png');

  /// File path: assets/images/icon_year_grey.png
  AssetGenImage get iconYearGrey =>
      const AssetGenImage('assets/images/icon_year_grey.png');

  /// File path: assets/images/icon_year_white.png
  AssetGenImage get iconYearWhite =>
      const AssetGenImage('assets/images/icon_year_white.png');

  /// File path: assets/images/image_cast_one.png
  AssetGenImage get imageCastOne =>
      const AssetGenImage('assets/images/image_cast_one.png');

  /// File path: assets/images/image_cast_two.png
  AssetGenImage get imageCastTwo =>
      const AssetGenImage('assets/images/image_cast_two.png');

  /// File path: assets/images/image_review.png
  AssetGenImage get imageReview =>
      const AssetGenImage('assets/images/image_review.png');

  /// File path: assets/images/image_search_one.png
  AssetGenImage get imageSearchOne =>
      const AssetGenImage('assets/images/image_search_one.png');

  /// File path: assets/images/image_search_two.png
  AssetGenImage get imageSearchTwo =>
      const AssetGenImage('assets/images/image_search_two.png');

  /// File path: assets/images/image_splash.png
  AssetGenImage get imageSplash =>
      const AssetGenImage('assets/images/image_splash.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        iconActionGrey,
        iconActionWhite,
        iconClockGrey,
        iconClockWhite,
        iconHome,
        iconHomeSelect,
        iconInfoCircle,
        iconMovie,
        iconSearch,
        iconSearchSelect,
        iconStar,
        iconTopLeft,
        iconTopRight,
        iconWatches,
        iconWatchesSelect,
        iconYearGrey,
        iconYearWhite,
        imageCastOne,
        imageCastTwo,
        imageReview,
        imageSearchOne,
        imageSearchTwo,
        imageSplash
      ];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
