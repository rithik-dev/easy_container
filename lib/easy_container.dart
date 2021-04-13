library easy_container;

import 'package:flutter/material.dart';

class EasyContainer extends StatefulWidget {
  final VoidCallback? onTap;
  final Widget child;
  final EdgeInsets padding;
  final double? height;
  final double? width;
  final double borderWidth;
  final EdgeInsets? margin;
  final Color? borderColor;
  final Color? backgroundColor;
  final double borderRadius;
  final Color? shadowColor;
  final double elevation;
  final bool zeroDownElevationOnTap;

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
