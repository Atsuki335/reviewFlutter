import 'package:chapter4/space_x_requests.dart';
import 'package:flutter/material.dart';

import '../Model/ship.dart';

class ShipInfoPage extends StatefulWidget {
  const ShipInfoPage({super.key});

  @override
  State<ShipInfoPage> createState() => _ShipInfoPageState();
}

class _ShipInfoPageState extends State<ShipInfoPage> {
  Ship? ship;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final image = ship?.image;
    return Scaffold(
        appBar: AppBar(title: const Text("InfoPage")),
        body: Column(
          children: [
            if (image != null) Image.network(image),
            TextButton(
                onPressed: () async {
                  final ship = await SpaceXRequests().fetchShip(id: "GOMSTREE");
                  setState(() {
                    this.ship = ship;
                  });
                },
                child: const Text("リクエスト"))
          ],
        ));
  }
}
