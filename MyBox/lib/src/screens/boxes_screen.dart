import 'package:caso_de_estudo/src/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class BoxesScreen extends StatefulWidget {
  const BoxesScreen({super.key});

  @override
  State<BoxesScreen> createState() => _BoxesScreenState();
}

class _BoxesScreenState extends State<BoxesScreen> {
  final locationController = Location();
  LatLng? currentPosition;

  Map<PolylineId, Polyline> polylines = {};
  late GoogleMapController mapController;
  late BitmapDescriptor customIcon;

  final LatLng senaiLoc = LatLng(-23.54263348401848, -46.62150837414512);
  final LatLng senaiELoc = LatLng(-23.562632576449964, -46.623910004176366);

  @override
  void initState() {
    setCustomMarker();
    super.initState();
    initializeMap();
  }

  Future<void> initializeMap() async {
    final coordinates = await fetchPolylinePoints();
    generatePolyLineFromPoints(coordinates);
  }

  void setCustomMarker() async {
    customIcon = await BitmapDescriptor.asset(
      const ImageConfiguration(size: Size(28, 28)),
      'assets/images/box_map_icon.png',
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf5f5f5),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFFf5f5f5),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(FontAwesomeIcons.angleLeft),
            ),
            Text(
              '1328XXHUFSI23',
              style: GoogleFonts.kanit(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Container(
                width: 400,
                height: 400,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Container(
                        width: 320,
                        height: 200,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                        child: GoogleMap(
                          initialCameraPosition: CameraPosition(
                            target: senaiLoc,
                            zoom: 13,
                          ),
                          markers: {
                            Marker(
                              markerId: MarkerId('sourceLocation'),
                              icon: customIcon,
                              position: senaiLoc,
                            ),
                            Marker(
                              markerId: MarkerId('destinLocation'),
                              icon: customIcon,
                              position: senaiELoc,
                            ),
                          },
                          zoomControlsEnabled: true,
                          zoomGesturesEnabled: false,
                          scrollGesturesEnabled: true,
                          polylines: Set<Polyline>.of(polylines.values),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Código da Encomenda',
                              style: GoogleFonts.kanit(
                                color: Colors.grey,
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              '1328XXHUFSI23',
                              style: GoogleFonts.kanit(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'Previsão de Entrega',
                              style: GoogleFonts.kanit(
                                color: Colors.grey,
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              '14/12/2024',
                              style: GoogleFonts.kanit(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Destinatário',
                              style: GoogleFonts.kanit(
                                color: Colors.grey,
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              'Gustavo Barbosa',
                              style: GoogleFonts.kanit(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'Remetente',
                              style: GoogleFonts.kanit(
                                color: Colors.grey,
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              'YIPENG LI:&',
                              style: GoogleFonts.kanit(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.grey,
                      thickness: 1,
                      indent: 20,
                      endIndent: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/images/logo.png'),
                        ),
                        Column(
                          children: [
                            Text(
                              'Suporte Técnico',
                              style: GoogleFonts.kanit(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Teve algum problema?\nEntre em contato com o nosso suporte',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.kanit(
                                color: Colors.grey,
                                fontSize: 8,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                            child: Icon(
                              FontAwesomeIcons.headset,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Container(
                width: 400,
                height: 370,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Status da Encomenda',
                            style: GoogleFonts.kanit(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Column(
                        children: [
                          Container(
                            width: 350,
                            height: 80,
                            decoration: BoxDecoration(
                              color: Color(0xffdadada),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Saiu do país de origem.',
                                        style: GoogleFonts.kanit(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        '08/11/2024 às 06:13',
                                        style: GoogleFonts.kanit(
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        FontAwesomeIcons.plane,
                                        size: 20,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 3,
                        height: 30,
                        decoration: BoxDecoration(color: Color(0xffdadada)),
                      ),
                      Column(
                        children: [
                          Container(
                            width: 350,
                            height: 80,
                            decoration: BoxDecoration(
                              color: Color(0xffdadada),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Pedido em separação.',
                                        style: GoogleFonts.kanit(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        '07/11/2024 às 20:13',
                                        style: GoogleFonts.kanit(
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        FontAwesomeIcons.boxesStacked,
                                        size: 20,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 3,
                        height: 30,
                        decoration: BoxDecoration(color: Color(0xffdadada)),
                      ),
                      Column(
                        children: [
                          Container(
                            width: 350,
                            height: 80,
                            decoration: BoxDecoration(
                              color: Color(0xffdadada),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Pedido recebido.',
                                        style: GoogleFonts.kanit(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        '06/11/2024 às 14:13',
                                        style: GoogleFonts.kanit(
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        FontAwesomeIcons.envelopeCircleCheck,
                                        size: 20,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Divider(
              color: Colors.grey,
              thickness: 2,
              indent: 35,
              endIndent: 35,
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'MyBox por aí...',
                  style: GoogleFonts.kanit(
                      fontWeight: FontWeight.w500, color: Colors.grey),
                ),
                SizedBox(width: 10),
                Icon(
                  FontAwesomeIcons.personRunning,
                  color: Colors.grey,
                  size: 15,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(
                    FontAwesomeIcons.facebook,
                    color: Color(0xFF8A8A8A),
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    FontAwesomeIcons.instagram,
                    color: Color(0xFF8A8A8A),
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    FontAwesomeIcons.xTwitter,
                    color: Color(0xFF8A8A8A),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<List<LatLng>> fetchPolylinePoints() async {
    final polylinePoints = PolylinePoints();

    final result = await polylinePoints.getRouteBetweenCoordinates(
        googleApiKey: googleMapsApiKey,
        request: PolylineRequest(
            origin: PointLatLng(senaiLoc.latitude, senaiLoc.latitude),
            destination: PointLatLng(senaiELoc.latitude, senaiELoc.longitude),
            mode: TravelMode.walking));

    if (result.points.isNotEmpty) {
      return result.points
          .map((point) => LatLng(point.latitude, point.longitude))
          .toList();
    } else {
      debugPrint(result.errorMessage);
      return [];
    }
  }

  Future<void> generatePolyLineFromPoints(
      List<LatLng> polylineCoordinates) async {
    const id = PolylineId('polyline');

    final polyline = Polyline(
      polylineId: id,
      color: Colors.black,
      points: polylineCoordinates,
      width: 5,
    );

    setState(() => polylines[id] = polyline);
  }
}
