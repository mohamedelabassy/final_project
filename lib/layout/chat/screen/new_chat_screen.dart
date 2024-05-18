import 'package:final_project/layout/chat/widgets/message_widget.dart';
import 'package:final_project/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:intl/intl.dart';

class NewChatScreen extends StatefulWidget {
  static const String routeName = 'newChatScreen';
  const NewChatScreen({super.key});

  @override
  State<NewChatScreen> createState() => _NewChatScreenState();
}

class _NewChatScreenState extends State<NewChatScreen> {
  final TextEditingController _userInput = TextEditingController();

  // ai////////////////////////////////////////////////////
  final apiKey = 'AIzaSyB59eItHUkQCcKAcro1uyG2jeTikJLLir4';
  final List<Message> _messages = []; // - = private
  Future<void> talkWithGemini() async {
    final userMsg = _userInput.text;
    setState(
      () {
        _messages
            .add(Message(isUser: true, message: userMsg, date: DateTime.now()));
      },
    );

    final model = GenerativeModel(model: 'gemini-pro', apiKey: apiKey);
    final content = Content.text(userMsg);
    final response = await model.generateContent([content]);
    print('respsonse from gemini ai : ${response.text}');
    setState(
      () {
        _messages.add(Message(
            isUser: false, message: response.text ?? "", date: DateTime.now()));
      },
    );
    ////
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        title: const Text(
          'ZABATLY',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColor.backgroundColor,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  return Messages(
                      isUser: message.isUser,
                      message: message.message,
                      date: DateFormat('HH:mm').format(message.date));
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  flex: 15,
                  child: TextFormField(
                    controller: _userInput,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      label: const Text(
                        'Enter your message',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                IconButton(
                  padding: const EdgeInsets.all(12),
                  onPressed: () {
                    talkWithGemini();
                    _userInput.clear();
                  },
                  icon: const Icon(
                    Icons.send,
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all(
                      const CircleBorder(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
