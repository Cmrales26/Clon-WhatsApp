import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:whastsapp/model/chatmodel.dart';

class Chat extends StatefulWidget {
  const Chat({super.key, required this.chatModel});
  final ChatModel chatModel;

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final FocusNode _focusNode = FocusNode();
  bool _emojiShowing = false;

  void onEmojiSelected(Emoji emoji) {
    _controller.text += emoji.emoji;
  }

  void toggleEmojiPicker() {
    if (_emojiShowing) {
      _focusNode.requestFocus();
    } else {
      _focusNode.unfocus();
    }
    setState(() {
      _emojiShowing = !_emojiShowing;
    });
  }

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus && _emojiShowing) {
        setState(() {
          _emojiShowing = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        leadingWidth: 70,
        backgroundColor: Theme.of(context).primaryColor,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 24,
              ),
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey,
                child: Icon(
                  widget.chatModel.isGroup ? Icons.groups : Icons.person,
                  color: Colors.white,
                  size: 25,
                ),
              )
            ],
          ),
        ),
        title: InkWell(
          onTap: () {},
          child: Column(
            children: [
              Text(
                widget.chatModel.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18.5,
                ),
              )
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.videocam_outlined,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.call_outlined,
              color: Colors.white,
            ),
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              print(value);
            },
            icon: const Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            color: Theme.of(context).primaryColor,
            itemBuilder: (BuildContext context) {
              return const [
                PopupMenuItem(
                  value: "Started messages",
                  child: Text(
                    "Started messages",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                PopupMenuItem(
                  value: "User information",
                  child: Text(
                    "User information",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                PopupMenuItem(
                  value: "Block Contact",
                  child: Text(
                    "Block Contact",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ];
            },
          ),
        ],
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Expanded(
              child: ListView(),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 55,
                      child: Card(
                        margin: const EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        color: const Color(0xFF1f2c33),
                        child: TextFormField(
                          controller: _controller,
                          focusNode: _focusNode,
                          style: const TextStyle(color: Colors.white),
                          textAlignVertical: TextAlignVertical.center,
                          keyboardType: TextInputType.multiline,
                          maxLines: 5,
                          minLines: 1,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Type a message",
                            hintStyle: const TextStyle(color: Colors.grey),
                            prefixIcon: IconButton(
                              onPressed: toggleEmojiPicker,
                              icon: const Icon(
                                Icons.emoji_emotions_outlined,
                                color: Colors.white,
                              ),
                            ),
                            suffixIcon: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.attach_file_outlined,
                                    color: Colors.white,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.camera_alt_outlined,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            contentPadding: const EdgeInsets.all(10),
                          ),
                        ),
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: Theme.of(context).hintColor,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.mic_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                if (_emojiShowing)
                  SizedBox(
                    height: 250,
                    child: EmojiPicker(
                      onEmojiSelected: (category, emoji) {
                        onEmojiSelected(emoji);
                      },
                      config: Config(
                        height: 256,
                        checkPlatformCompatibility: true,
                        emojiViewConfig: EmojiViewConfig(
                          backgroundColor: Theme.of(context).primaryColor,
                          emojiSizeMax: 28 *
                              (foundation.defaultTargetPlatform ==
                                      TargetPlatform.iOS
                                  ? 1.20
                                  : 1.0),
                        ),
                        swapCategoryAndBottomBar: false,
                        skinToneConfig: const SkinToneConfig(),
                        categoryViewConfig: CategoryViewConfig(
                          backgroundColor: Theme.of(context).primaryColor,
                          iconColorSelected: Theme.of(context).hintColor,
                          indicatorColor: Theme.of(context).hintColor,
                          dividerColor: Theme.of(context).hintColor,
                        ),
                        bottomActionBarConfig: BottomActionBarConfig(
                            backgroundColor: Theme.of(context).primaryColor,
                            buttonColor: Theme.of(context).primaryColor),
                        searchViewConfig: const SearchViewConfig(),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
