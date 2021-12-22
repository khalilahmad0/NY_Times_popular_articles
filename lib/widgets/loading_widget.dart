import 'package:flutter/material.dart';

import 'package:ny_times_popular_articles/utils/constants.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const <Widget>[
        CircularProgressIndicator(),
        SizedBox(height: 8,),
        Text(
          Constants.loadingMsg,
          style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
        ),
      ],
    ),
  );
}