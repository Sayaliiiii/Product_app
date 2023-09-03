
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:product_app/data/models/product_model.dart';
import 'package:product_app/presentation/ui/screens/product_data.dart';

class ProductDetail extends StatefulWidget {
  ProductDetail({super.key, required this.productDataModel});
  ProductDataModel productDataModel;

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  AssetsAudioPlayer player = AssetsAudioPlayer();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    player.open(Audio("assets/audio/song.mp3"),
        autoStart: false, showNotification: true);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      top: true,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.black,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .5,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ProductDataPAge(),
                                      ));
                                },
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                )),
                            TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ProductDataPAge(),
                                      ));
                                },
                                child: Text(
                                  'Go Back',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 19),
                                ))
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Product name :  ${widget.productDataModel.name}',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Our tagline :  ${widget.productDataModel.tagline}',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ]),
                  Positioned(
                    bottom: -100,
                    left: MediaQuery.of(context).size.width * 0.25,
                    child: Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width * .5,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.network(
                          widget.productDataModel.imageUrl,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(
                    'Description',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(widget.productDataModel.description),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'First Brewed',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(widget.productDataModel.firstBrewed),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Audio Player",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black),
                      onPressed: () async {
                        player.play();
                      },
                      icon: Icon(Icons.pause),
                      label: Text("Play")),
                  ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black),
                      onPressed: () async {
                        player.pause();
                      },
                      icon: Icon(Icons.play_arrow),
                      label: Text("pause")),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
