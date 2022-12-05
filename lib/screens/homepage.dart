import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:images_picker/images_picker.dart';
import 'package:kikly_blockchain/widgets/properties_alert.dart';

import '../extras/colors.dart';
import '../widgets/view_alert.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var name = TextEditingController();
  var link = TextEditingController();
  var description = TextEditingController();
  var collection = TextEditingController();
  var supply = TextEditingController();

  String selectedCollection = 'Collection 1';
  String? path;
  List<String> collectionsList = [
    'Collection 1',
    'Collection 2',
    'Collection 3',
    'Collection 4',
  ];
  String selectedCoin = 'Ethereum';
  List<String> coinList = [
    'Ethereum',
    'Doge',
    'Blockchain',
    'Solana',
  ];
  bool status = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 05,
        leading: const Image(
          image: AssetImage('assets/images/kikly.png'),
        ),
        actions: const [
          Icon(
            Icons.search,
            color: Colors.black,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(
              Icons.list,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getHeight(10.h),
              Text(
                'Create New Item',
                style: TextStyle(
                  fontSize: 30.h,
                  fontWeight: FontWeight.w700,
                ),
              ),
              getHeight(15.h),
              const Text(
                'Image, video, audio or 3D model',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              getHeight(5.h),
              const Text(
                'File types Supported: JPG, PNG, GIF, SCG,',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              getHeight(15.h),
              InkWell(
                onTap: () async {
                  print('camra');
                  List<Media>? res = await ImagesPicker.pick(
                    count: 1,
                    pickType: PickType.all,
                    language: Language.System,
                    maxTime: 30,
                    // maxSize: 500,
                    cropOpt: CropOption(
                      // aspectRatio: CropAspectRatio.wh16x9,
                      cropType: CropType.circle,
                    ),
                  );
                  print(res);
                  if (res != null) {
                    print(res.map((e) => e.path).toList());
                    setState(() {
                      path = res[0].thumbPath;
                    });
                  };
                },

                child: Container(
                  width: double.infinity,
                  height: 200,
                  color: Colors.black12.withOpacity(.05),
                  child: DottedBorder(
                    color: Colors.black,
                    strokeWidth: .5,
                    child: (path == null) ?  Image.asset('assets/images/ph.png',
                        fit: BoxFit.contain, width: double.infinity) : Image.file(
                      File(path!),
                      fit: BoxFit.contain,
                      width: double.infinity,
                    ),
                  ),
                ),
              ),
              getHeight(15.h),
              Row(
                children: [
                  getHeading('Name'),
                  const Text(
                    '  *',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  )
                ],
              ),
              getHeight(10.h),
              getTextField('Item Name', name),
              getHeight(15.h),
              getHeading("External Link"),
              getHeight(8.h),
              getSubHeading(
                  'OpenSea will include a link to this URL on this item details, So that the user can click on the url to learn more about it. You are the welcome to link to your own webpage with more details'),
              getHeight(8.h),
              getTextField('https://www.google.com/search?q', link),
              getHeight(15.h),
              getHeading("Description"),
              getHeight(10.h),
              getSubHeading(
                  'This description will be included on the items details page underneath its image, Markdown syntex is supported'),
              getHeight(8.h),
              getTextField('https://www.google.com/search?q', description),
              getHeight(15.h),
              getHeading("Collection"),
              getHeight(10.h),
              getSubHeading(
                  'This is the collection where your items will be appear'),
              getHeight(8.h),
              getCollectionDropDown(context),
              getIconRow(
                  "Properties",
                  'Textual traits that show up as rectangles',
                  const Icon(Icons.list), () {
                print('Properties');
                showDialog(
                    context: context, builder: (context) => PropertiesAlert());
              }),
              getIconRow(
                  "Levels",
                  'Numerical traits that show as a progress bar ',
                  const Icon(Icons.star), () {
                print('Levels');
                showDialog(
                  context: context,
                  builder: (context) =>
                      LevelsAlert(
                        txt1: 'Levels',
                        txt2:
                        'Properties shown up underneth your item, are clickable, and can filtered in your collections sliderbar',
                      ),
                );
              }),
              getIconRow(
                  "Stats",
                  'Numerical traits that show as a progress bar ',
                  const Icon(Icons.auto_graph), () {
                print('stats');
                showDialog(
                  context: context,
                  builder: (context) =>
                      LevelsAlert(
                        txt1: 'Stats',
                        txt2:
                        'Properties shown up underneth your item, are clickable, and can filtered in your collections sliderbar',
                      ),
                );
              }),
              getIconRow(
                "Unlock Your content",
                'nclude unlockable content that can only be revealed by the owner of the item   ',
                const Icon(Icons.lock),
                    () {},
                toggle: getToggle(status),
              ),
              getHeight(10.h),
              getHeading("Supply"),
              getHeight(8.h),
              getSubHeading(
                  'The numbers of item that can be minted. No gas cost at you!'),
              getHeight(8.h),
              getTextField('1', supply),
              getHeight(10.h),
              getHeading("BlockChain"),
              getHeight(10.h),
              getBlockchainDropDown(context),
              getHeight(15.h),
              getHeading("Freeze metadata"),
              getHeight(8.h),
              getSubHeading(
                  'Freezing your metadata will allow you to permanently lock and store all of his items content is decenteralized file storage'),
              getHeight(10.h),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(vertical: 20.h),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.lightBlueAccent.withOpacity(.2),
                    border: Border.all(width: .5, color: Colors.black)),
                child: const Text(
                    'To freeze your MetaData, your must create your item first'),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 25.h),
                child: const Divider(
                  color: Colors.black,
                ),
              ),
              Container(
                height: 50.h,
                width: 200.w,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    "Create",
                    style: TextStyle(
                      fontSize: 24.w,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Center getToggle(bool check) {
    return Center(
      child: Container(
        child: FlutterSwitch(
          width: 100.w,
          height: 45.h,
          valueFontSize: 25.0,
          toggleSize: 25.0,
          value: check,
          borderRadius: 30.0,
          padding: 8.0,
          showOnOff: true,
          onToggle: (val) {
            setState(() {
              status = val;
            });
          },
        ),
      ),
    );
  }

  Padding getIconRow(String text1, String text2, Icon icon, onTap,
      {Widget? toggle}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          Expanded(flex: 1, child: icon),
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getHeading(text1),
                getSubHeading(text2),
              ],
            ),
          ),
          Expanded(
            flex: (toggle == null) ? 1 : 2,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color:
                      (toggle == null) ? Colors.black : Colors.transparent,
                      width: 1)),
              child: (toggle == null)
                  ? InkWell(onTap: onTap, child: const Icon(Icons.add))
                  : toggle,
            ),
          ),
        ],
      ),
    );
  }

  Container getCollectionDropDown(BuildContext context) {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width,
      height: 40,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black26, width: 1),
          borderRadius: BorderRadius.circular(10)),
      child: DropdownButton<String>(
        value: selectedCollection,
        isExpanded: true,
        icon: const Icon(Icons.arrow_drop_down),
        elevation: 16,
        style: TextStyle(color: CColors.textColor),
        underline: const SizedBox(),
        onChanged: (String? newValue) {
          setState(() {
            selectedCollection = newValue!;
          });
        },
        items: collectionsList.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(value),
            ),
          );
        }).toList(),
      ),
    );
  }

  Container getBlockchainDropDown(BuildContext context) {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width,
      height: 40,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black26, width: 1),
          borderRadius: BorderRadius.circular(10)),
      child: DropdownButton<String>(
        value: selectedCoin,
        isExpanded: true,
        icon: const Icon(Icons.arrow_drop_down),
        elevation: 16,
        style: TextStyle(color: CColors.textColor),
        underline: const SizedBox(),
        onChanged: (String? newValue) {
          setState(() {
            selectedCoin = newValue!;
          });
        },
        items: coinList.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(value),
            ),
          );
        }).toList(),
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

  Text getSubHeading(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 13,
      ),
    );
  }

  SizedBox getHeight(double h) {
    return SizedBox(
      height: h,
    );
  }

  TextFormField getTextField(String hint,
      TextEditingController controller,) {
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
      // validator: (value) {
      //   if (value == null || value.isEmpty) {
      //     return "Please enter text";
      //   }
      //   return null;
      // },
    );
  }
}
