import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _Home(),
    );
  }
}

class _Home extends StatelessWidget {
  final PolylinePoints polylinePoints = PolylinePoints();
  final Set<Polyline> polylines = {};

  @override
  Widget build(BuildContext context) {
    final PolylineId id = PolylineId("poly");
    polylines.add(Polyline(
        width: 3,
        color: Colors.red,
        polylineId: id,
        points: _convertToLatLng(polylinePoints.decodePolyline(
            "kkr_IqqxpA@WO[BUSMCOD?FOKo@AmAEIUB[JIJECG?q@RCAM[AWDoBJcAFgAJUAk@F{Aj@eJFeBXwDFkAASAIQQUKSCGICOEgAEIQKQJa@Ie@e@u@a@UUM[QUc@WUSS]c@_@{@uA_@i@c@e@g@gAMMmA[}@EYOYCeA]o@Ea@IO@MC_@QWC]H[T]X[^a@V_@@]COGIGOCMM]IMBEFO@g@AEYIDGJQF}AVi@FEO_@CMHOBm@FYLYC_AJwAE[Bw@LsB@MCEMKIMAm@Nk@?mAFIDON?RI\EXCHE@eCOGDU`AG~@?t@KnAAj@QzBGnBMnCBRFXb@~Cf@`FTzAF|@ZdBd@vDZhAVnAL|@X|AZvANb@R`B@THb@f@v@ZjA^nCH~@Jd@R~AR|@Hp@RhALfA\pB^vAX~Bj@zBt@rDNbARj@T^BVHVNTNl@DFTNNVTX`@vAV\f@lAVEH@RJLPNd@Lt@Pd@Ln@JRD?HIx@yBr@wAX}@rB}Eb@sALOD?HDHCV_@JU^wAFITs@r@qAh@qARs@HMFEf@SV[XSLSNIPEtAs@h@KnAm@h@QbBaAjBy@XOPE`@Q\B~@AFIH[?_@KsAKkC?[Es@CsA@U\MXA|@c@V?PCLBPAHGPc@B_@Ky@D_@O_AM[CQKKSEII"))));
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: kIsWeb ? 500 : MediaQuery.of(context).size.width,
        height: kIsWeb ? 500 : MediaQuery.of(context).size.width,
        child: GoogleMap(
            gestureRecognizers: Set()
              ..add(
                  Factory<PanGestureRecognizer>(() => PanGestureRecognizer())),
            initialCameraPosition:
                CameraPosition(target: polylines.first.points[0], zoom: 15.0),
            mapType: MapType.terrain,
            polylines: polylines,
            compassEnabled: false,
            tiltGesturesEnabled: false),
      ),
    );
  }

  List<LatLng> _convertToLatLng(List<PointLatLng> points) {
    List<LatLng> result = <LatLng>[];
    for (int i = 0; i < points.length; i++)
      result.add(LatLng(points[i].latitude, points[i].longitude));
    return result;
  }
}
