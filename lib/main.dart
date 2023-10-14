import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:stepper/slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentStepIndex = 0;
  continueStep() {
    if (currentStepIndex < 3) {
      setState(() {
        // currentStepIndex += 1;
        currentStepIndex = currentStepIndex + 1;
      });
    }
  }

  cancelStep() {
    if (currentStepIndex > 0) {
      setState(() {
        currentStepIndex = currentStepIndex - 1;
      });
    }
  }

  onstepTapped(int value) {
    setState(() {
      currentStepIndex = value;
    });
  }

  TextEditingController Name = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController Address = TextEditingController();
  TextEditingController PhoneNmber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stepper(
              type: StepperType.vertical,
              currentStep: currentStepIndex,
              onStepContinue: continueStep,
              onStepCancel: cancelStep,
              onStepTapped: onstepTapped,
              steps: [
                Step(
                  title: Text("Order Placed"),
                  content: Container(
                    child: Column(
                      children: [
                        SizedBox(height: 8),
                        TextField(
                          controller: Name,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Full Name',
                          ),
                        ),
                        SizedBox(height: 8),
                        TextField(
                          controller: Email,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email',
                          ),
                        ),
                        SizedBox(height: 8),
                        TextField(
                          controller: Address,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Address',
                          ),
                        ),
                        SizedBox(height: 8),
                        TextField(
                          controller: PhoneNmber,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Phone Number',
                          ),
                        )
                      ],
                    ),
                  ),
                  isActive: currentStepIndex >= 0,
                  state: currentStepIndex >= 0
                      ? StepState.complete
                      : StepState.disabled,
                ),
                Step(
                  title: Text("Preparing"),
                  content: Container(
                    child: Column(
                      children: [
                        LottieBuilder.network(
                            'https://lottie.host/a2db54b1-c55e-4ded-9dc8-134bfe9c207f/WIEMlOPmCS.json'),
                        Text("Your order is being prepared"),
                      ],
                    ),
                  ),
                  isActive: currentStepIndex >= 1,
                  state: currentStepIndex >= 1
                      ? StepState.complete
                      : StepState.disabled,
                ),
                Step(
                  title: Text("On The Way"),
                  content: Container(
                    height: 500,
                    width: 500,
                    child: Column(
                      children: [
                        LottieBuilder.network(
                            'https://lottie.host/4a473bad-7de0-4737-b4ac-424c2131d81d/EzYyj1nkqz.json'),
                        Text(
                            "Our delivery executive is on the way to deliver your item"),
                      ],
                    ),
                  ),
                  isActive: currentStepIndex >= 2,
                  state: currentStepIndex >= 2
                      ? StepState.complete
                      : StepState.disabled,
                ),
                Step(
                  title: Text("Delivered"),
                  content: Container(
                    height: 300,
                    width: 300,
                    child: Column(
                      children: [
                        LottieBuilder.network(
                            'https://lottie.host/a8cbdecc-b138-45cc-a6ee-a7cbb49fc6e1/cKy4XMiI3a.json'),
                        Text("Your order was delivered successfully"),
                        Text('Name: ${Name.text}'),
                        Text('Email: ${Email.text}'),
                        Text('Address : ${Address.text}'),
                        Text('Phone Nmber : ${PhoneNmber.text}'),
                      ],
                    ),
                  ),
                  isActive: currentStepIndex >= 3,
                  state: currentStepIndex >= 2
                      ? StepState.complete
                      : StepState.disabled,
                ),
              ],
            ),
            ElevatedButton(
                  onPressed:() {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MySlider()));
                  },
                child: Text("Go To Slidebar"))
          ],
        ),
      ),
    );
  }
}
