library easy_container;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show MouseCursor;

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
    this.canRequestFocus = true,
    this.autofocus = false,
    this.enableFeedback = true,
    this.excludeFromSemantics = false,
    this.allowOverflow = false,
    this.borderRadius = 5,
    this.borderWidth = 1,
    this.elevation = 5,
    this.padding = const EdgeInsets.all(10),
    this.zeroDownElevationOnTap = true,
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
        clipBehavior: this.widget.allowOverflow ? null : Clip.hardEdge,
        child: InkWell(
          borderRadius: BorderRadius.circular(this.widget.borderRadius),
          radius: this.widget.inkSplashRadius,
          onDoubleTap: this.widget.onDoubleTap,
          onLongPress: this.widget.onLongPress,
          onTapDown: this.widget.onTapDown,
          onTapCancel: this.widget.onTapCancel,
          onHover: this.widget.onHover,
          mouseCursor: this.widget.mouseCursor,
          focusColor: this.widget.focusColor,
          hoverColor: this.widget.hoverColor,
          highlightColor: this.widget.highlightColor,
          overlayColor: this.widget.overlayColor,
          splashColor: this.widget.splashColor,
          splashFactory: this.widget.splashFactory,
          customBorder: this.widget.customBorder,
          focusNode: this.widget.focusNode,
          onFocusChange: this.widget.onFocusChange,
          canRequestFocus: this.widget.canRequestFocus,
          autofocus: this.widget.autofocus,
          enableFeedback: this.widget.enableFeedback,
          excludeFromSemantics: this.widget.excludeFromSemantics,
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
            if (this.widget.onHighlightChanged != null)
              return this.widget.onHighlightChanged!(v);
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
