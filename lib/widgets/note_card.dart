import 'package:flutter/material.dart';

class NoteCard extends StatefulWidget {
  final snap;
  NoteCard({
    Key? key,
    required this.snap,
  }) : super(key: key);

  @override
  State<NoteCard> createState() => _NoteCardState();
}

class _NoteCardState extends State<NoteCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.black54)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.snap['topic'],
                  textAlign: TextAlign.center,
                ),
                Text(
                  widget.snap['date'],
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Text(
            widget.snap['description'],
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
