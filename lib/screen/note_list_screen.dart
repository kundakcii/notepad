import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deneme_1/providers/mobile_screen_app_bar_provider.dart';
import 'package:deneme_1/widgets/note_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotListScreen extends StatefulWidget {
  const NotListScreen({Key? key}) : super(key: key);

  @override
  State<NotListScreen> createState() => _NotListScreenState();
}

class _NotListScreenState extends State<NotListScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: Color.fromARGB(223, 5, 196, 209),
          actions: [],
          title: Center(
            child: Consumer(
              builder: (context,
                      MobileScreenAppBarProvider _mobileScreenAppBarProvider,
                      child) =>
                  Text(
                'Notların',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('notes').snapshots(),
          builder: (context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (ctx, index) => Container(
                child: NoteCard(
                  snap: snapshot.data!.docs[index].data(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
