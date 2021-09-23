import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';
import 'package:piet/utilities/constants.dart';

class AppBody extends StatelessWidget {
  final List<Map<String, dynamic>> messages;

  const AppBody({
    Key key,
    this.messages = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, i) {
        var obj = messages[messages.length - 1 - i];
        Message message = obj['message'];
        bool isUserMessage = obj['isUserMessage'] ?? false;
        return Row(
          mainAxisAlignment:
          isUserMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _MessageContainer(
              message: message,
              isUserMessage: isUserMessage,
            ),
          ],
        );
      },
      separatorBuilder: (_, i) => Container(height: 10.0),
      itemCount: messages.length,
      reverse: true,
      padding: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 15,
      ),
    );
  }
}

class _MessageContainer extends StatelessWidget {
  final Message message;
  final bool isUserMessage;

  const _MessageContainer({
    Key key,
    @required this.message,
    this.isUserMessage = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 250),
      child: LayoutBuilder(
        builder: (context, constrains) {
          switch (message.type) {
            case MessageType.card:
              return _CardContainer(card: message.card);
            case MessageType.text:
            default:
              return Container(
                decoration: BoxDecoration(
                  color: isUserMessage ? kSecondaryColor : kPrimaryLightColor,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  message?.text?.text[0] ?? '',
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              );
          }
        },
      ),
    );
  }
}

class _CardContainer extends StatelessWidget {
  final DialogCard card;

  const _CardContainer({
    Key key,
    @required this.card,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        color: kPrimaryLightColor,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              constraints: BoxConstraints.expand(height: 150),
              child: Image.network(
                card.imageUri,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    card.title,
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  if (card.subtitle != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        card.subtitle,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  if (card.buttons.length > 0)
                    Container(
                      constraints: BoxConstraints(
                        maxHeight: 40,
                      ),
                      child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        // padding: const EdgeInsets.symmetric(vertical: 5),
                        itemBuilder: (context, i) {
                          CardButton button = card.buttons[i];
                          return MaterialButton(
                            textColor: Colors.white,
                            color: Colors.blue,
                            child: Text(button.text),
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content: Text(button.postback)),
                              );
                            },
                          );
                        },
                        separatorBuilder: (_, i) => Container(width: 10),
                        itemCount: card.buttons.length,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
