import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import '../list_module/list_module.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bordered_text/bordered_text.dart';

class My_App_Screen extends StatefulWidget {
  const My_App_Screen({Key? key}) : super(key: key);

  @override
  State<My_App_Screen> createState() => _My_App_ScreenState();
}

class _My_App_ScreenState extends State<My_App_Screen> {
  var item = [
    Item(
        name: "Forest",
        audioPath: "assets/meditation_audio/forest.mp3",
        imagePath: "assets/meditation_images/forest.jpeg"),
    Item(
        name: "Night",
        audioPath: "assets/meditation_audio/night.mp3",
        imagePath: "assets/meditation_images/night.jpeg"),
    Item(
        name: "Ocean",
        audioPath: "assets/meditation_audio/ocean.mp3",
        imagePath: "assets/meditation_images/ocean.jpeg"),
    Item(
        name: "Waterfall",
        audioPath: "assets/meditation_audio/waterfall.mp3",
        imagePath: "assets/meditation_images/waterfall.jpeg"),
    Item(
        name: "Wind",
        audioPath: "assets/meditation_audio/wind.mp3",
        imagePath: "assets/meditation_images/wind.jpeg"),
    Item(
        name: "Hanuman",
        audioPath: "assets/meditation_audio/Aasman.mp3",
        imagePath: "assets/meditation_images/hanuman.webp"),
    Item(
        name: "Kishor Kumar",
        audioPath: "assets/meditation_audio/baat.mp3",
        imagePath: "assets/meditation_images/bat.jpg"),
    Item(
        name: "Perfect X Until I Found You",
        audioPath: "assets/meditation_audio/ix.mp3",
        imagePath: "assets/meditation_images/unti.jpg"),
  ];

  final AudioPlayer audioPlayer = AudioPlayer();
  int? _playIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meditate"),
      ),
      body: SafeArea(
          child: Container(
        child: ListView.builder(
          itemCount: item.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(item[index].imagePath))),
                child: ListTile(
                  leading: IconButton(
                    onPressed: () {
                      //to stop music while playing
                      if (_playIndex == index) {
                        setState(() {
                          _playIndex = null;
                        });

                        audioPlayer.stop();
                      } else
                      //to play the music and set Index
                      {
                        audioPlayer.setAsset(item[index].audioPath);
                        audioPlayer.play();
                        setState(() {
                          _playIndex = index;
                        });
                      }
                    },
                    icon: _playIndex == index
                        ? FaIcon(Icons.stop_circle_outlined,size: 30,)
                        : FaIcon(Icons.play_circle_fill_outlined,size: 30,),
                    //  ternary operator
                  ),
                  title: BorderedText(
                    strokeWidth: 4,
                    strokeColor: Colors.black,
                    child: Text(
                      item[index].name,
                      style:GoogleFonts.ubuntu(
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      )),
    );
  }
}
