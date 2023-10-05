import 'package:contactbook/screen/app_screen/calendarScreen/custom_button.dart';
import 'package:flutter/cupertino.dart';

class DeleteActionButton extends StatelessWidget {
  final String? text;
  final GestureTapCallback? onTap;

  const DeleteActionButton({Key? key, this.onTap, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomButton(
        onTap: onTap,
        width: 60,
        margin: const EdgeInsets.only(
            left: 18, right: 10),
        buttonLayout: Container(
          width: 60,
          height: 30,
          alignment: Alignment.center,
          child: Text(
            text!,
          ),
        ));
  }
}
