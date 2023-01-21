import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:soulgood/client-side-views/appointment_schedule.dart';
import 'package:soulgood/client-side-views/profile.dart';
import 'package:soulgood/therapist-side-view/chats.dart';
import 'package:soulgood/therapist-side-view/contacts_list_page.dart';
import 'package:soulgood/therapist-side-view/home.dart';
import 'package:soulgood/therapist-side-view/therapist_profile.dart';
import 'package:soulgood/utils/app_localization.dart';
import 'package:soulgood/utils/color_utils.dart';
import 'package:soulgood/utils/image_utils.dart';
import 'package:soulgood/viewModels/main_view_model.dart';
import 'package:stacked/stacked.dart';

import '../app/locator.dart';

class TherapistBottomAppBar extends StatefulWidget {
  const TherapistBottomAppBar({Key? key}) : super(key: key);

  @override
  _TherapistBottomAppBarState createState() => _TherapistBottomAppBarState();
}

class _TherapistBottomAppBarState extends State<TherapistBottomAppBar> {
  int selectedBottomApp = 0;
  static List<Widget> _widgetOptions = <Widget>[
    TherapistHome(),
    ContactsPage(),
    TherapistProfile()
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedBottomApp = index;
    });
  }

  @override
  Widget build(BuildContext context) {
     
    return ViewModelBuilder<MainViewModel>.reactive(
        viewModelBuilder: () => locator<MainViewModel>(),
        disposeViewModel: false,
        onModelReady: (model) async {
          model.socket =
              io('https://api.soulgoodhealth.com:5000', <String, dynamic>{
            'transports': ['websocket'],
            'autoConnect': false,
          });
          model.socket!.connect();
          model.socket!.onConnect((_) {
            print('connect');
            // model.socket!.emit('checkingResponse', 'test');
          });
          model.socket!.on('appointmentEnabled', (data) {
            print(data);
            if(model.therapistId == data['therapistId']){
              if (model.therapistUpcomingData.where((element) => element.id == data['appointmentId']).isNotEmpty){
                var index = model.therapistUpcomingData.indexWhere((element) => element.id == data['appointmentId']);
                 if (index != -1) {
                   model.therapistUpcomingData[index].isEnabled = 1;
                           model.getTherapistAppointmentsByWeek();

                   model.notifyListeners();
                 }
                 }
              }
            
            });
          model.socket!.onDisconnect((_) => print('disconnect'));
          model.socket!.on('fromServer', (_) => print(_));
        },
        builder: (context, model, child) {
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
                ImageUtils.appointment,
                color: selectedBottomApp == 0
                    ? ColorUtils.purple
                    : ColorUtils.black,
              ),
              label: 'Bookings',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                ImageUtils.client,
                color: selectedBottomApp == 1
                    ? ColorUtils.purple
                    : ColorUtils.black,
              ),
              label: 'Clients',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                ImageUtils.profile,
                color: selectedBottomApp == 2
                    ? ColorUtils.purple
                    : ColorUtils.black,
              ),
              label: 'Profile',
            ),
          ],
          currentIndex: selectedBottomApp,
          selectedItemColor: ColorUtils.purple,
          unselectedItemColor: ColorUtils.black,
          // elevation: 10,
          onTap: _onItemTapped,
        ),
      ),
    );});
  }
}
