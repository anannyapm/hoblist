import 'package:assignment/view/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import '../../viewmodel/appviewmodel.dart';

class DropDownWidget extends StatefulWidget {
  const DropDownWidget({super.key});

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  String selectedValue = '';
  List<DropdownMenuItem<String>> menuItems = const [
    DropdownMenuItem(value: '', child: Text("Select Profession")),
    DropdownMenuItem(value: "Teacher", child: Text("Teacher")),
    DropdownMenuItem(value: "Developer", child: Text("Developer")),
    DropdownMenuItem(value: "Designer", child: Text("Designer")),
    DropdownMenuItem(value: "Doctor", child: Text("Doctor")),
    DropdownMenuItem(value: "Actor", child: Text("Actor")),
  ];
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 2),
            borderRadius: BorderRadius.circular(20),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
        dropdownColor: Colors.white,
        value: selectedValue,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return "Select a value for profession";
          }
        },
        onChanged: (String? newValue) {
          setState(() {
            selectedValue = newValue!;
            professionValue = selectedValue;
          });
        },
        items: menuItems);
  }
}
