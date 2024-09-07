import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback ontab;
  const RoundButton({super.key, required this.title, required this.ontab});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontab,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color:Colors.blue
        ),
        child: Center(
          child: Text(title,style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w800
          ),),
        ),

      ),
    );
  }
}
