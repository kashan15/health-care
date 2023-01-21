import 'package:flutter/material.dart';
import 'package:soulgood/viewModels/navigation_service.dart';
import 'package:stacked_services/stacked_services.dart';

import '../main.dart';

class DialogUtils {
  Navigation_Service navigate = Navigation_Service();

  Future<void> showDialog(Widget yourDialog, {bool? isDismissable}) =>
      showGeneralDialog(
        transitionBuilder: (context, a1, a2, widget) {
          final curvedValue = Curves.easeInOutBack.transform(a1.value) - 1.0;
          final bouncyValue = Curves.bounceOut.transform(a1.value) - 1.0;
          return Transform(
            transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
            child: Opacity(
              opacity: a1.value,
              child: Transform(
                transform:
                    Matrix4.translationValues(0.0, bouncyValue * 500, 0.0),
                child: yourDialog,
              ),
            ),
          );
        },
        transitionDuration: Duration(milliseconds: 400),
        pageBuilder: (context, animation1, animation2) {
          return SizedBox.shrink();
        },
        barrierColor: Colors.black.withOpacity(0.6),
        context: StackedService.navigatorKey!.currentContext!,
        barrierLabel: '',
        barrierDismissible: isDismissable ?? false,
      );
}
