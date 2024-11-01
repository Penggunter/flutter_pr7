import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<String> messages = [];
  bool isLoading = false;

  Future<void> _loadMessages() async {
    setState(() {
      isLoading = true;
    });
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      messages = ['Hello!', 'How are you?', 'This is an async message.'];
      isLoading = false;
    });
  }

  Future<void> _sendMessage(String message) async {
    await Future.delayed(Duration(milliseconds: 500));
    setState(() {
      messages.add(message);
    });
  }

  @override
  void initState() {
    super.initState();
    _loadMessages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Messenger')),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      return ListTile(title: Text(messages[index]));
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    onSubmitted: (text) {
                      if (text.isNotEmpty) {
                        _sendMessage(text);
                      }
                    },
                    decoration: const InputDecoration(
                      labelText: 'Type a message...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
