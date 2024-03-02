import 'package:flutter/material.dart';
import 'package:poolino/common/widgets/buttons/button_primary.dart';

class LogoutBottomSheet {

  Future<void> showModal(context) async {

    showModalBottomSheet<void>(
      backgroundColor: Colors.white,
      showDragHandle: const bool.fromEnvironment("handle", defaultValue: true),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20)),
      ),
      context: context,
      builder: (BuildContext context) {
        return Column(
          children: [
            Text("log out"),
            ButtonPrimary(text: "ورود مجدد", isEnabled: true, onPressed: (){
              print("lllllllllllll");
              Navigator.pushNamed(context, "/phone");
              //Navigator.pop(context);
            })
          ],
        );
      },
    );
  }

}

