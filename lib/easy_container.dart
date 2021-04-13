library easy_container;

import 'package:flutter/material.dart';

class EasyContainer extends StatefulWidget {
  const EasyContainer({
    required this.child,
    this.onTap,
    this.height,
    this.width,
    this.margin,
    this.borderColor,
    this.shadowColor,
    this.backgroundColor,
    this.zeroDownElevationOnTap = true,
    this.padding = const EdgeInsets.all(10),
    this.borderRadius = 5,
    this.borderWidth = 1,
    this.elevation = 5,
  });

  /// Called every time [EasyContainer] is tapped;
  final VoidCallback? onTap;

  /// The child of the container.
  final Widget child;

  /// The amount of space by which to inset the child.
  ///
  /// Defaults to `const EdgeInsets.all(10)`.
  final EdgeInsets padding;

  /// Height of the [EasyContainer].
  final double? height;

  /// Width of the [EasyContainer].
  final double? width;

  /// Width of the border (if any).
  /// If [borderColor] is not passed, this parameter has no effect.
  ///
  /// Defaults to 1.
  final double borderWidth;

  /// The empty space that surrounds the card.
  final EdgeInsets? margin;

  /// Color of the border.
  ///
  /// See also
  /// * [borderWidth] parameter.
  final Color? borderColor;

  /// The container's background color.
  final Color? backgroundColor;

  /// The border radius for each corner.
  ///
  /// Defaults to 5.
  final double borderRadius;

  /// Color of the card's shadow.
  ///
  /// If null, [backgroundColor] is used as the [shadowColor].
  /// If [backgroundColor] is also null, accent color is used.
  final Color? shadowColor;

  /// The z-coordinate at which to place this card. This controls the size of
  /// the shadow below the card.
  ///
  /// Defaults to 5.
  final double elevation;

  /// If true, when the card is tapped, or long pressed,
  /// the card deepens down giving a cool effect.
  ///
  /// Defaults to true.
  final bool zeroDownElevationOnTap;

  @override
  _EasyContainerState createState() => _EasyContainerState();
}

class _EasyContainerState extends State<EasyContainer> {
  late double _elevation;

  @override
  void initState() {
    _elevation = widget.elevation;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: this.widget.height,
      width: this.widget.width,
      child: Card(
        shape: RoundedRectangleBorder(
          side: this.widget.borderColor != null
              ? BorderSide(
                  color: this.widget.borderColor!,
                  width: this.widget.borderWidth,
                )
              : BorderSide.none,
          borderRadius: BorderRadius.circular(this.widget.borderRadius),
        ),
        color: this.widget.backgroundColor ?? Theme.of(context).accentColor,
        elevation: _elevation,
        margin: this.widget.margin,
        shadowColor: this.widget.shadowColor ??
            this.widget.backgroundColor ??
            Theme.of(context).accentColor,
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: this.widget.onTap,
          onHighlightChanged: (v) {
            if (this.widget.zeroDownElevationOnTap) {
              if (widget.elevation == 0)
                return;
              else if (widget.elevation <= 2.5)
                _elevation = v ? 0 : widget.elevation;
              else
                _elevation = v ? 2.5 : widget.elevation;
              setState(() {});
            }
          },
          child: Padding(
            padding: this.widget.padding,
            child: this.widget.child,
          ),
        ),
      ),
    );
  }
}
