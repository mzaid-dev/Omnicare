import 'package:flutter/material.dart';
import 'package:omnicare/features/appointments/presentation/widgets/appointment_toggle.dart';
import 'package:omnicare/features/appointments/presentation/widgets/date_selector.dart';
import 'package:omnicare/features/appointments/presentation/widgets/doctor_info_card.dart';
import 'package:omnicare/features/appointments/presentation/widgets/time_selector.dart';
import 'package:omnicare/shared/widgets/appbar.dart';
import 'package:omnicare/shared/widgets/primary_button.dart';
import 'package:omnicare/app/theme/text_styles.dart';

import '../../../../app/theme/app_colors.dart';

class AppointmentsScreen extends StatefulWidget {
  const AppointmentsScreen({super.key});

  @override
  State<AppointmentsScreen> createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen> {
  int selectedDateIndex = 2;
  int selectedTimeIndex = 1;
  bool isBookSelected = true;

  final List<Map<String, String>> dates = [
    {'day': 'Mon', 'date': '10'},
    {'day': 'Tue', 'date': '11'},
    {'day': 'Wed', 'date': '12'},
    {'day': 'Thu', 'date': '13'},
    {'day': 'Fri', 'date': '14'},
  ];

  final List<String> times = ['8:00', '9:00', '10:00', '11:00', '12:00'];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        gradient: AppColors.linearGradient,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const MyAppbar(
                  title: "Appointments",
                  subTitle: "Select a specialist",
                  setIcon: false,
                ),
                const SizedBox(height: 24),
                AppointmentToggle(
                  isBookSelected: isBookSelected,
                  onToggle: () => setState(() => isBookSelected = !isBookSelected),
                ),
                const SizedBox(height: 32),
                const DoctorInfoCard(),
                const SizedBox(height: 40),
                Text(
                  "Appointment slot",
                  style: AppTextStyles.slotHeader,
                ),
                const SizedBox(height: 20),
                DateSelector(
                  dates: dates,
                  selectedIndex: selectedDateIndex,
                  onSelected: (index) => setState(() => selectedDateIndex = index),
                ),
                const SizedBox(height: 32),
                TimeSelector(
                  times: times,
                  selectedIndex: selectedTimeIndex,
                  onSelected: (index) => setState(() => selectedTimeIndex = index),
                ),
                const SizedBox(height: 48),
                PrimaryButton(
                  text: "Book now",
                  onTap: () {},
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
