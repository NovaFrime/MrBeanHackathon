import 'package:flutter/material.dart';

class OngoingFormPage extends StatefulWidget {
  const OngoingFormPage({super.key});

  @override
  State<OngoingFormPage> createState() => _OngoingFormPageState();
}

class _OngoingFormPageState extends State<OngoingFormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEEDACA),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 25,),
              Center(child: _buildOngoingForm()),
              SizedBox(height: 20,),
              Center(child: _buildOngoingForm()),
              SizedBox(height: 20,),
              Center(child: _buildOngoingForm()),
              SizedBox(height: 20,),
              Center(child: _buildOngoingForm()),
              SizedBox(height: 20,),
              Center(child: _buildOngoingForm()),
              SizedBox(height: 20,),
              Center(child: _buildOngoingForm()),
              SizedBox(height: 20,),
              Center(child: _buildOngoingForm()),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildOngoingForm() {
  return Container(
    width: 375,
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image(
          image: AssetImage('assets/items/userpicture.jpg'),
          width: 60,
          height: 80,
        ),
        SizedBox(width: 10,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Amount: 1000g',
              style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  fontSize: 24
              ),
            ),
            SizedBox(height: 5,),
            Text(
              'Date: 2024-02-25',
              style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 12
              ),
            ),
            SizedBox(height: 5,),
            Text(
              'Address: *****',
              style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 12
              ),
            ),
          ],
        ),
      ],
    ),
  );
}