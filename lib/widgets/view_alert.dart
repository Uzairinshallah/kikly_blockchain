import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../extras/colors.dart';

class LevelsAlert extends StatefulWidget {
  LevelsAlert({
    required this.txt1,
    required this.txt2,
    Key? key,
  }) : super(key: key);

  String txt1;
  String txt2;

  @override
  State<LevelsAlert> createState() => _LevelsAlertState();
}

class _LevelsAlertState extends State<LevelsAlert> {
  var screenWidth, screenHeight;
  var type = TextEditingController();
  var n1 = TextEditingController();
  var n2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      title: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Text(
              widget.txt1,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              widget.txt2,
              textAlign: TextAlign.start,
              style: const TextStyle(color: Colors.black, fontSize: 16),
            ),
          ],
        ),
      ),
      titlePadding: const EdgeInsets.all(0),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: getHeading("Type"),
              ),
              Expanded(
                child: getHeading("Name"),
              ),
            ],
          ),
          getHeight(15.h),
          Row(
            children: [
              Expanded(
                flex: 4,
                child: getTextField("Type", type),
              ),
              const SizedBox(
                width: 4,
              ),
              Expanded(
                flex: 2,
                child: getTextField("3", n1),
              ),
              const SizedBox(
                width: 4,
              ),
              Expanded(
                flex: 2,
                child: getTextField("7", n2),
              ),
            ],
          ),
          getHeight(15.h),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: .5),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              child: const Text(
                "Add More",
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15.h),
            child: Divider(
              color: Colors.black,
            ),
          ),
          getSaveButton(),
        ],
      ),
    );
  }

  Container getSaveButton() {
    return Container(
      height: 50.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          "Save",
          style: TextStyle(
            fontSize: 24.w,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  TextFormField getTextField(
    String hint,
    TextEditingController controller,
  ) {
    return TextFormField(
      controller: controller,
      style: TextStyle(
        color: CColors.textColor,
        fontSize: 12,
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 7, horizontal: 14),
        hintText: hint,
        labelStyle: TextStyle(
          color: CColors.textColor,
          fontSize: 14,
        ),
        fillColor: Colors.black.withOpacity(.06),
        filled: true,
      ),
    );
  }

  Text getHeading(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 18,
      ),
    );
  }

  SizedBox getHeight(double h) {
    return SizedBox(
      height: h,
    );
  }
}
