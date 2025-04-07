import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class InteractiveListWidget extends StatelessWidget {
  const InteractiveListWidget({
    this.isShowWidgetTitle = true,
    this.isShouldNavPop = true,
    super.key,
  });

  final bool isShowWidgetTitle;
  final bool isShouldNavPop;

  @override
  Widget build(BuildContext context) {
    const markerLatLng = LatLng(
      -74.0470753,
      40.6892494,
    );
    const centerPoint = CameraPosition(
      target: markerLatLng,
      zoom: 14.4746,
    );

    return Padding(
      padding: const EdgeInsets.all(20),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemCount: 8,
        itemBuilder: (context, index) {
          return Row(
            children: [
              SizedBox(
                width: 100,
                height: 140,
                child: GoogleMap(
                  key: ValueKey('list-map-$index'),
                  initialCameraPosition: centerPoint,
                  myLocationButtonEnabled: false,
                  compassEnabled: false,
                  zoomControlsEnabled: false,
                  zoomGesturesEnabled: false,
                  buildingsEnabled: false,
                  mapToolbarEnabled: false,
                  rotateGesturesEnabled: false,
                  scrollGesturesEnabled: false,
                  tiltGesturesEnabled: false,
                ),
              ),
              const SizedBox(width: 10),
              const Expanded(
                child: Text(
                  '#index Lorem ipsum dolor sit amet, '
                  'consectetur adipiscing elit. '
                  'Morbi sed nisl a ligula gravida '
                  'tincidunt at a dolor. '
                  'Nullam pellentesque dui vel dui tincidunt aliquam. '
                  'Sed rutrum malesuada nisi, vel laoreet nibh ornare ut.',
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
