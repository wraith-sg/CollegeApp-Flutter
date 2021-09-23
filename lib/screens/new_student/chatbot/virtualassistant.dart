import 'package:flutter/material.dart';
import 'package:piet/screens/new_student/chatbot/app_body.dart';
import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:piet/utilities/constants.dart';

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  DialogFlowtter dialogFlowtter;
  final TextEditingController _controller = TextEditingController();

  List<Map<String, dynamic>> messages = [];

  @override
  void initState() {
    super.initState();
    DialogFlowtter.fromFile().then((instance) => dialogFlowtter = instance);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        brightness: Brightness.dark,
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: Text(
          'Virtual Assistant',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.25,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(child: AppBody(messages: messages)),
          Container(
            padding: EdgeInsets.symmetric(
              // horizontal: 5,
              vertical: 8,
            ),
            color: Colors.black,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xFF6F35A5),
                      width: 1,
                    ),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TextFormField(
                    controller: _controller,
                    keyboardType: TextInputType.text,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.bold,
                    ),
                    cursorColor: kPrimaryColor,
                    decoration: InputDecoration(
                      errorStyle: TextStyle(height: 0),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 15.0, top: 12.5),
                      prefixIcon: Icon(
                        Icons.question_answer_rounded,
                        color: kSecondaryColor,
                      ),
                      hintText: 'Enter your Query Here',
                      hintStyle: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  padding: EdgeInsets.only(right: 10.0),
                  color: kSecondaryColor,
                  icon: Icon(Icons.send),
                  onPressed: () {
                    sendMessage(_controller.text);
                    _controller.clear();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  void sendMessage(String text) async {
    if (text.isEmpty) return;
    setState(() {
      addMessage(
        Message(text: DialogText(text: [text])),
        true,
      );
    });

    DetectIntentResponse response = await dialogFlowtter.detectIntent(
      queryInput: QueryInput(text: TextInput(text: text)),
    );

    if (response.message == null) return;
    setState(() {
      addMessage(response.message);
    });
  }

  void addMessage(Message message, [bool isUserMessage]) {
    messages.add({
      'message': message,
      'isUserMessage': isUserMessage ?? false,
    });
  }

  @override
  void dispose() {
    dialogFlowtter.dispose();
    super.dispose();
  }
}
