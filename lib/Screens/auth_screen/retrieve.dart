import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  final TextEditingController _inputController = TextEditingController();

  Future<void> _storeInput() async {
    String inputText = _inputController.text.trim();
    if (inputText.isNotEmpty) {
      try {
        await FirebaseFirestore.instance.collection('userInputs').add({
          'input': inputText,
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Input stored successfully')),
        );
        _inputController.clear();
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to store input')),
        );
      }
    }
  }

  // Function to get input data from Firestore
  Future<void> _getInputData() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('userInputs').get();
      querySnapshot.docs.forEach((doc) {
        print('Input: ${doc['input']}');
      });
    } catch (e) {
      print('Failed to retrieve input data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Store & Retrieve Input'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _inputController,
              decoration: InputDecoration(
                labelText: 'Enter your input',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _storeInput,
              child: Text('Store Input'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _getInputData,
              child: Text('Get Input Data'),
            ),
          ],
        ),
      ),
    );
  }
}
