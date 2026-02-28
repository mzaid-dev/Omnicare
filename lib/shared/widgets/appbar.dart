import 'package:flutter/material.dart';
import 'package:omnicare/app/theme/app_colors.dart';
import 'package:omnicare/app/theme/text_styles.dart';
import 'package:omnicare/core/assets.dart';
import 'package:omnicare/shared/widgets/pulsing_dot.dart';

class MyAppbar extends StatelessWidget {
  final String title;
  final String subTitle;
  final bool setIcon;


  const MyAppbar({
    super.key,
    required this.title,
    required this.subTitle,
    required this.setIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (setIcon)
          Column(
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.primary.withOpacity(0.1),
                        width: 1,
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 32,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage(AppAssets.girlIcon),
                    ),
                  ),
                  const Positioned(
                    right: 4,
                    bottom: 4,
                    child: PulsingDot(size: 14),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Hello, ",
                      style: AppTextStyles.heading2.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppTextStyles.greyText,
                      ),
                    ),
                    TextSpan(
                      text: title,
                      style: AppTextStyles.heading2,
                    ),
                  ],
                ),
              ),
            ],
          )
        else
          Text(title, style: AppTextStyles.heading2),
        const SizedBox(height: 4),
        Text(
          subTitle,
          style: AppTextStyles.subtitle,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
