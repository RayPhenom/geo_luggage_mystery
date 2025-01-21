import 'package:flutter/material.dart';
import 'package:geo_luggage_mystery/pages/menu/widgets/adverts.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          DecoratedBox(
            decoration: const BoxDecoration(color: Colors.red),
            child: Column(
              children: [
                Image.asset("assets/images/logo.png", fit: BoxFit.contain),
                Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.directions_bus,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 30),
                        Text(
                          "One way",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(
                      Icons.bus_alert,
                      size: 30,
                    ),
                    title: Text(
                      "Leaving from",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    trailing: const Icon(Icons.chevron_right),
                    subtitle: const Text("Where you are traveling from"),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.business,
                      size: 30,
                    ),
                    title: Text(
                      "Going to",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    trailing: const Icon(Icons.chevron_right),
                    subtitle: const Text("Where you are traveling to"),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.calendar_month,
                      size: 30,
                    ),
                    title: Text(
                      "Travel date",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    trailing: const Icon(Icons.chevron_right),
                    subtitle: const Text("Date you will be traveling"),
                  ),
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {}, child: const Text("Search buses"))),
                  const SizedBox(width: 500, child: Adverts())
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}