import 'package:flutter/material.dart';

class calculateWeight extends StatelessWidget {
  double berat;

  calculateWeight(this.berat);

  double get incrementWeight {
    return berat += 0.5;
  }

  double get decrementtotalWeight {
    return berat += 0.5;
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
