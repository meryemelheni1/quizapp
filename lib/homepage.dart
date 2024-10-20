import 'package:flutter/material.dart';
import 'package:quiz_app/accueil.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _score = 0;
  int _currentQuestionIndex = 0;

  
  final List<Map<String, dynamic>> _quizQuestions = [
    {
      'question': 'Quel est le plus grand organe du corps humain ?',
      'options': ['A. Le foie', 'B. La peau', 'C. Le cœur', 'D. Les poumons'],
      'correctIndex': 1, 
    }, 
    {
      'question': ' Quel fruit est le plus riche en vitamine C ?',
      'options': ['A. La pomme', 'B. orange', 'C. La banane ', 'D. Le raisin'],
      'correctIndex': 1, 
    }, 
    {
      'question': 'Quel minéral est important pour la santé des os ?',
      'options': ['A. Le fer', 'B. Le zinc', 'C. Le calcium', 'D. Le magnésium'],
      'correctIndex': 1 
    },
    {
      'question': 'Quelle est la fonction principale des globules rouges ?',
      'options': ['A. Combattre les infections', 'B. Transporter l oxygène', 'C. Réguler la température corporelle', 'D. Produire des hormones'],
      'correctIndex': 1, 
    },
    {
      'question': 'Quel nutriment est essentiel pour la construction des muscles ??',
      'options': ['A. Les glucides', 'B. Les protéines', 'C. Les lipides', 'D. Les fibres'],
      'correctIndex': 1,  
    },
  ];

 
  void _selectAnswer(int selectedIndex) {
    if (selectedIndex ==
        _quizQuestions[_currentQuestionIndex]['correctIndex']) {
      setState(() {
        _score++; 
      });
    }

   
    if (_currentQuestionIndex < _quizQuestions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
      });
    } else {
    
      _showScoreDialog();
    }
  }

 
  void _showScoreDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Quiz termine'),
        content: Text('Ton score: $_score / ${_quizQuestions.length}'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                _score = 0;
                _currentQuestionIndex = 0; 
              });
            },
            child: const Text('Restart'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFF69B4),  
      appBar: AppBar(
        title: const Text('Quiz'),
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
             
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    _quizQuestions[_currentQuestionIndex]['question'],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ), 
                ),
              ),
              const SizedBox(height: 20),

             
              ..._quizQuestions[_currentQuestionIndex]['options']
                  .asMap()
                  .entries
                  .map((entry) {
                int index = entry.key;
                String option = entry.value;

                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0),
                  child: ElevatedButton(
                    onPressed: () => _selectAnswer(index),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      textStyle: const TextStyle(fontSize: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(option),
                  ),
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
