// trade_page.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:file_picker/file_picker.dart';

class TradePage extends StatefulWidget {
  const TradePage({Key? key}) : super(key: key);

  @override
  _TradePage createState() => _TradePage();
}

class _TradePage extends State<TradePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  String fullName = '';
  String address = '';
  String phoneNumber = '';
  String email = '';
  String amount = '';
  List<String> images = [];
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  CollectionReference forms = FirebaseFirestore.instance.collection('forms');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEEDACA),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildName(),
                const SizedBox(height:  10),
                _buildAddress(),
                const SizedBox(height:  10),
                _buildNumber(),
                const SizedBox(height:  10),
                _buildEmail(),
                const SizedBox(height:  10),
                _buildAmount(),
                const SizedBox(height:  10),
                _buildImageUpload(context),
                const SizedBox(height:  10),
                _buildDateTimeFields(context),
                const SizedBox(height:  10),
                _buildSubmitBtn(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> uploadForm() async {
    final User? user = _auth.currentUser;
    forms
        .add({
      "userId": user?.uid,
      "fullName": fullName,
      "address": address,
      "phoneNumber": phoneNumber,
      "email": email,
      "amount": amount,
      "images": images,
      "date": _dateController.value.text,
      "time": _timeController.value.text
    })
        .then((value) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Form sent"),
          duration: Duration(seconds:  2),
        ),
      );
    })
        .catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Form failed to send"),
          duration: Duration(seconds:  2),
        ),
      );
    });
  }

  Widget _buildSubmitBtn() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          uploadForm();
        }
      },
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity,  42),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        backgroundColor: const Color(0xffDE9D45),
      ),
      child: const Text(
        'CREATE COLLECTION FORM',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize:  18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Full Name',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 4),
        SizedBox(
          height: 42,
          child: TextFormField(
            onChanged: (val) {
              setState(() => fullName = val);
            },
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 10)),
            keyboardType: TextInputType.name,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
            // Add saving logic if needed
          ),
        )
      ],
    );
  }

  Widget _buildAddress() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Address',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 4),
        SizedBox(
          height: 42,
          child: TextFormField(
            onChanged: (val) {
              setState(() => address = val);
            },
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
                labelText: 'Address',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 10)),
            keyboardType: TextInputType.streetAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your address';
              }
              return null;
            },
            // Add saving logic if needed
          ),
        )
      ],
    );
  }

  Widget _buildNumber() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Phone number',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 4),
        SizedBox(
          height: 42,
          child: TextFormField(
            onChanged: (val) {
              setState(() => phoneNumber = val);
            },
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
                labelText: 'Phone number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 10)),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your phone number';
              }
              return null;
            },
            // Add saving logic if needed
          ),
        )
      ],
    );
  }

  Widget _buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Email address',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 4),
        SizedBox(
          height: 42,
          child: TextFormField(
            onChanged: (val) {
              setState(() => email = val);
            },
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 10)),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              return null;
            },
            // Add saving logic if needed
          ),
        )
      ],
    );
  }

  Widget _buildAmount() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Amount (in grams)',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 4),
        SizedBox(
          height: 42,
          child: TextFormField(
            onChanged: (val) {
              setState(() => amount = val);
            },
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
                labelText: 'Amount',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 10)),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your amount';
              }
              return null;
            },
            // Add saving logic if needed
          ),
        )
      ],
    );
  }

  Widget _buildDateTimeFields(context) {
    return Flex(
      direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: _buildDate(context)),
        const SizedBox(width: 8),
        Expanded(child: _buildTime(context))
      ],
    );
  }

  Widget _buildDate(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Collect date',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 4),
        SizedBox(
          height: 42,
          child: TextFormField(
              controller: _dateController,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                  labelText: 'Date',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10)),
              keyboardType: TextInputType.datetime,
              readOnly: true,
              onTap: () {
                _selectDate(context);
              }),
        )
      ],
    );
  }

  Future<void> _selectDate(context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _dateController.text = picked.toString().split(" ")[0];
      });
    }
  }

  Widget _buildTime(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Collect time',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 4),
        SizedBox(
          height: 42,
          child: TextFormField(
              controller: _timeController,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                  labelText: 'Time',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10)),
              keyboardType: TextInputType.datetime,
              readOnly: true,
              onTap: () {
                _selectTime(context);
              }),
        )
      ],
    );
  }

  Future<void> _selectTime(context) async {
    TimeOfDay? picked =
    await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (picked != null) {
      int hour = picked.hour;
      if (picked.period == DayPeriod.pm) {
        hour += 12;
      }
      String formattedTime = "${hour - 12}:${picked.minute}";
      setState(() {
        _timeController.text = formattedTime;
      });
    }
  }

  Widget _buildImageUpload(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Images',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 4),
        SizedBox(
          height: 120,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () async {
              FilePickerResult? result =
              await FilePicker.platform.pickFiles(type: FileType.image);
              if (result != null) {
                // Here you can handle the selected files
                List<File> files = result.paths.map((path) => File(path!)).toList();
                for (int i = 0; i < files.length; i++) {
                  String url = await uploadImages(files[i]);
                  images.add(url);
                }
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: const BorderSide(color: Colors.black54),
              ),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.camera_alt,
                  size: 32,
                  color: Colors.black,
                ),
                SizedBox(width: 2),
                Text(
                  'Upload images',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<String> uploadImages(File file) async {
    final metaData = SettableMetadata(contentType: "image/jpeg");
    final storageRef = FirebaseStorage.instance.ref();
    Reference ref = storageRef
        .child('pictures/${DateTime.now().microsecondsSinceEpoch}.jpg');
    final uploadTask = ref.putFile(file, metaData);
    final taskSnapshot = await uploadTask.whenComplete(() => print("Upload image success"));
    String url = await taskSnapshot.ref.getDownloadURL();
    return url;
  }
}
