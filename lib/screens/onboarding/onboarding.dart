import "package:flutter/material.dart";
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //Scrollale pg
          PageView(
            children:[
              Column(
                children: [
                  //image
                  //text
                ],
              ),
            ]
            )
          //skip

          //dot nav

          //circ

        ],
      )
    );
}

}
