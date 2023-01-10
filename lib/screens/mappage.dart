import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'dart:typed_data';
import 'dart:ui';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;


class CustomMarkerWithNetworkImage extends StatefulWidget {
  const CustomMarkerWithNetworkImage({Key? key}) : super(key: key);

  @override
  _CustomMarkerWithNetworkImageState createState() => _CustomMarkerWithNetworkImageState();
}

class _CustomMarkerWithNetworkImageState extends State<CustomMarkerWithNetworkImage> {

  final Completer<GoogleMapController> _controller = Completer();


  List<String> images = [ 'images/car.png' ,'images/car2.png', 'images/marker2.png' ,
    'images/marker3.png', 'images/marker.png' , 'images/motorcycle.png' ,];

  final List<Marker> _markers =  <Marker>[];
  List<LatLng> _latLang =  [
    LatLng(23.7492191, 90.3712123),
    LatLng(23.7464152, 90.3850434) ,
    LatLng(23.7364169, 90.3793201),

  ];

  static const CameraPosition _kGooglePlex =  CameraPosition(
    target: LatLng(23.7492191, 90.3712123),
    zoom: 15,
  );


  Future<Uint8List>  getBytesFromAssets(String path , int width) async
  {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List() , targetHeight:60 );
    ui.FrameInfo fi = await codec.getNextFrame() ;
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }


  loadData ()async{

    for(int i = 0 ; i< images.length ; i++ ){

      Uint8List? image = await  _loadNetworkImage('https://images.bitmoji.com/3d/avatar/201714142-99447061956_1-s5-v1.webp') ;

      final ui.Codec markerImageCodec = await instantiateImageCodec(
        image!.buffer.asUint8List(),
        targetHeight: 200,
        targetWidth: 200,
      );
      final FrameInfo frameInfo = await markerImageCodec.getNextFrame();
      final ByteData? byteData = await frameInfo.image.toByteData(
        format: ImageByteFormat.png,
      );

      final Uint8List resizedMarkerImageBytes = byteData!.buffer.asUint8List();
      _markers.add(
          Marker(markerId: MarkerId(i.toString()) ,
            position: _latLang[i],
           // icon: BitmapDescriptor.fromBytes(resizedMarkerImageBytes),
            anchor: Offset(.1 , .1),
            //icon: BitmapDescriptor.fromBytes(image!.buffer.asUint8List()),
            infoWindow: InfoWindow(
                title: 'eAmbulance '+i.toString()
            ),
          ));
      setState(() {

      });
    }
  }

  Future<Uint8List?> _loadNetworkImage(String path) async {
    final completer = Completer<ImageInfo>();
    var img = NetworkImage(path);
    img.resolve(const ImageConfiguration(size: Size.fromHeight(10) )).addListener(
        ImageStreamListener((info, _) => completer.complete(info)));
    final imageInfo = await completer.future;
    final byteData = await imageInfo.image.toByteData(format: ui.ImageByteFormat.png ,);
    return byteData?.buffer.asUint8List();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GoogleMap(
          initialCameraPosition: _kGooglePlex,
          mapType: MapType.normal,
          myLocationButtonEnabled: true,
          myLocationEnabled: true,
          markers: Set<Marker>.of(_markers),
          onMapCreated: (GoogleMapController controller){
            _controller.complete(controller);
          },
        ),

      ),
    );
  }

}