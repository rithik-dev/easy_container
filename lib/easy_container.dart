library easy_container;

import 'package:flutter/material.dart';

class EasyContainer extends StatefulWidget {
  const EasyContainer({
    Key? key,
    required this.child,
    this.onTap,
    this.height,
    this.width,
    this.margin = 5,
    this.customMargin,
    this.shadowColor,
    this.color,
    this.onHighlightChanged,
    this.onDoubleTap,
    this.onLongPress,
    this.onTapDown,
    this.onTapCancel,
    this.onHover,
    this.mouseCursor,
    this.focusColor,
    this.hoverColor,
    this.highlightColor,
    this.overlayColor,
    this.splashColor,
    this.splashFactory,
    this.inkSplashRadius,
    this.customBorder,
    this.focusNode,
    this.onFocusChange,
    this.alignmentWidthFactor,
    this.alignmentHeightFactor,
    this.alignment = Alignment.center,
    this.borderOnForeground = true,
    this.semanticContainer = true,
    this.canRequestFocus = true,
    this.autofocus = false,
    this.enableFeedback = true,
    this.excludeFromSemantics = false,
    this.allowOverflow = false,
    this.borderRadius = 5,
    this.customBorderRadius,
    this.elevation = 1.5,
    this.padding = 10,
    this.customPadding,
    this.zeroDownElevationOnTap = true,
    this.showBorder = false,
    this.borderWidth = 1,
    this.borderColor = Colors.black,
    this.borderStyle = BorderStyle.solid,
  }) : super(key: key);

  /// Called every time [EasyContainer] is tapped;
  final VoidCallback? onTap;

  /// The child of the container.
  final Widget child;

  /// The amount of space by which to inset the child.
  /// The double passed as padding is applied from all the sides.
  ///
  /// Shorthand for `EdgeInsets.all(padding)`
  ///
  /// If [customPadding] is passed, then [padding] is ignored.
  ///
  /// Defaults to 10.
  ///
  /// See also
  /// * [customPadding] parameter.
  final double padding;

  /// The amount of space by which to inset the child.
  ///
  /// See also
  /// * [padding] parameter.
  final EdgeInsets? customPadding;

  /// Height of the [EasyContainer].
  final double? height;

  /// Width of the [EasyContainer].
  final double? width;

  /// Width of the border (if any).
  /// If [borderColor] is not passed, this parameter has no effect.
  ///
  /// Defaults to 1.
  ///
  /// See also
  /// * [showBorder] parameter.
  final double borderWidth;

  /// The empty space that surrounds the card.
  /// The double passed as margin is applied to all the sides.
  ///
  /// Shorthand for `EdgeInsets.all(margin)`
  ///
  /// If [customMargin] is passed, then [margin] is ignored.
  ///
  /// Defaults to 5.
  ///
  /// See also
  /// * [customMargin] parameter.
  final double margin;

  /// The empty space that surrounds the card.
  ///
  /// See also
  /// * [margin] parameter.
  final EdgeInsets? customMargin;

  /// Color of the border.
  ///
  /// See also
  /// * [borderWidth] parameter.
  ///
  /// Defaults to [Colors.black].
  ///
  /// See also
  /// * [showBorder] parameter.
  final Color borderColor;

  /// The style of line to draw for a [BorderSide] in a [Border].
  ///
  /// Defaults to [BorderStyle.solid].
  ///
  /// See also
  /// * [showBorder] parameter.
  final BorderStyle borderStyle;

  /// The container's background color.
  ///
  /// If null, Theme.of(context).cardColor is used.
  final Color? color;

  /// The border radius for each corner.
  /// The double passed as borderRadius is applied to all the corners.
  ///
  /// Shorthand for `BorderRadius.circular(borderRadius)`
  ///
  /// If [customBorderRadius] is passed, then [borderRadius] is ignored.
  ///
  /// Defaults to 5.
  ///
  /// See also
  /// * [customBorderRadius] parameter.
  final double borderRadius;

  /// The border radius for each corner.
  ///
  /// See also
  /// * [borderRadius] parameter.
  final BorderRadius? customBorderRadius;

  /// Color of the card's shadow.
  ///
  /// If null, the [color] parameter is used as the [shadowColor].
  /// If [color] parameter is also null, Theme.of(context).cardColor is used.
  final Color? shadowColor;

