import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../extras/colors.dart';

class PropertiesAlert extends StatefulWidget {
  PropertiesAlert({
    Key? key,
  }) : super(key: key);

  @override
  State<PropertiesAlert> createState() => _PropertiesAlertState();
}

class _PropertiesAlertState extends State<PropertiesAlert> {
  var screenWidth, screenHeight;
  var type = TextEditingController();
  var name = TextEditingController();

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
          children: const [
            Text(
              'Add Properties',
              textAlign: TextAlign.center,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Properties shown up underneth your item, are clickable, and can filtered in your collections sliderbar',
              textAlign: TextAlign.start,
              style: TextStyle(color: Colors.black, fontSize: 16),
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
                child: getTextField("Type", type),
              ),
              SizedBox(
                width: 4,
              ),
              Expanded(
                child: getTextField("Name", name),
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
            child: Divider(color: Colors.black,),
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
