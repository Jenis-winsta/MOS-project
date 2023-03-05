import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FeedbackPage extends StatefulWidget {
  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  //creating the controller for the textbox(used for taking inputs)
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _feedbackController = TextEditingController();
  final String _recipient = 'infoalphatech75@gmail.com';

  @override
  void dispose() {
    _nameController.dispose();
    _feedbackController.dispose();
    super.dispose();
  }

  void _sendFeedback() async {
    final name =
        _nameController.text.isEmpty ? 'anonymous' : _nameController.text;
    final feedback = _feedbackController.text;
    final subject = 'Feedback from $name';
    final body = 'Feedback: $feedback';
    // final url='mailto:$_recipient';
    final url ='mailto:$_recipient?subject=${Uri.encodeFull(subject)}&body=${Uri.encodeFull(body)}';

    // final Uri params = Uri(
    //   scheme: 'mailto',
    //   path: _recipient,
    //   query:
    //       'subject=App Feedback&body=App Version 3.23', //add subject and body here
    // );

    // var url = params.toString();
    // if (await canLaunch(url)) {
    //   await launch(url);
    // } else {
    //   throw 'Could not launch $url';
    // }
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Send Feedback'),
      //   backgroundColor: Colors.purple.shade700,
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Semantics(
              label: 'Name',
              child: TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  labelStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.purple.shade900,
                      width: 2,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.purple.shade700,
                    ),
                  ),
                ),
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Semantics(
              label: 'Feedback field',
              child: TextField(
                controller: _feedbackController,
                maxLines: 5,
                decoration: InputDecoration(
                  labelText: 'Feedback',
                  labelStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.purple.shade900,
                      width: 2,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.purple.shade700,
                    ),
                  ),
                ),
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Semantics(
                  label: 'Cancel',
                  child: ElevatedButton(
                    onPressed: () {
                      _nameController.text = "";
                      _feedbackController.text = "";
                    },
                    child: const Text('Cancel'),
                    style:
                        ElevatedButton.styleFrom(primary: Colors.purple.shade700),
                  ),
                ),
                Semantics(
                  label: 'Send feedback',
                  child: ElevatedButton(
                    onPressed: _sendFeedback,
                    child: const Text('Send'),
                    style:
                        ElevatedButton.styleFrom(primary: Colors.purple.shade700),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}/*
TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name (optional)',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _feedbackController,
              decoration: InputDecoration(
                labelText: 'Feedback',
              ),
              maxLines: 5,
            ),*/
