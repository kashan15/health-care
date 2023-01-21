import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:soulgood/app/locator.dart';
import 'package:soulgood/client-side-views/book_session.dart';
import 'package:soulgood/client-side-views/bottom_app_book_session.dart';
import 'package:soulgood/forgetpasss/create_new_pass.dart';
import 'package:soulgood/forgetpasss/encripted.dart';
import 'package:soulgood/onboard/appointment.dart';
import 'package:soulgood/onboard/on_board.dart';
import 'package:soulgood/onboard/potential.dart';
import 'package:soulgood/client-side-views/after_subs_chat.dart';
import 'package:soulgood/client-side-views/appointment_schedule.dart';
import 'package:soulgood/client-side-views/home.dart';
import 'package:soulgood/client-side-views/profile.dart';
import 'package:soulgood/utils/app_localization.dart';
import 'package:soulgood/utils/color_utils.dart';
import 'package:soulgood/utils/dimensions.dart';
import 'package:soulgood/utils/image_utils.dart';
import 'package:soulgood/viewModels/main_view_model.dart';
import 'package:stacked/stacked.dart';

class BottomAppBar1 extends StatefulWidget {
  const BottomAppBar1({Key? key}) : super(key: key);

  @override
  State<BottomAppBar1> createState() => _BottomAppBar1State();
}

  MainViewModel model = locator<MainViewModel>();
class _BottomAppBar1State extends State<BottomAppBar1> {
  int selectedBottomApp = 0;
  static List<Widget> _widgetOptions = <Widget>[
    Home(),
    BottomAppBookSession(),
    AfterSubsChats(logController: model.logController),
    Profile()
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedBottomApp = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(selectedBottomApp),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: ColorUtils.greyLight.withOpacity(0.5),
              spreadRadius: 10,
              blurRadius: 10,
            )
          ],
        ),
        child: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                ImageUtils.home,
                color: selectedBottomApp == 0
                    ? ColorUtils.purple
                    : ColorUtils.black,
              ),
              label: AppLocalizations.of(context)!.translate('user_db_sidebar_text_13')!,
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                ImageUtils.appointment,
                color: selectedBottomApp == 1
                    ? ColorUtils.purple
                    : ColorUtils.black,
              ),
              label: AppLocalizations.of(context)!.translate('user_db_sidebar_text_16')!,
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                ImageUtils.chat,
                color: selectedBottomApp == 2
                    ? ColorUtils.purple
                    : ColorUtils.black,
              ),
              label: AppLocalizations.of(context)!.translate('user_db_sidebar_text_1')!,
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                ImageUtils.profile,
                color: selectedBottomApp == 3
                    ? ColorUtils.purple
                    : ColorUtils.black,
              ),
              label: AppLocalizations.of(context)!.translate('user_db_sidebar_text_15')!,
            ),
          ],
          currentIndex: selectedBottomApp,
          selectedItemColor: ColorUtils.purple,
          unselectedItemColor: ColorUtils.black,
          // elevation: 10,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
