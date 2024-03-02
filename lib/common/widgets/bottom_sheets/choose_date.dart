import 'package:flutter/material.dart';
import 'package:poolino/date_picker.dart';

class ChooseDate {

  Future<void> showModal(context, {
    required Function() onTapChoose,
  }) async {

    showModalBottomSheet<void>(
      backgroundColor: Colors.white,
      showDragHandle: const bool.fromEnvironment("handle", defaultValue: true),
      elevation: 0,
      isScrollControlled: false,
      enableDrag: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20)),
      ),
      context: context,
      builder: (BuildContext context) {
        return DatePicker();
      },
    );
  }


}

