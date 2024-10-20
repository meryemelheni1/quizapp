import 'package:flutter/material.dart'; 
import 'package:quiz_app/accueil.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});
  
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: const Color.fromARGB(255, 237, 120, 159),  
      appBar: AppBar(
        title: const Text('About'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); 
          },
        ),
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            
              Image.asset(
                'assets/img/quiz1.jpg', 
                height: 100,
                width: 100,
              ),
              const SizedBox(
                  height: 20),

             
              const Text(
                'Application Flutter Quiz',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
} 
