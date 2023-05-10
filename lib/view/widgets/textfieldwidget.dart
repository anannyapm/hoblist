import 'package:flutter/material.dart';


class TextFieldWidget extends StatelessWidget {
  final String hint;
  final String label;
  final TextEditingController textController;
  final TextInputType typeValue;

  const TextFieldWidget(
      {super.key,
      required this.hint,
      required this.label,
      required this.textController,
      this.typeValue = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: TextFormField(
          controller: textController,
          obscureText: typeValue==TextInputType.visiblePassword?true:false,
          keyboardType: typeValue,
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                  borderSide:
                      const BorderSide(width: 1, color: Colors.black),
                  borderRadius: BorderRadius.circular(15)),
              hintText: hint,
              labelText: label),
          validator: (value) {
            if (value == null || value.isEmpty || value.trim().isEmpty) {
              return '$label cannot be Empty!';
            } else {
              if (typeValue == TextInputType.emailAddress) {
                if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value.trim())) {
                  return 'Please enter a valid email id!!';
                } else {
                  return null;
                }
              } 
    
              else if (typeValue == TextInputType.text || typeValue == TextInputType.name) {
                if (!RegExp(r'^\S$|^\S[ \S]*\S$').hasMatch(value.trim())) {
                  return 'Please enter a valid text!';
                } else {
                  return null;
                }
              }
    
              else if (typeValue == TextInputType.number) {
                if (value.trim().length<10) {
                  return 'Please enter a valid phone number!';
                } else {
                  return null;
                }
              }
    
              else if (typeValue == TextInputType.visiblePassword ) {
                if (value.trim().length<8) {
                  return 'Password should have minimum 8 length!';
                } else {
                  return null;
                }
              }
              
              else {
                return null;
              }
            }
          },
        ),
      ),
    );
  }
}
