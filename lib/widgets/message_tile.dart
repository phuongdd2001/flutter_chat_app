import 'package:flutter/material.dart';

class MessageTile extends StatefulWidget {
  final String message;
  final String sender;
  final String userAvatar;
  final bool sentByMe;
  final num totalMessage;
  final num indexMessage;

  const MessageTile({
    Key? key,
    required this.message,
    required this.sender,
    required this.userAvatar,
    required this.sentByMe,
    required this.totalMessage,
    required this.indexMessage,
  }) : super(key: key);

  @override
  State<MessageTile> createState() => _MessageTileState();
}

class _MessageTileState extends State<MessageTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: 4,
          bottom: (widget.indexMessage + 1) == widget.totalMessage ? 50 : 4,
          left: widget.sentByMe ? 0 : 24,
          right: widget.sentByMe ? 24 : 0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment:
            widget.sentByMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!widget.sentByMe) ...[
            widget.userAvatar != ''
                ? CircleAvatar(
              backgroundImage: NetworkImage(widget.userAvatar),
            )
                : Icon(
              Icons.account_circle,
              size: 45,
              color: Colors.grey[700],
            ),
            SizedBox(
              width: 10,
            ),
          ],
          Expanded(
            child: Container(
              alignment: widget.sentByMe
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image.network(
                  //     widget.userAvatar),
                  Container(
                    margin: widget.sentByMe
                        ? const EdgeInsets.only(left: 30)
                        : const EdgeInsets.only(right: 30),
                    padding: const EdgeInsets.only(
                        top: 10, bottom: 10, left: 20, right: 20),
                    decoration: BoxDecoration(
                        borderRadius: widget.sentByMe
                            ? const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                              )
                            : const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                        color: widget.sentByMe
                            ? Theme.of(context).primaryColor
                            : Colors.grey[700]),
                    child: Column(
                      crossAxisAlignment: widget.sentByMe
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                      children: [
                        if (!widget.sentByMe) ...[
                          Text(
                            widget.sender,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                letterSpacing: -0.5),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                        ],
                        Text(widget.message,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                fontSize: 16, color: Colors.white))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (widget.sentByMe) ...[
            SizedBox(
              width: 10,
            ),
            widget.userAvatar != ''
                ? CircleAvatar(
                    backgroundImage: NetworkImage(widget.userAvatar),
                  )
                : Icon(
                    Icons.account_circle,
                    size: 45,
                    color: Colors.grey[700],
                  ),
          ],
        ],
      ),
    );
  }
}
