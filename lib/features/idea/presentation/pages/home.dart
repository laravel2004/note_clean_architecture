import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20.0,
            ),
            const Image(
              image: AssetImage("assets/images/logo.png"),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Row(
              children: [
                Text(
                  "Hello, ",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Text(
                  "peeps!",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),
            const Row(
              children: [
                Text(
                  "Ide apa ",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "hari ini?",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w300,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 50.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.grey.shade300,
                  ),
                  height: 150.0,
                  width: 150.0,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "/idea");
                    },
                    child: const  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.add),
                        Text("Add Idea")
                      ]
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.grey.shade300,
                  ),
                  height: 150.0,
                  width: 150.0,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "/lean_canvas");
                    },
                    child: const  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.search),
                        Text("Lean Canvas")
                      ]
                    ),
                  ),
                )
              ]
            )
          ],
        ),
      ),
    );
  }
}
