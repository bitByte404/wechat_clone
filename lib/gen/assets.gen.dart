/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/Fav_List_Add_Icon@3x.png
  AssetGenImage get favListAddIcon3x =>
      const AssetGenImage('assets/images/Fav_List_Add_Icon@3x.png');

  /// File path: assets/images/avatar.jpg
  AssetGenImage get avatar => const AssetGenImage('assets/images/avatar.jpg');

  /// File path: assets/images/avatar1.png
  AssetGenImage get avatar1 => const AssetGenImage('assets/images/avatar1.png');

  /// File path: assets/images/avatar2.jpg
  AssetGenImage get avatar2 => const AssetGenImage('assets/images/avatar2.jpg');

  /// File path: assets/images/avatar3.jpg
  AssetGenImage get avatar3 => const AssetGenImage('assets/images/avatar3.jpg');

  /// File path: assets/images/avatar4.jpg
  AssetGenImage get avatar4 => const AssetGenImage('assets/images/avatar4.jpg');

  /// File path: assets/images/avatar5.jpg
  AssetGenImage get avatar5 => const AssetGenImage('assets/images/avatar5.jpg');

  /// File path: assets/images/avatar6.jpg
  AssetGenImage get avatar6 => const AssetGenImage('assets/images/avatar6.jpg');

  /// File path: assets/images/ff_search_magnifier@3x.png
  AssetGenImage get ffSearchMagnifier3x =>
      const AssetGenImage('assets/images/ff_search_magnifier@3x.png');

  /// File path: assets/images/haugnbo.png
  AssetGenImage get haugnbo => const AssetGenImage('assets/images/haugnbo.png');

  /// File path: assets/images/tabbar_contacts@3x.png
  AssetGenImage get tabbarContacts3x =>
      const AssetGenImage('assets/images/tabbar_contacts@3x.png');

  /// File path: assets/images/tabbar_contactsHL@3x.png
  AssetGenImage get tabbarContactsHL3x =>
      const AssetGenImage('assets/images/tabbar_contactsHL@3x.png');

  /// File path: assets/images/tabbar_discover@3x.png
  AssetGenImage get tabbarDiscover3x =>
      const AssetGenImage('assets/images/tabbar_discover@3x.png');

  /// File path: assets/images/tabbar_discoverHL@3x.png
  AssetGenImage get tabbarDiscoverHL3x =>
      const AssetGenImage('assets/images/tabbar_discoverHL@3x.png');

  /// File path: assets/images/tabbar_mainframe@3x.png
  AssetGenImage get tabbarMainframe3x =>
      const AssetGenImage('assets/images/tabbar_mainframe@3x.png');

  /// File path: assets/images/tabbar_mainframeHL@3x.png
  AssetGenImage get tabbarMainframeHL3x =>
      const AssetGenImage('assets/images/tabbar_mainframeHL@3x.png');

  /// File path: assets/images/tabbar_me@3x.png
  AssetGenImage get tabbarMe3x =>
      const AssetGenImage('assets/images/tabbar_me@3x.png');

  /// File path: assets/images/tabbar_meHL@3x.png
  AssetGenImage get tabbarMeHL3x =>
      const AssetGenImage('assets/images/tabbar_meHL@3x.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        favListAddIcon3x,
        avatar,
        avatar1,
        avatar2,
        avatar3,
        avatar4,
        avatar5,
        avatar6,
        ffSearchMagnifier3x,
        haugnbo,
        tabbarContacts3x,
        tabbarContactsHL3x,
        tabbarDiscover3x,
        tabbarDiscoverHL3x,
        tabbarMainframe3x,
        tabbarMainframeHL3x,
        tabbarMe3x,
        tabbarMeHL3x
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

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
    bool gaplessPlayback = true,
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
