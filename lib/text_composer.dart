import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class TextComposer extends StatefulWidget {
  const TextComposer({Key? key, required this.sendMessage}) : super(key: key);


  final Function({String text, File imgFile}) sendMessage;

  @override
  State<TextComposer> createState() => _TextComposerState();
}

class _TextComposerState extends State<TextComposer> {

  bool _isComposing = false;
  final TextEditingController _controller = TextEditingController();
  final ImagePicker _picker = ImagePicker();


  void _reset(){
    _controller.clear();
    setState(() {
      _isComposing = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          IconButton(
            onPressed: () async {
              final XFile? imgFile = await _picker.pickImage(source: ImageSource.camera);
              if(imgFile == null)return;
              widget.sendMessage(imgFile: File(imgFile.path));

            },
            icon: Icon(Icons.photo_camera),
          ),
          Expanded(
            child: TextField(
              controller: _controller,
              decoration:
                  InputDecoration.collapsed(hintText: 'Enviar uma mensagem'),
              onChanged: (text) {
                setState(() {
                  _isComposing = text.isNotEmpty;
                });
              },
              onSubmitted: (text) {
                widget.sendMessage(text: text);
                _reset();
              },
            ),
          ),
          IconButton(
            onPressed: _isComposing ? (){
              widget.sendMessage(text: _controller.text);
                _reset();
              } : null,
            icon: Icon(Icons.send),
          ),
        ],
      ),
    );
  }
}
