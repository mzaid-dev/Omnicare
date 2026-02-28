import 'package:flutter/material.dart';
import 'package:omnicare/app/theme/app_colors.dart';
import '../../../../core/constants/hero_tags.dart';
import 'organs_list.dart';

class _OrganItem extends StatefulWidget {
  final int index;
  final bool isSelected;
  final VoidCallback onTap;
  final double itemWidth;
  final double itemSpacing;

  const _OrganItem({
    required this.index,
    required this.isSelected,
    required this.onTap,
    required this.itemWidth,
    required this.itemSpacing,
  });

  @override
  State<_OrganItem> createState() => _OrganItemState();
}

class _OrganItemState extends State<_OrganItem> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: widget.onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedScale(
        scale: _isPressed ? 0.92 : 1.0,
        duration: const Duration(milliseconds: 100),
        child: Container(
          width: widget.itemWidth,
          height: widget.itemWidth,
          margin: EdgeInsets.only(
            right: widget.index == organsList.length - 1 ? 0 : widget.itemSpacing,
          ),
          child: Center(
            child: AnimatedScale(
              scale: widget.isSelected ? 1.1 : 0.85,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeOutBack,
              child: Hero(
                  tag: '${AppHeroTags.lungsTag}_${widget.index}',
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: Image.asset(
                    widget.isSelected
                        ? organsList[widget.index]['colored']!
                        : organsList[widget.index]['grey']!,
                    key: ValueKey<String>(
                        "${widget.index}_${widget.isSelected ? 'c' : 'g'}"),
                    width: 38,
                    height: 38,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class OrganSelector extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onChanged;

  const OrganSelector({
    super.key,
    required this.selectedIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    const double itemWidth = 56.0;
    const double itemSpacing = 16.0;
    const double totalItemWidth = itemWidth + itemSpacing;

    return SizedBox(
      height: 80,
      width: double.infinity,
      child: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.centerLeft,
            children: [
              AnimatedPositioned(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeOutQuart,
                left: selectedIndex * totalItemWidth,
                child: Container(
                  width: itemWidth,
                  height: itemWidth,
                  decoration: AppColors.commonDecoration(borderRadius: 20),
                ),
              ),
              Row(
                children: List.generate(organsList.length, (index) {
                  return _OrganItem(
                    index: index,
                    isSelected: selectedIndex == index,
                    onTap: () => onChanged(index),
                    itemWidth: itemWidth,
                    itemSpacing: itemSpacing,
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
