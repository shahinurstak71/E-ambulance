// import 'dart:async';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
//
// //
// //
// // class Home extends StatefulWidget {
// //   const Home({Key? key}) : super(key: key);
// //
// //   @override
// //   State<Home> createState() => _HomeState();
// // }
// //
// // class _HomeState extends State<Home> {
// //   String? message;
// //   final Completer<GoogleMapController> _controller = Completer();
// //   GoogleMapController? googleMapController;
// //
// //   Future<void> getCurrentLocation() async {
// //     LocationPermission permission = await Geolocator.requestPermission();
// //     var position = await Geolocator.getCurrentPosition(
// //         desiredAccuracy: LocationAccuracy.high);
// //     var lat = position.latitude;
// //     var long = position.longitude;
// //     CameraPosition _kLake = CameraPosition(
// //         bearing: 192.8334901395799,
// //         target: LatLng(position.latitude, position.longitude),
// //         tilt: 59.440717697143555,
// //         zoom: 19.151926040649414);
// //     final GoogleMapController controller = await _controller.future;
// //     controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
// //     print("lat: $lat & long $long");
// //     setState(() {
// //       message = "lat: $lat & long $long";
// //     });
// //   }
// //
// //   static const CameraPosition _kGooglePlex = CameraPosition(
// //     target: LatLng(37.42796133580664, -122.085749655962),
// //     zoom: 14.4746,
// //   );
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //         appBar: AppBar(
// //           title: Text("google map"),
// //         ),
// //         body: SingleChildScrollView(
// //           child: Column(
// //             children: [
// //               TextButton(onPressed: getCurrentLocation, child: Text("dafa")),
// //               GoogleMap(
// //                 mapType: MapType.hybrid,
// //                 myLocationButtonEnabled: true,
// //                 initialCameraPosition: _kGooglePlex,
// //                 zoomGesturesEnabled: true,
// //                 zoomControlsEnabled: true,
// //                 myLocationEnabled: true,
// //                 onMapCreated: (GoogleMapController controller) {
// //                   _controller.complete(controller);
// //                   googleMapController = controller;
// //                   getCurrentLocation();
// //                 },
// //               ),
// //             ],
// //           ),
// //         ));
// //   }
// // }
//
// class MapSample extends StatefulWidget {
//   @override
//   State<MapSample> createState() => MapSampleState();
// }
//
// class MapSampleState extends State<MapSample> {
//   final Completer<GoogleMapController> _controller = Completer();
//   Set<Marker> marker = {};
//   final CameraPosition _kGooglePlex = const CameraPosition(
//     target: LatLng(37.42796133580664, -122.085749655962),
//     zoom: 14.4746,
//   );
//
//   // final CameraPosition _kLake = const CameraPosition(
//   //     bearing: 192.8334901395799,
//   //     target: LatLng(37.43296265331129, -122.08832357078792),
//   //     tilt: 59.440717697143555,
//   //
//   //     zoom: 19.151926040649414);
//
//   dynamic  ? latww;
//   dynamic ? longwww;
//   Future<void> _goToTheLake() async {
//
//    await FirebaseFirestore.instance.collection("driver").get().then((value) {
//       value.docs.forEach((element) {
//         latww = double.parse(element.data()['lon']);
//         longwww = double.parse(element.data()['lat']);
//         print("ELEMENT__${element.data()['lon']}");
//       });
//     });
//     LocationPermission permission = await Geolocator.requestPermission();
//     var position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high);
//     var lat = position.latitude;
//     var long = position.longitude;
//     setState(() {
//       marker.add(Marker(
//         markerId: const MarkerId("id-1"),
//         position: LatLng(position.latitude, position.longitude),
//       ));
//       marker.add(Marker(
//         markerId:  MarkerId(longwww.toString()),
//         position: LatLng(longwww, latww!),
//       ));
//     });
//     CameraPosition _kLake = CameraPosition(
//         bearing: 192.8334901395799,
//         target: LatLng(position.latitude, position.longitude),
//         tilt: 59.440717697143555,
//         zoom: 19.151926040649414);
//     final GoogleMapController controller = await _controller.future;
//     controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
//     print("lat: $lat & long $long");
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: GoogleMap(
//           mapType: MapType.normal,
//           markers: marker,
//           initialCameraPosition: _kGooglePlex,
//           myLocationEnabled: true,
//           myLocationButtonEnabled: true,
//           onMapCreated: (GoogleMapController controller) {
//             _controller.complete(controller);
//             setState(() {});
//             _goToTheLake();
//           },
//         ),
//       ),
//     );
//   }
// }

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
    LatLng(23.419413, 91.13646),
    LatLng(23.4194179, 91.1342713),



  ];

  static const CameraPosition _kGooglePlex =  CameraPosition(
    target: LatLng(33.6941, 72.9734),
    zoom: 12,
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

      Uint8List? image = await  _loadNetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSeDZrnaCcvDrL3u4RE4sutHggwrBQQDzk30L8rtIRsoFdTHoeZc7smyiaT2xvWR6pIeWA&usqp=CAU') ;

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
            icon: BitmapDescriptor.fromBytes(resizedMarkerImageBytes),
            anchor: Offset(.1 , .1),
            //icon: BitmapDescriptor.fromBytes(image!.buffer.asUint8List()),
            infoWindow: InfoWindow(
                title: 'This is title marker: '+i.toString()
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