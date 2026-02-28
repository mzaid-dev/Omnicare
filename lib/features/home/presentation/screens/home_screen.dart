import 'package:flutter/material.dart';
import 'package:omnicare/features/home/data/repositories/organ_repository.dart';
import 'package:omnicare/features/home/presentation/widgets/chart_container.dart';
import 'package:omnicare/features/home/presentation/widgets/organ_display.dart';
import 'package:omnicare/features/home/presentation/widgets/organ_selector.dart';
import 'package:omnicare/features/home/presentation/widgets/small_chart_card.dart';
import 'package:omnicare/shared/widgets/appbar.dart';
import '../../../../app/theme/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedOrganIndex = 2;

  double get height => MediaQuery.of(context).size.height;

  @override
  Widget build(BuildContext context) {
    final organ = OrganRepository.allOrgans[selectedOrganIndex];

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          gradient: AppColors.linearGradient,
        ),
        child: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              OrganDisplay(
                selectedOrganIndex: selectedOrganIndex,
                height: height,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    _buildAnimatedItem(
                      index: 0,
                      child: const MyAppbar(
                        title: "Anna",
                        subTitle: "How is your body doing today?",
                        setIcon: true,
                      ),
                    ),
                    _buildAnimatedItem(
                      index: 1,
                      child: OrganSelector(
                        selectedIndex: selectedOrganIndex,
                        onChanged: (index) =>
                            setState(() => selectedOrganIndex = index),
                      ),
                    ),
                    const Spacer(),
                    _buildAnimatedItem(
                      index: 2,
                      child: ChartContainer(selectedOrganIndex: selectedOrganIndex),
                    ),
                    const SizedBox(height: 4),
                    _buildAnimatedItem(
                      index: 3,
                      child: Row(
                        children: [
                          Expanded(
                            child: AnimatedSwitcher(
                              duration: const Duration(milliseconds: 500),
                              transitionBuilder: _bounceTransition,
                              child: SmallChartCard(
                                key: ValueKey('card2_$selectedOrganIndex'),
                                title: organ.card2Title,
                                value: organ.card2Value,
                                data: organ.card2Data,
                                icon: organ.card2Icon,
                                accent: organ.accent,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: AnimatedSwitcher(
                              duration: const Duration(milliseconds: 580),
                              transitionBuilder: _bounceTransition,
                              child: SmallChartCard(
                                key: ValueKey('card3_$selectedOrganIndex'),
                                title: organ.card3Title,
                                value: organ.card3Value,
                                data: organ.card3Data,
                                icon: organ.card3Icon,
                                accent: organ.accent,
                                useTrackedChart: true,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).padding.bottom + 98,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bounceTransition(Widget child, Animation<double> animation) {
    final scale = Tween<double>(begin: 0.80, end: 1.0).animate(
      CurvedAnimation(parent: animation, curve: Curves.elasticOut),
    );
    return FadeTransition(
      opacity: CurvedAnimation(parent: animation, curve: Curves.easeOutQuart),
      child: ScaleTransition(scale: scale, child: child),
    );
  }

  Widget _buildAnimatedItem({required int index, required Widget child}) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: Duration(milliseconds: 800 + index * 100),
      curve: Curves.easeOutQuart,
      builder: (context, value, child) {
        return Opacity(
          opacity: index == 1 ? 1.0 : value,
          child: Transform.translate(
            offset: Offset(0, 30 * (1 - value)),
            child: child,
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.only(top: index == 0 ? 0 : 12),
        child: child,
      ),
    );
  }
}
