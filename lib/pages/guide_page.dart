import 'package:flutter/material.dart';
import 'package:google_gemini/google_gemini.dart';

const apiKey = "AIzaSyBKqwwRtMcKfR3RrBTontCgU3m8zlmPhkI";

class GuidePage extends StatefulWidget {
  const GuidePage({
    super.key,
  });

  @override
  State<GuidePage> createState() => _GuidePageState();
}

class _GuidePageState extends State<GuidePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffEEDACA),

        body: const TextOnly());
  }
}

class TextOnly extends StatefulWidget {
  const TextOnly({
    super.key,
  });

  @override
  State<TextOnly> createState() => _TextOnlyState();
}

class _TextOnlyState extends State<TextOnly> {
  bool loading = false;
  List textChat = [];
  List textWithImageChat = [];

  final TextEditingController _textController = TextEditingController();
  final ScrollController _controller = ScrollController();

  final gemini = GoogleGemini(
    apiKey: apiKey,
  );

  void fromText({required String query}) {
    setState(() {
      loading = true;
      textChat.add({
        "role": "User",
        "text": query,
      });
      _textController.clear();
    });
    scrollToTheEnd();

    gemini.generateFromText(query).then((value) {
      setState(() {
        loading = false;
        textChat.add({
          "role": "Your Gemini assistance",
          "text": value.text,
        });
      });
      scrollToTheEnd();
    }).onError((error, stackTrace) {
      setState(() {
        loading = false;
        textChat.add({
          "role": "Gemini",
          "text": error.toString(),
        });
      });
      scrollToTheEnd();
    });
  }

  void scrollToTheEnd() {
    _controller.jumpTo(_controller.position.maxScrollExtent);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffEEDACA),
        body: Container(
          margin: const EdgeInsets.fromLTRB(0,5,0, 10),
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(color: Colors.grey),
          ),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  controller: _controller,
                  itemCount: textChat.length,
                  padding: const EdgeInsets.only(bottom: 20),
                  itemBuilder: (context, index) {
                    return ListTile(
                      isThreeLine: true,
                      leading: CircleAvatar(
                        child: Text(textChat[index]["role"].substring(0, 1)),
                      ),
                      title: Text(textChat[index]["role"]),
                      subtitle: Text(textChat[index]["text"],style: TextStyle(fontSize: 20),),
                    );
                  },
                ),
              ),
              Container(
                alignment: Alignment.bottomRight,
                margin: const EdgeInsets.all(15),
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: Colors.grey),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _textController,
                        decoration: InputDecoration(
                          hintText: "Type a message",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide.none),
                          fillColor: Colors.transparent,
                        ),
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                      ),
                    ),
                    IconButton(
                      icon: loading
                          ? const CircularProgressIndicator()
                          : const Icon(Icons.send),
                      onPressed: () {
                        fromText(query: _textController.text);
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
