import 'package:flutter/material.dart';
import '../widget/custom_text.dart';

class HomeView extends StatelessWidget {
  final String? name;
  final String? email; // Add this line to accept email

  const HomeView({Key? key, this.name, this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF3F4F9),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Row(
              children: [
                CustomText(
                  text: 'Name:',
                  fontsize: 15,
                  fontWeight: FontWeight.w700,
                  itemcolor: Colors.black87,
                ),
                Text(
                  ' $name',
                  style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 20),
              ],
            ),
            Row(
              children: [
                CustomText(
                  text: 'Email:',
                  fontsize: 15,
                  fontWeight: FontWeight.w700,
                  itemcolor: Colors.black87,
                ),
                Text(
                  ' $email',
                  style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 20),
              ],
            ),
            SizedBox(height: 30),
                ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Log out', style: TextStyle(color: Colors.blue)),
              ),

          ],
        ),
      ),
    );
  }
}
