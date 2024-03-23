import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_sample_app/common/common_export.dart';
import 'package:login_sample_app/l10n/l10n.dart';
import 'package:login_sample_app/presentation/journey/chat/chat_screen.dart';
import 'package:login_sample_app/presentation/journey/home/home_screen.dart';
import 'package:login_sample_app/presentation/journey/main/main_state.dart';
import 'package:login_sample_app/presentation/journey/main/main_state_notifier.dart';
import 'package:login_sample_app/presentation/journey/profile/profile_screen.dart';
import 'package:login_sample_app/presentation/journey/trips/trips_screen.dart';
import 'package:login_sample_app/presentation/theme/export.dart';
import 'package:login_sample_app/presentation/widgets/export.dart';

class MainScreen extends ConsumerWidget with LayoutExtension {
  MainScreen({Key? key}) : super(key: key);

  final List<String> titles = [
    L10n.current.home,
    L10n.current.trips,
    L10n.current.chat,
    L10n.current.profile,
  ];

  final List<IconData> icons = [
    Icons.home,
    Icons.airplanemode_on,
    Icons.chat_outlined,
    Icons.person,
  ];

  Widget _buildBottomNavigationItemWidget(
    BuildContext context, {
    Function()? onPressed,
    IconData? icon,
    String? title,
    bool isSelected = false,
  }) {
    return AppTouchable(
      onPressed: onPressed,
      outlinedBorder: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      width: screenWidth / 4,
      padding: EdgeInsets.only(
        top: AppDimens.space_8,
        bottom: AppDimens.space_8,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? AppColors.blue : AppColors.icon,
            size: AppDimens.space_24,
          ),
          SizedBox(
            height: AppDimens.height_4,
          ),
          AppText(
            title!,
            maxFontSize: AppDimens.space_12,
            style: ThemeText.bodyRegular.s12.copyWith(
              color: isSelected ? AppColors.blue : AppColors.icon,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar(
    BuildContext context, {
    required MainStateNotifier stateNotifier,
    required MainState state,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        _buildBottomNavigationItemWidget(context,
            title: titles[0],
            icon: icons[0],
            isSelected: state.currentIndex == 0,
            onPressed: () => stateNotifier.onChangedNav(0)),
        _buildBottomNavigationItemWidget(context,
            title: titles[1],
            icon: icons[1],
            isSelected: state.currentIndex == 1,
            onPressed: () => stateNotifier.onChangedNav(1)),
        _buildBottomNavigationItemWidget(context,
            title: titles[2],
            icon: icons[2],
            isSelected: state.currentIndex == 2,
            onPressed: () => stateNotifier.onChangedNav(2)),
        _buildBottomNavigationItemWidget(context,
            title: titles[3],
            icon: icons[3],
            isSelected: state.currentIndex == 3,
            onPressed: () => stateNotifier.onChangedNav(3)),
      ],
    );
  }

  final List<Widget> pages = [
    const HomeScreen(),
    const TripsScreen(),
    const ChatScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(mainProvider);
    final stateNotifier = ref.read(mainProvider.notifier);

    return Scaffold(
      //    backgroundColor: AppColors.grey100,
      body: pages[state.currentIndex],
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        notchMargin: 3,
        child: _buildBottomNavigationBar(
          context,
          state: state,
          stateNotifier: stateNotifier,
        ),
      ),
    );
  }
}
