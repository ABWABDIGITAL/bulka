import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/shared/widgets/debouncer_widget.dart';
import 'package:bulka/core/utils/enums/enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LikeAnimatedReactWidget extends StatefulWidget {
  const LikeAnimatedReactWidget({
    super.key,
    this.initialReaction,
    this.onReactionChanged,
    this.overlayColor = Colors.white70,
    this.overlayHeight = 40,
    this.overlayWidth = 250,
    this.overlayDecoration,
    this.borderRadiusValue = 50,
    this.borderRadius,
  });

  final ReactionTypes? initialReaction;
  final OnButtonPressedCallback? onReactionChanged;
  final Color overlayColor;
  final double overlayWidth;
  final double overlayHeight;
  final Decoration? overlayDecoration;
  final BorderRadiusGeometry? borderRadius;
  final double borderRadiusValue;

  @override
  State<LikeAnimatedReactWidget> createState() =>
      _LikeAnimatedReactWidgetState();
}

class _LikeAnimatedReactWidgetState extends State<LikeAnimatedReactWidget> {
  ReactionTypes _reaction = ReactionTypes.none;
  bool _reactionView = false;
  final debouncer = Debouncer(milliseconds: 2500);

  GlobalKey btnKey = GlobalKey();
  final List<ReactionElement> reactions = [
    ReactionElement(
      ReactionTypes.like,
      const Icon(
        Icons.thumb_up_off_alt_rounded,
        color: Colors.blue,
      ),
    ),
    ReactionElement(
      ReactionTypes.love,
      const Icon(
        CupertinoIcons.heart_fill,
        color: Colors.red,
      ),
    ),
    ReactionElement(
      ReactionTypes.sad,
      Icon(
        Icons.sentiment_very_dissatisfied_rounded,
        color: Colors.yellow.shade800,
      ),
    ),
    ReactionElement(
      ReactionTypes.idea,
      Icon(
        Icons.lightbulb_outline_rounded,
        color: Colors.green.shade800,
      ),
    ),
    ReactionElement(
      ReactionTypes.angry,
      Icon(
        FontAwesomeIcons.faceAngry,
        color: Colors.red.shade800,
      ),
    ),
  ];
  late OverlayEntry overlayEntry;

  @override
  void initState() {
    super.initState();
    _reaction = widget.initialReaction ?? ReactionTypes.none;
    setState(() {});
  }

  void onCloseOverlay() {
    overlayEntry.remove();
  }

  @override
  void dispose() {
    if (_reactionView && mounted) {
      onCloseOverlay();
    }

    super.dispose();
  }

  void _showReactionPopUp(BuildContext context, Offset tapPosition) {
    final screenWidth = MediaQuery.of(context).size.width;
    double left = tapPosition.dx;
    if ((screenWidth - left) < 100) {
      left = left - 100;
    } else {
      left = left - 20;
    }
    overlayEntry = OverlayEntry(
      builder: (BuildContext context) => Positioned(
        left: left,
        top: tapPosition.dy - 60,
        child: Material(
          color: widget.overlayColor,
          borderRadius: widget.borderRadius ??
              BorderRadius.circular(widget.borderRadiusValue),
          child: Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            height: widget.overlayHeight,
            width: widget.overlayWidth,
            decoration: widget.overlayDecoration ??
                BoxDecoration(
                  color: widget.overlayColor,
                  borderRadius: widget.borderRadius ??
                      BorderRadius.circular(widget.borderRadiusValue),
                ),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: reactions.length,
              itemBuilder: (BuildContext context, int index) {
                return AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(milliseconds: 375),
                  child: SlideAnimation(
                    verticalOffset: 15 + index * 15,
                    child: FadeInAnimation(
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            _reaction = reactions[index].reaction;
                            if (widget.onReactionChanged != null) {
                              widget.onReactionChanged!(_reaction);
                            }
                            _reactionView = false;
                          });
                          onCloseOverlay();
                        },
                        icon: reactions[index].icon,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
    Overlay.of(context).insert(overlayEntry);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPressStart: (details) {
        if (_reactionView) {
          onCloseOverlay();
          _reactionView = false;
          setState(() {});
        }

        _showReactionPopUp(context, details.globalPosition);
        setState(() {
          _reactionView = true;
        });
      },
      onLongPressEnd: (details) {
        debouncer.run(() {
          if (_reactionView) {
            onCloseOverlay();
            _reactionView = false;
            setState(() {});
          }
        });
      },
      onTap: () {
        if (_reactionView) {
          onCloseOverlay();
          _reactionView = false;
        } else {
          if (_reaction == ReactionTypes.none) {
            _reaction = ReactionTypes.like;
            if (widget.onReactionChanged != null) {
              widget.onReactionChanged!(_reaction);
            }
          } else {
            _reaction = ReactionTypes.none;
            if (widget.onReactionChanged != null) {
              widget.onReactionChanged!(_reaction);
            }
          }
        }
        setState(() {});
      },
      child: ReactionIcon(reaction: _reaction),
    );
  }
}

typedef OnButtonPressedCallback = void Function(ReactionTypes newReaction);

class ReactionIcon extends StatelessWidget {
  const ReactionIcon({super.key, required this.reaction});
  final ReactionTypes reaction;

  @override
  Widget build(BuildContext context) {
    switch (reaction) {
      case ReactionTypes.like:
        return const Icon(
          Icons.thumb_up_off_alt_rounded,
          color: Colors.blue,
        );
      case ReactionTypes.love:
        return SvgPicture.asset(
          AssetIcons.heartSvg,
          height: 20.h,
          width: 20.w,
        );
      case ReactionTypes.sad:
        return Icon(
          FontAwesomeIcons.faceSadCry,
          color: Colors.yellow.shade800,
        );
      case ReactionTypes.idea:
        return Icon(
          FontAwesomeIcons.lightbulb,
          color: Colors.green.shade800,
        );
      case ReactionTypes.angry:
        return Icon(
          FontAwesomeIcons.faceAngry,
          color: Colors.red.shade800,
        );
      case ReactionTypes.none:
        return const Icon(
          Icons.thumb_up_off_alt_rounded,
          color: Colors.grey,
        );
    }
  }
}

class ReactionElement {
  final ReactionTypes reaction;
  final Widget icon;

  ReactionElement(this.reaction, this.icon);
}
