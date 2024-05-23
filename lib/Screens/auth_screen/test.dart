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
    // Get the input text from the text field
    String inputText = "hello darling";

    // Check if input text is not empty
    if (inputText.isNotEmpty) {
      try {
        // Store the input text in Firestore
        await FirebaseFirestore.instance.collection('userInputs').add({
          'input': inputText,
        });

        // Show a success message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Input stored successfully')),
        );

        // Clear the input text field
        _inputController.clear();
      } catch (e) {
        // Show an error message if storing the input fails
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to store input')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Store Input in Firestore'),
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
          ],
        ),
      ),
    );
  }
}
