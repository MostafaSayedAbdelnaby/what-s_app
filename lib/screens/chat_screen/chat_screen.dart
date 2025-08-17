import 'package:flutter/material.dart';
import 'package:whats_app/screens/chat_screen/widgets/chat_message.dart';

class ChatScreen extends StatelessWidget {
  final Color green = const Color(0xff168C4B);
  final Color grey = const Color(0xff232D36);

  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black,
        image: DecorationImage(
          image: AssetImage("assets/images/pattern.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          toolbarHeight: 68,
          backgroundColor: const Color(0xff168C4B),
          shape: const OutlineInputBorder(
              borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          )),
          leading: const Icon(
            Icons.arrow_back_ios_new,
            color: Color(0xffFFFFFF),
          ),
          title: Row(
            children: [
              SizedBox(
                height: 37,
                width: 37,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: const Image(
                    image: AssetImage("assets/images/profile.jpeg"),
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                "John Safwat",
                style: TextStyle(
                  color: Color(0xffFFFFFF),
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          actions: [
            PopupMenuButton(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    onTap: () {
                      print("object");
                    },
                    child: const Text(
                      "data",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                  const PopupMenuItem(
                    child: Text(
                      "Ahmed",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                  const PopupMenuItem(
                    child: Text(
                      "data",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ];
              },
            ),
            // Icon(
            //   CupertinoIcons.phone,
            //   size: 25,
            //   color: Color(0xffFFFFFF),
            // ),
            // SizedBox(
            //   width: 15,
            // ),
            // Icon(
            //   CupertinoIcons.video_camera,
            //   size: 25,
            //   color: Color(0xffFFFFFF),
            // ),
            // SizedBox(
            //   width: 15,
            // ),
            // Icon(
            //   Icons.more_vert,
            //   size: 24,
            //   color: Color(0xffFFFFFF),
            // ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsetsDirectional.only(
            top: 20,
            start: 20,
            end: 20,
          ),
          child: Column(
            children: [
              const Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ChatMessage(message: "Hello", isSender: true),
                      SizedBox(height: 16),
                      ChatMessage(message: "Hello", isSender: false),
                      SizedBox(height: 16),
                      ChatMessage(
                          message:
                              "Hey! Have you ever thought about how random moments can sometimes turn into the best memories? It’s like the universe loves to surprise us when we least expect it!",
                          isSender: true),
                      SizedBox(height: 16),
                      ChatMessage(
                          message: 'assets/images/route.png',
                          isSender: true,
                          image: true),
                      SizedBox(height: 16),
                      ChatMessage(
                          message: "what a Great Content Tp learn\n Flutter",
                          isSender: false),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 20,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        cursorColor: green,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: green,
                            ),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: green,
                            ),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          hintText: "Type a Message ...",
                          hintStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                          prefixIcon: const Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.white,
                          ),
                          suffixIcon: Container(
                            padding: const EdgeInsets.all(8),
                            child: const ImageIcon(
                              AssetImage("assets/icons/Send.png"),
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    CircleAvatar(
                      radius: 22,
                      backgroundColor: green,
                      child: const ImageIcon(
                        AssetImage("assets/icons/Mic.png"),
                        color: Colors.white,
                        size: 26,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