  /// The z-coordinate at which to place this card. This controls the size of
  /// the shadow below the card.
  ///
  /// Defaults to 1.5
  final double elevation;

  /// If true, when the card is tapped, or long pressed,
  /// the card deepens down giving a cool effect.
  ///
  /// Defaults to true.
  final bool zeroDownElevationOnTap;

  /// Whether the [child] contents are allowed to overflow the
  /// boundaries of the container.
  ///
  /// Defaults to false
  final bool allowOverflow;

  /// Called when the container either becomes highlighted or stops
  /// being highlighted.
  ///
  /// The value passed to the callback is true if this part of the container has
  /// become highlighted and false if this part of the container has stopped
  /// being highlighted.
  final void Function(bool)? onHighlightChanged;

  /// Called when the user double taps the container.
  final GestureTapCallback? onDoubleTap;

  /// Called when the user long-presses the container.
  final GestureLongPressCallback? onLongPress;

  /// Called when the user taps down the container.
  final GestureTapDownCallback? onTapDown;

  /// Called when the user cancels a tap that was started on the container.
  final GestureTapCancelCallback? onTapCancel;

  /// Called when a pointer enters or exits the ink response area.
  ///
  /// The value passed to the callback is true if a pointer has entered
  /// the container and false if a pointer has exited the container.
  final ValueChanged<bool>? onHover;

  /// The cursor for a mouse pointer when it enters or is hovering over the
  /// widget.
  ///
  /// If [mouseCursor] is a [MaterialStateProperty<MouseCursor>],
  /// [MaterialStateProperty.resolve] is used for the following [MaterialState]s:
  ///
  ///  * [MaterialState.hovered].
  ///  * [MaterialState.focused].
  ///  * [MaterialState.disabled].
  ///
  /// If this property is null, [MaterialStateMouseCursor.clickable] will be used.
  final MouseCursor? mouseCursor;

  /// The color of the ink response when the parent widget is focused. If this
  /// property is null then the focus color of the theme,
  /// [ThemeData.focusColor], will be used.
  ///
  /// See also:
  ///
  ///  * [highlightShape], the shape of the focus, hover, and pressed
  ///    highlights.
  ///  * [hoverColor], the color of the hover highlight.
  ///  * [splashColor], the color of the splash.
  ///  * [splashFactory], which defines the appearance of the splash.
  final Color? focusColor;

  /// The color of the ink response when a pointer is hovering over it. If this
  /// property is null then the hover color of the theme,
  /// [ThemeData.hoverColor], will be used.
  ///
  /// See also:
  ///
  ///  * [highlightShape], the shape of the focus, hover, and pressed
  ///    highlights.
  ///  * [highlightColor], the color of the pressed highlight.
  ///  * [focusColor], the color of the focus highlight.
  ///  * [splashColor], the color of the splash.
  ///  * [splashFactory], which defines the appearance of the splash.
  final Color? hoverColor;

  /// The highlight color of the ink response when pressed. If this property is
  /// null then the highlight color of the theme, [ThemeData.highlightColor],
  /// will be used.
  ///
  /// See also:
  ///
  ///  * [hoverColor], the color of the hover highlight.
  ///  * [focusColor], the color of the focus highlight.
  ///  * [highlightShape], the shape of the focus, hover, and pressed
  ///    highlights.
  ///  * [splashColor], the color of the splash.
  ///  * [splashFactory], which defines the appearance of the splash.
  final Color? highlightColor;

  /// The splash color of the ink response. If this property is null then the
  /// splash color of the theme, [ThemeData.splashColor], will be used.
  ///
  /// See also:
  ///
  ///  * [splashFactory], which defines the appearance of the splash.
  ///  * [inkSplashRadius], the (maximum) size of the ink splash.
  ///  * [highlightColor], the color of the highlight.
  final Color? splashColor;

