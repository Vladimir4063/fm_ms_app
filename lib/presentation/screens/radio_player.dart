import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:audioplayers/audioplayers.dart';

const String wspUrl = "2267410216";
const String facebookUrl = "https://m.facebook.com/FmMonteSanto/";
const String websiteUrl = "https://www.google.com/";
UrlSource radioUrl = UrlSource('https://uk2freenew.listen2myradio.com/live.mp3?typeportmount=ice_30876_stream_632117567');

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
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [0.1, 0.6, 0.9],
              colors: [
                Colors.black,
                Color.fromARGB(179, 29, 26, 26),
                Color.fromARGB(255, 56, 56, 56)
              ]
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
                child: Image.network(
                  "https://scontent.faep16-2.fna.fbcdn.net/v/t39.30808-6/241676832_237178688220147_8217776067505630344_n.png?_nc_cat=111&ccb=1-7&_nc_sid=6ee11a&_nc_eui2=AeFvwuGI1W-ke64Fsi4lQyjbJNJcVMu28g8k0lxUy7byD80Id09fSVeJlyjVm8PdmAN4nU_JFLfDIHHAxvdl63AJ&_nc_ohc=YtHy83QgdasQ7kNvgG4g4K2&_nc_oc=AdhAdeCk6GCedoirGtXtIcQeQ5AmQlqa_iRjiIXuzx07r2xIwhjh9lqBAP4Q7wRYlko&_nc_zt=23&_nc_ht=scontent.faep16-2.fna&_nc_gid=AdGddGIYrWwk3u08GGJ1umR&oh=00_AYFwpL95P-y1h6dgRLLopok_sKm-a_7OaaaggWc3TTADGg&oe=67D92A0D",
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Image.network(
            //     "https://scontent.faep16-2.fna.fbcdn.net/v/t39.30808-6/241676832_237178688220147_8217776067505630344_n.png?_nc_cat=111&ccb=1-7&_nc_sid=6ee11a&_nc_eui2=AeFvwuGI1W-ke64Fsi4lQyjbJNJcVMu28g8k0lxUy7byD80Id09fSVeJlyjVm8PdmAN4nU_JFLfDIHHAxvdl63AJ&_nc_ohc=YtHy83QgdasQ7kNvgG4g4K2&_nc_oc=AdhAdeCk6GCedoirGtXtIcQeQ5AmQlqa_iRjiIXuzx07r2xIwhjh9lqBAP4Q7wRYlko&_nc_zt=23&_nc_ht=scontent.faep16-2.fna&_nc_gid=AdGddGIYrWwk3u08GGJ1umR&oh=00_AYFwpL95P-y1h6dgRLLopok_sKm-a_7OaaaggWc3TTADGg&oe=67D92A0D",
            //     height: 250,
            // ),
            // Text("Nombre canción"),
            // Text("Autor"),
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
                shadowColor: Colors.red,
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
