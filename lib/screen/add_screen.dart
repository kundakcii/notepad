import 'package:deneme_1/providers/mobile_screen_app_bar_provider.dart';
import 'package:deneme_1/providers/user_provider.dart';
import 'package:deneme_1/services/note_service.dart';
import 'package:deneme_1/widgets/text_field_input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddScreen extends StatefulWidget {
  AddScreen({Key? key}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  bool _isLoading = false;
  final TextEditingController _topicController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  void addNote(
    String uid,
    String name,
    String surname,
  ) async {
    try {
      String res = await NoteService().uploadNote(
        _topicController.text,
        _descriptionController.text,
        uid,
        name,
        surname,
      );
      if (res == "succes") {
      } else {}
    } catch (err) {}
  }

  @override
  Widget build(BuildContext context) {
    final UserProvider _userProvider = Provider.of<UserProvider>(context);

    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: MobileScreenAppBarProvider().setColors(),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: GestureDetector(
                onTap: () {},
                child: Icon(Icons.more_vert),
              ),
            ),
          ],
          title: Text(
            'Not Ekle',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: CoreTextFieldInput(
                  hintText: 'lütfen bir başlık girniz',
                  textEditingController: _topicController,
                  textInputType: TextInputType.text,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: CoreTextFieldInput(
                  hintText: 'not al kontrol et unutma',
                  textEditingController: _descriptionController,
                  textInputType: TextInputType.multiline,
                  maxline: 15,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 5,
                  vertical: height / 13,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(224, 173, 1, 1),
                    borderRadius: BorderRadius.circular(11),
                  ),
                  width: double.infinity,
                  child: Consumer(
                    builder: (context, UserProvider _value, child) =>
                        TextButton(
                            onPressed: () => addNote(
                                  _value.getUser.uid,
                                  _value.getUser.name,
                                  _value.getUser.surname,
                                ),
                            child: const Text(
                              'Ekle',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
