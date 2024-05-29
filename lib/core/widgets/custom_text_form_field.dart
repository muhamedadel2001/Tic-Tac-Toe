import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  final TextEditingController textEditingController;
  final String label;

  const CustomTextForm(
      {super.key, required this.textEditingController, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        validator: (value){
          if(value!.isEmpty){
            return 'Field Required';
          }
          return null;
        },
        keyboardType: TextInputType.name,
        controller: textEditingController,
        style:
        const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          label: Text(label),
          labelStyle:
          const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          prefixIcon: const Icon(
            Icons.person,
            color: Colors.white,
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.white,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(16)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.white,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(16)),
        ),
      ),
    );
  }
}