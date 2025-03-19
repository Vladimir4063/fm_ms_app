import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:audioplayers/audioplayers.dart';

const String wspUrl = "2267410216";
const String facebookUrl = "https://m.facebook.com/FmMonteSanto/";
const String websiteUrl = "https://www.google.com/";
UrlSource radioUrl = UrlSource('https://uk2freenew.listen2myradio.com/live.mp3?typeportmount=ice_30876_stream');

class RadioPlayer extends StatefulWidget {
  RadioPlayer({super.key});

  @override
  _RadioPlayerState createState() => _RadioPlayerState();
}

class _RadioPlayerState extends State<RadioPlayer> {
  bool isPlaying = false;
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    if (isPlaying) {
      _audioPlayer.pause();
    } else {
      _audioPlayer.play(radioUrl);
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text('FM Monte Santo'),
        //   centerTitle: true,
        // ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/fondo.jpg"),
            fit: BoxFit.cover,
            )
          ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            // IMAGE 
            Container(
              decoration: BoxDecoration(
                // color: Colors.grey[900],
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Colors.white.withValues(alpha: 0.2),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: Offset(2, 2)
                      )
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset("assets/images/logo.png", height: 230, fit: BoxFit.cover,),
              ),
            ),
            // Text("Nombre canción"),
            Text("AIRE QUE RENUEVA TU MENTE", 
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(FontAwesomeIcons.whatsapp, size: 29,),
                  onPressed: ()=> openUrl("https://wa.me/$wspUrl"),
                ),
                SizedBox(width: 30),
                IconButton(
                  icon: Icon(Icons.facebook, size: 32,),
                  onPressed: ()=> openUrl(facebookUrl),
                ),
                // SizedBox(width: 30),
                // IconButton(
                //   icon: Icon(Icons.language_rounded, size: 32,),
                //   onPressed: ()=> openUrl(websiteUrl),
                // ),
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(24),
                iconColor: Colors.white,
                shadowColor: Colors.blueGrey,
                // backgroundColor: Colors.red
              ),
              onPressed: _togglePlayPause,
              child: Icon(
                isPlaying ? Icons.pause : Icons.play_arrow,
                size: 50,
              ),
            ),
            // SizedBox(
            //   height: 0,
            // )
          ],
        ),
      )
    );
  }
}

//Función para los botones de redes sociales
Future<void> openUrl(String url) async {
  final Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } else {
    throw 'No se pudo lanzar $url';
  }
}