  /// Defines the ink response focus, hover, and splash colors.
  ///
  /// This default null property can be used as an alternative to
  /// [focusColor], [hoverColor], and [splashColor]. If non-null,
  /// it is resolved against one of [MaterialState.focused],
  /// [MaterialState.hovered], and [MaterialState.pressed]. It's
  /// convenient to use when the parent widget can pass along its own
  /// MaterialStateProperty value for the overlay color.
  ///
  /// [MaterialState.pressed] triggers a ripple (an ink splash), per
  /// the current Material Design spec. The [overlayColor] doesn't map
  /// a state to [highlightColor] because a separate highlight is not
  /// used by the current design guidelines.  See
  /// https://material.io/design/interaction/states.html#pressed
  ///
  /// If the overlay color is null or resolves to null, then [focusColor],
  /// [hoverColor], [splashColor] and their defaults are used instead.
  ///
  /// See also:
  ///
  ///  * The Material Design specification for overlay colors and how they
  ///    match a component's state:
  ///    <https://material.io/design/interaction/states.html#anatomy>.
  final MaterialStateProperty<Color?>? overlayColor;

  /// Defines the appearance of the splash.
  ///
  /// Defaults to the value of the theme's splash factory: [ThemeData.splashFactory].
  ///
  /// See also:
  ///
  ///  * [inkSplashRadius], the (maximum) size of the ink splash.
  ///  * [splashColor], the color of the splash.
  ///  * [highlightColor], the color of the highlight.
  ///  * [InkSplash.splashFactory], which defines the default splash.
  ///  * [InkRipple.splashFactory], which defines a splash that spreads out
  ///    more aggressively than the default.
  final InteractiveInkFeatureFactory? splashFactory;

  /// The radius of the ink splash.
  ///
  /// Splashes grow up to this size. By default, this size is determined from
  /// the size of the rectangle provided by [getRectCallback], or the size of
  /// the [InkResponse] itself.
  ///
  /// See also:
  ///
  ///  * [splashColor], the color of the splash.
  ///  * [splashFactory], which defines the appearance of the splash.
  final double? inkSplashRadius;

  /// The custom clip border which overrides [borderRadius].
  final ShapeBorder? customBorder;

  /// Whether detected gestures should provide acoustic and/or haptic feedback.
  ///
  /// For example, on Android a tap will produce a clicking sound and a
  /// long-press will produce a short vibration, when feedback is enabled.
  ///
  /// Defaults to true.
  ///
  /// See also:
  ///
  ///  * [Feedback] for providing platform-specific feedback to certain actions.
  final bool? enableFeedback;

  /// Whether to exclude the gestures introduced by this widget from the
  /// semantics tree.
  ///
  /// For example, a long-press gesture for showing a tooltip is usually
  /// excluded because the tooltip itself is included in the semantics
  /// tree directly and so having a gesture to show it would result in
  /// duplication of information.
  ///
  /// Defaults to false.
  final bool excludeFromSemantics;

  /// An optional focus node to use as the focus node for this widget.
  ///
  /// If one is not supplied, then one will be automatically allocated, owned,
  /// and managed by this widget. The widget will be focusable even if a
  /// [focusNode] is not supplied. If supplied, the given `focusNode` will be
  /// _hosted_ by this widget, but not owned. See [FocusNode] for more
  /// information on what being hosted and/or owned implies.
  ///
  /// Supplying a focus node is sometimes useful if an ancestor to this widget
  /// wants to control when this widget has the focus. The owner will be
  /// responsible for calling [FocusNode.dispose] on the focus node when it is
  /// done with it, but this widget will attach/detach and reparent the node
  /// when needed.
  final FocusNode? focusNode;

  /// If true, this focus node may request the primary focus.
  ///
  /// Defaults to true.
  final bool canRequestFocus;

  /// Handler called when the focus changes.
  ///
  /// Called with true if this widget's node gains focus, and false if it loses
  /// focus.
  final ValueChanged<bool>? onFocusChange;

  /// True if this widget will be selected as the initial focus when no other
  /// node in its scope is currently focused.
  ///
  /// Ideally, there is only one widget with autofocus set in each [FocusScope].
  /// If there is more than one widget with autofocus set, then the first one
  /// added to the tree will get focus.
  ///
  /// Must not be null. Defaults to false.
  final bool autofocus;

  /// Whether to paint the border in front of the [child].
  ///
  /// The default value is true.
  /// If false, the border will be painted behind the [child].
  ///
  /// See also
  /// * [showBorder] parameter.
  final bool borderOnForeground;

  /// Whether this widget represents a single semantic container, or if false
  /// a collection of individual semantic nodes.
  ///
  /// Defaults to true.
  ///
  /// Setting this flag to true will attempt to merge all child semantics into
  /// this node. Setting this flag to false will force all child semantic nodes
  /// to be explicit.
  ///
  /// This flag should be false if the card contains multiple different types
  /// of content.
  final bool semanticContainer;

