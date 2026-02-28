import 'package:flutter/material.dart';
import 'package:omnicare/features/home/presentation/widgets/organs_list.dart';

class OrganDisplay extends StatefulWidget {
  final int selectedOrganIndex;
  final double height;

  const OrganDisplay({
    super.key,
    required this.selectedOrganIndex,
    required this.height,
  });

  @override
  State<OrganDisplay> createState() => _OrganDisplayState();
}

class _OrganDisplayState extends State<OrganDisplay>
    with SingleTickerProviderStateMixin {
  late AnimationController _breathingController;
  late Animation<double> _floatAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _breathingController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat(reverse: true);

    _floatAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(begin: -15, end: 15).chain(CurveTween(curve: Curves.easeInOutQuad)),
        weight: 1,
      ),
    ]).animate(_breathingController);

    _scaleAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.38, end: 1.45).chain(CurveTween(curve: Curves.easeInOutQuad)),
        weight: 1,
      ),
    ]).animate(_breathingController);
  }

  @override
  void dispose() {
    _breathingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: widget.height / 5.5,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 600),
        switchInCurve: Curves.easeOutQuart,
        switchOutCurve: Curves.easeInQuart,
        transitionBuilder: (child, animation) {
          final offsetAnimation = Tween<Offset>(
            begin: const Offset(0, 0.05),
            end: Offset.zero,
          ).animate(CurvedAnimation(
            parent: animation,
            curve: Curves.easeOutQuart,
          ));

          return FadeTransition(
            opacity: animation,
            child: SlideTransition(
              position: offsetAnimation,
              child: child,
            ),
          );
        },
        child: AnimatedBuilder(
          key: ValueKey<int>(widget.selectedOrganIndex),
          animation: _breathingController,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, _floatAnimation.value),
              child: Transform.scale(
                scale: _scaleAnimation.value,
                child: Image.asset(
                  organsList[widget.selectedOrganIndex]['colored']!,
                  fit: BoxFit.contain,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
