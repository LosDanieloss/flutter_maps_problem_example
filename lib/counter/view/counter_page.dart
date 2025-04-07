import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_problem_example/counter/counter.dart';
import 'package:maps_problem_example/counter/view/widget/test_list_item_widget.dart';
import 'package:maps_problem_example/l10n/l10n.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart' as custom;

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: const CounterView(),
    );
  }
}

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    const markerLatLng = LatLng(
      -74.0470753,
      40.6892494,
    );
    const centerPoint = CameraPosition(
      target: markerLatLng,
      zoom: 14.4746,
    );

    return Scaffold(
      appBar: AppBar(title: Text(l10n.counterAppBarTitle)),
      backgroundColor: Colors.lightBlueAccent,
      body: const Column(
        children: [
          Row(),
          SizedBox(
            width: 400,
            height: 350,
            child: GoogleMap(
              key: ValueKey('large-map'),
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
          Padding(
            padding: EdgeInsets.all(32),
            child: Text(
              '#index Lorem ipsum dolor sit amet, '
              'consectetur adipiscing elit. '
              'Morbi sed nisl a ligula gravida '
              'tincidunt at a dolor. '
              'Nullam pellentesque dui vel dui tincidunt aliquam. '
              'Sed rutrum malesuada nisi, vel laoreet nibh ornare ut.',
            ),
          ),
          SizedBox(
            width: 100,
            height: 140,
            child: GoogleMap(
              key: ValueKey('small-map'),
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
          Spacer(),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              custom.showMaterialModalBottomSheet<void>(
                context: context,
                useRootNavigator: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(32),
                  ),
                ),
                backgroundColor: Colors.greenAccent,
                builder: (context) => const SizedBox(
                  width: 500,
                  height: 800,
                  child: InteractiveListWidget(),
                ),
              );
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}

class CounterText extends StatelessWidget {
  const CounterText({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final count = context.select((CounterCubit cubit) => cubit.state);
    return Text('$count', style: theme.textTheme.displayLarge);
  }
}
