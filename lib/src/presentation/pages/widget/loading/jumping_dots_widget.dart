import 'package:flutter/material.dart';

class JumpingDots extends StatefulWidget {
  final int numberOfDots;
  final int animationDuration;
  final double sizeDots;
  final Color colorDots;
  final double heightHeel;

  const JumpingDots({
    Key? key,
    this.numberOfDots = 3,
    this.animationDuration = 400,
    this.sizeDots = 5,
    this.colorDots = Colors.black,
    this.heightHeel = -5,
  }) : super(key: key);

  @override
  State<JumpingDots> createState() => _JumpingDotsState();
}

class _JumpingDotsState extends State<JumpingDots>
    with TickerProviderStateMixin {
  late List<AnimationController> _animationControllers;
  late List<Animation<double>> _animations;

  @override
  void initState() {
    _initAnimation();
    super.initState();
  }

  @override
  void dispose() {
    _onDisposeAll();
    super.dispose();
  }

  void _onDisposeAll() {
    for (var controller in _animationControllers) {
      controller.dispose();
    }
  }

  // @override
  // void didUpdateWidget(covariant JumpingDots oldWidget) {
  //   super.didUpdateWidget(oldWidget);
  //   if (widget.animationDuration != oldWidget.animationDuration ||
  //       widget.heightHeel != oldWidget.heightHeel ||
  //       widget.numberOfDots != oldWidget.numberOfDots) {
  //     for (var controller in _animationControllers) {
  //       controller.dispose();
  //     }
  //     _initAnimation();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        widget.numberOfDots,
        (index) {
          return AnimatedBuilder(
            animation: _animationControllers[index],
            builder: (context, child) {
              return Container(
                padding: const EdgeInsets.all(2.5),
                child: Transform.translate(
                  offset: Offset(0, _animations[index].value),
                  child: DotWidget(
                    color: widget.colorDots,
                    size: widget.sizeDots,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _initAnimation() {
    _animationControllers = <AnimationController>[];
    _animations = <Animation<double>>[];
    for (var index = 0; index < widget.numberOfDots; index++) {
      _animationControllers.add(AnimationController(
          vsync: this,
          duration: Duration(milliseconds: widget.animationDuration)));
    }
    for (var index = 0; index < widget.numberOfDots; index++) {
      var curve = CurvedAnimation(
          parent: _animationControllers[index], curve: Curves.easeInOut);
      _animations
          .add(Tween<double>(begin: 0, end: widget.heightHeel).animate(curve));
    }
    for (var index = 0; index < widget.numberOfDots; index++) {
      _animationControllers[index].addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animationControllers[index].reverse();
          if (index != widget.numberOfDots - 1) {
            _animationControllers[index + 1].forward();
          }
        }
        if (index == widget.numberOfDots - 1 &&
            status == AnimationStatus.dismissed) {
          _animationControllers[0].forward();
        }
      });
    }
    _animationControllers.first.forward();
  }
}

class DotWidget extends StatelessWidget {
  final Color color;
  final double size;

  const DotWidget({Key? key, this.color = Colors.black, this.size = 5})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          const BoxDecoration(shape: BoxShape.circle, color: Colors.black),
      height: size,
      width: size,
    );
  }
}
