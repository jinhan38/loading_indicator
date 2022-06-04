import 'dart:math';

import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingIndicator extends StatefulWidget {
  Decoration decoration;
  Size itemSize;
  int itemCount;
  double spacing;

  LoadingIndicator({
    required this.decoration,
    required this.itemSize,
    this.itemCount = 3,
    this.spacing = 0,
    Key? key,
  }) : super(key: key);

  @override
  State<LoadingIndicator> createState() => _LoadingIndicatorState();
}

class _LoadingIndicatorState extends State<LoadingIndicator> with SingleTickerProviderStateMixin {
  Decoration get decoration => widget.decoration;

  Size get itemSize => widget.itemSize;

  int get itemCount => widget.itemCount;

  double get spacing => widget.spacing;

  late AnimationController _animationController;

  final double initialOffset = 0.0;

  final double finalOffset = 0.7;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1200));
    _animationController.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (itemSize.width * itemCount) + (spacing * itemCount),
      height: itemSize.height,
      child: Row(children: indicator()),
    );
  }

  List<Widget> indicator() {
    return List.generate(itemCount, (index) {
      Animation animation = _initLoadingAnimation(index);
      return AnimatedBuilder(
          animation: animation,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: spacing / 2),
            width: itemSize.width,
            height: itemSize.height,
            decoration: decoration,
          ),
          builder: (_, child) {
            return Transform.scale(scale: animation.value, child: child);
          });
    });
  }

  Animation<double> _initLoadingAnimation(int index) {
    double begin = 0.25 * (index / itemCount);
    double end = 0.65 + begin;
    return IndicatorAnimatable(min: initialOffset, max: finalOffset).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(begin, end, curve: Curves.linear),
      ),
    );
  }
}

class IndicatorAnimatable extends Animatable<double> {
  final double min;
  final double max;

  IndicatorAnimatable({required this.min, required this.max});

  @override
  double transform(double t) {
    return min + (max - min) * sin(pi * t);
  }
}