  /// Align the [child] within the container.
  ///
  /// If non-null, the container will expand to fill its parent and position its
  /// child within itself according to the given value. If the incoming
  /// constraints are unbounded, then the child will be shrink-wrapped instead.
  ///
  /// Defaults to [Alignment.center].
  ///
  /// See also:
  ///
  ///  * [Alignment], a class with convenient constants typically used to
  ///    specify an [AlignmentGeometry].
  ///  * [AlignmentDirectional], like [Alignment] for specifying alignments
  ///    relative to text direction.
  final AlignmentGeometry? alignment;

  /// If non-null, sets its height to the child's height multiplied by this factor.
  ///
  /// Can be both greater and less than 1.0 but must be non-negative.
  ///
  /// If [alignment] is null, then [alignmentHeightFactor] has no effect.
  final double? alignmentHeightFactor;

  /// If non-null, sets its width to the child's width multiplied by this factor.
  ///
  /// Can be both greater and less than 1.0 but must be non-negative.
  ///
  /// If [alignment] is null, then [alignmentWidthFactor] has no effect.
  final double? alignmentWidthFactor;

  /// Whether to show the container's border or not
  ///
  /// Defaults to false.
  final bool showBorder;

  @override
  // ignore: library_private_types_in_public_api
  _EasyContainerState createState() => _EasyContainerState();
}

class _EasyContainerState extends State<EasyContainer> {
  /// Elevation of the container.
  late double _elevation;

  /// Whether the container is tapped or not.
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    if (!_isPressed) _elevation = widget.elevation;

    final borderRadius =
        widget.customBorderRadius ?? BorderRadius.circular(widget.borderRadius);

    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: Card(
        borderOnForeground: widget.borderOnForeground,
        semanticContainer: widget.semanticContainer,
        shape: RoundedRectangleBorder(
          side: widget.showBorder
              ? BorderSide(
                  color: widget.borderColor,
                  width: widget.borderWidth,
                  style: widget.borderStyle,
                )
              : BorderSide.none,
          borderRadius: borderRadius,
        ),
        color: widget.color ?? Theme.of(context).cardColor,
        elevation: _elevation,
        margin: widget.customMargin ?? EdgeInsets.all(widget.margin),
        shadowColor:
            widget.shadowColor ?? widget.color ?? Theme.of(context).cardColor,
        clipBehavior: widget.allowOverflow ? null : Clip.hardEdge,
        child: InkWell(
          borderRadius: borderRadius,
          radius: widget.inkSplashRadius,
          onDoubleTap: widget.onDoubleTap,
          onLongPress: widget.onLongPress,
          onTapDown: widget.onTapDown,
          onTapCancel: widget.onTapCancel,
          onHover: widget.onHover,
          mouseCursor: widget.mouseCursor,
          focusColor: widget.focusColor,
          hoverColor: widget.hoverColor,
          highlightColor: widget.highlightColor,
          overlayColor: widget.overlayColor,
          splashColor: widget.splashColor,
          splashFactory: widget.splashFactory,
          customBorder: widget.customBorder,
          focusNode: widget.focusNode,
          onFocusChange: widget.onFocusChange,
          canRequestFocus: widget.canRequestFocus,
          autofocus: widget.autofocus,
          enableFeedback: widget.enableFeedback,
          excludeFromSemantics: widget.excludeFromSemantics,
          onTap: widget.onTap,
          onHighlightChanged: (v) {
            if (widget.zeroDownElevationOnTap) {
              _isPressed = v;
              if (widget.elevation == 0) {
                return;
              } else if (widget.elevation <= 2.5) {
                _elevation = v ? 0 : widget.elevation;
              } else {
                _elevation = v ? 2.5 : widget.elevation;
              }
              setState(() {});
            }
            if (widget.onHighlightChanged != null) {
              return widget.onHighlightChanged!(v);
            }
          },
          child: Padding(
            padding: widget.customPadding ?? EdgeInsets.all(widget.padding),
            child: (widget.alignment == null)
                ? widget.child
                : Align(
                    alignment: widget.alignment!,
                    heightFactor: widget.alignmentHeightFactor,
                    widthFactor: widget.alignmentWidthFactor,
                    child: widget.child,
                  ),
          ),
        ),
      ),
    );
  }
}
