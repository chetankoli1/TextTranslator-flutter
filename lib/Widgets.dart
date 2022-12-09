import 'package:flutter/material.dart';

class EditText extends StatelessWidget {
  EditText({super.key, required this.textController, required this.decoration});
  TextEditingController textController = TextEditingController();
  InputDecoration decoration = const InputDecoration();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 150.0,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.red),
        ),
        child: Center(
          child: TextField(
              maxLines: 6,
              textInputAction: TextInputAction.newline,
              textAlign: TextAlign.center,
              controller: textController,
              decoration: decoration),
        ),
      ),
    );
  }
}
