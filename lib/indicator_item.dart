import 'package:flutter/material.dart';

class IndicatorItem extends StatefulWidget {
  Decoration decoration;
  Size itemSize;
  int delay;

  IndicatorItem({
    required this.decoration,
    required this.itemSize,
    required this.delay,
    Key? key,
  }) : super(key: key);

  @override
  _IndicatorItemState createState() => _IndicatorItemState();
}

class _IndicatorItemState extends State<IndicatorItem>{
  // late AnimationController _animationController;
  // late Animation<double> _animation;
  // final Duration _duration = const Duration(milliseconds: 500);
  // bool _showIndicator = false;
  //
  // @override
  // void initState() {
  //   _animationController = AnimationController(
  //     vsync: this,
  //     duration: _duration,
  //     reverseDuration: _duration,
  //   );
  //   _animationController.repeat(reverse: true);
  //   _animation = Tween(begin: 0.0, end: 1.0).animate(
  //     CurvedAnimation(parent: _animationController, curve: Curves.linear),
  //   );
  //
  //   WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
  //     if (mounted) {
  //       Future.delayed(
  //         Duration(milliseconds: widget.delay),
  //         () {},
  //       ).then((value) {
  //         setState(() {
  //           _showIndicator = true;
  //         });
  //       });
  //     }
  //   });
  //
  //   super.initState();
  // }


  @override
  Widget build(BuildContext context) {
    return Container(decoration: widget.decoration);
  }

}
