// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:purplepay_task/buttons.dart';
import 'package:purplepay_task/notifications.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'my_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //page indicator

  final _controller = PageController();
  @override
  void initState() {
    super.initState();
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: const Text('Allow Notifications'),
                  content: const Text(
                      'Please allow our app to send you Notifications'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Deny',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    TextButton(
                        onPressed: () => AwesomeNotifications()
                            .requestPermissionToSendNotifications()
                            .then((_) => Navigator.pop(context)),
                        child: const Text(
                          'Allow',
                          style: TextStyle(
                              color: Colors.teal,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: SafeArea(
        child: Column(
          children: [
            //app bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'My',
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        ' Cards',
                        style: TextStyle(fontSize: 26),
                      ),
                    ],
                  ),

                  //plus button to add more cards

                  Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.deepPurple[300],
                          shape: BoxShape.circle),
                      child: Icon(Icons.add)),
                ],
              ),
            ),

            SizedBox(height: 25),

            //cards
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Container(
                height: 200,
                child: PageView(
                    scrollDirection: Axis.horizontal,
                    controller: _controller,
                    children: [
                      MyCard(
                        balance: 3428.50,
                        cardNumber: 8293,
                        expiryMonth: 03,
                        expiryYear: 24,
                        color: Colors.deepOrange[400],
                      ),
                      MyCard(
                        balance: 2482.60,
                        cardNumber: 4502,
                        expiryMonth: 12,
                        expiryYear: 26,
                        color: Colors.deepPurple[300],
                      ),
                    ]),
              ),
            ),

            SizedBox(height: 15),

            SmoothPageIndicator(
              controller: _controller,
              count: 2,
              effect: ExpandingDotsEffect(
                activeDotColor: Colors.grey.shade800,
              ),
            ),

            SizedBox(height: 15),

          //3 buttons for send+history+qrcode
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //send button
                  MyButton(
                    iconImagePath: 'lib/Icons/wallet.png', 
                    buttonText: 'Send',
                  ),
            
                  // History button
            
                  MyButton(
                    iconImagePath: 'lib/Icons/budget.png', 
                    buttonText: 'History',
                  ),
            
                  //scan qr button
                  MyButton(
                    iconImagePath: 'lib/Icons/qrcode.png', 
                    buttonText: 'Scan QR',
                  ),
                
                ],
              ),
            ),

            // Swiping bar
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SlideAction(
                borderRadius: 12,
                elevation: 0,
                innerColor: Colors.deepPurple,
                outerColor: Colors.deepPurple[300],
                sliderButtonIcon: const Icon(
                  Icons.payment_rounded,
                  color: Colors.white,
                ),
                text: 'Slide to Pay',
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
                onSubmit: createPaymentNotification,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
