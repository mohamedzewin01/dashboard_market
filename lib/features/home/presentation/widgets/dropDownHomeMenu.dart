import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropDownMenu extends StatelessWidget {
  DropDownMenu({super.key});

  final String dropDownValue = 'الارطاوية';

  final List<String> wilayaList = [
    'Al Artaweeiyah',
    'Majmaah',
    'Hafr albatin',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DropdownMenu(
            textStyle: TextStyle(
              overflow: TextOverflow.ellipsis,
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
            expandedInsets: EdgeInsets.all(0),
            menuStyle: Get.theme.dropdownMenuTheme.menuStyle,
            initialSelection: wilayaList[0],
            requestFocusOnTap: false,
            // hintText: "Location",
            width: 300,
            leadingIcon: const Icon(
              Icons.location_city_rounded,
              color: Color(0xff2382AA),
            ),
            onSelected: (String? value) {
              dropDownValue == value!;
            },
            dropdownMenuEntries:
                wilayaList.map<DropdownMenuEntry<String>>((String value) {
              return DropdownMenuEntry<String>(value: value, label: value);
            }).toList(),
          )
        ],
      ),
    );
  }
}
