import 'package:flutter/material.dart';

class recordCarCrash extends StatefulWidget {
  const recordCarCrash({Key? key}) : super(key: key);
  //final Function(int) onStepUpdated;


  @override
  State<recordCarCrash> createState() => _recordCarCrashState();
}

class _recordCarCrashState extends State<recordCarCrash> {



  final List<MyData> dataList = [
    MyData(
      title: 'Vehicule Accidenté n° 20',
      subtitle: 'Sous-titre 1',
    ),
    MyData(
      title: 'Vehicule Accidenté n° 21',
      subtitle: 'Sous-titre 2',
    ),
    // Ajoutez les autres éléments de votre liste de données ici
  ];
  /*void someAction() {
    // Effectuez l'action qui doit modifier currentStep
    // ...
    print("je suis dans la fonction somme action du child de record Road ");
    widget.onStepUpdated(3);
  }*/
  //--------------------  for update value step (MAKE function Some Action)

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dataList.length,
      itemBuilder: (BuildContext context, int index) {
        //final MyData data = dataList[index];
        return Card(
          child: ListTile(
            title: Text(dataList[index].title),
            subtitle: Text(dataList[index].subtitle),
          ),
        );
      },

    );
  }
}


class carRecordtest extends StatelessWidget {


  final List<MyData> dataList = [
    MyData(
      title: 'Vehicule Accidenté n° 10',
      subtitle: 'Sous-titre 1',
    ),
    MyData(
      title: 'Vehicule Accidenté n° 21',
      subtitle: 'Sous-titre 2',
    ),
    // Ajoutez les autres éléments de votre liste de données ici
  ];




  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      itemCount: dataList.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: ListTile(
            title: Text(dataList[index].title),
            subtitle: Text(dataList[index].subtitle),
          ),
        );
      },
    );
  }
}



class MyData {
  final String title;
  final String subtitle;

  MyData({
    required this.title,
    required this.subtitle,
  });
}





/*
class MyApptest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stepper Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StepperPage(),
    );
  }
} */

class StepperPage extends StatefulWidget {
  @override
  _StepperPageState createState() => _StepperPageState();

}

class _StepperPageState extends State<StepperPage> {
  int currentStep = 0;
  List<String> dataList = ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5'];
  final List<MyData> dataListe = [
    MyData(
      title: 'Vehicule Accidenté n° 1111',
      subtitle: 'Sous-titre 1',
    ),
    MyData(
      title: 'Vehicule Accidenté n° 2222',
      subtitle: 'Sous-titre 2',
    ),
    MyData(
      title: 'Vehicule Accidenté n° 10',
      subtitle: 'Sous-titre 1',
    ),
    MyData(
      title: 'Vehicule Accidenté n° 21',
      subtitle: 'Sous-titre 2',
    ),
    MyData(
      title: 'Vehicule Accidenté n° 10',
      subtitle: 'Sous-titre 1',
    ),
    MyData(
      title: 'Vehicule Accidenté n° 21',
      subtitle: 'Sous-titre 2',
    ),
    MyData(
      title: 'Vehicule Accidenté n° 10',
      subtitle: 'Sous-titre 1',
    ),
    MyData(
      title: 'Vehicule Accidenté n° 10',
      subtitle: 'Sous-titre 1',
    ),
    MyData(
      title: 'Vehicule Accidenté n° 21',
      subtitle: 'Sous-titre 2',
    ),
    MyData(
      title: 'Vehicule Accidenté n° 10',
      subtitle: 'Sous-titre 1',
    ),
    MyData(
      title: 'Vehicule Accidenté n° 21',
      subtitle: 'Sous-titre 2',
    ),
    MyData(
      title: 'Vehicule Accidenté n° 10',
      subtitle: 'Sous-titre 1',
    ),
    MyData(
      title: 'Vehicule Accidenté n° 21',
      subtitle: 'Sous-titre 2',
    ),
    MyData(
      title: 'Vehicule Accidenté n° 21',
      subtitle: 'Sous-titre 2',
    ),
    MyData(
      title: 'Vehicule Accidenté n° 10',
      subtitle: 'Sous-titre 1',
    ),
    MyData(
      title: 'Vehicule Accidenté n° 21',
      subtitle: 'Sous-titre 2',
    ),
    MyData(
      title: 'Vehicule Accidenté n° 10',
      subtitle: 'Sous-titre 1',
    ),
    MyData(
      title: 'Vehicule Accidenté n° 10',
      subtitle: 'Sous-titre 1',
    ),
    MyData(
      title: 'Vehicule Accidenté n° 21',
      subtitle: 'Sous-titre 2',
    ),
    MyData(
      title: 'Vehicule Accidenté n° 10',
      subtitle: 'Sous-titre 1',
    ),
    MyData(
      title: 'Vehicule Accidenté n° 21',
      subtitle: 'Sous-titre 2',
    ),
    MyData(
      title: 'Vehicule Accidenté n° 10',
      subtitle: 'Sous-titre 1',
    ),
    MyData(
      title: 'Vehicule Accidenté n° 21',
      subtitle: 'Sous-titre 2',
    ),
    MyData(
      title: 'Vehicule Accidenté n° 1111',
      subtitle: 'Sous-titre 1',
    ),
    MyData(
      title: 'Vehicule Accidenté n° 222222',
      subtitle: 'Sous-titre 2',
    ),

    // Ajoutez les autres éléments de votre liste de données ici
  ];



  @override
  Widget build(BuildContext context ) {


    void onStepContinue() {
      setState(() {
        if (currentStep < 3) {
          currentStep += 1;
        }
      });
    }

    void onStepCancel() {
      setState(() {
        if (currentStep > 0) {
          currentStep -= 1;
        }
      });
    }
    int itemCount;
    return Scaffold(
      appBar: AppBar(
        title: Text('Stepper Example'),
      ),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            double parentHeight = constraints.maxHeight;
            return Center (

              child: Stepper(
                type: StepperType.horizontal,
                currentStep: currentStep,
                onStepTapped: (int step) {
                  setState(() {
                    currentStep = step;
                  });
                },
                onStepContinue: () {
                  setState(() {
                    if (currentStep < 2) {
                      currentStep += 1;
                    }
                  });
                },
                onStepCancel: () {
                  setState(() {
                    if (currentStep > 0) {
                      currentStep -= 1;
                    }
                  });
                },



                steps: [
                  Step(
                    title: Text('Step 1'),
                    content: Column(
                      children: List.generate(
                        itemCount=30,
                            (index) => ListTile(
                          title: Text('Item $index'),
                        ),
                      ),
                    ),
                    isActive: currentStep == 0,
                  ),
                  Step(
                    title: Text('Step 2'),
                    content: Container(
                      padding: EdgeInsets.only(bottom: 100),
                      height: parentHeight,
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              itemCount: dataListe.length,
                              itemBuilder: (context, index) {
                                final item = dataListe[index];
                                return ListTile(
                                  title: Text(item.title),
                                  subtitle: Text(item.subtitle),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),





                    isActive: currentStep == 1,
                  ),

                  Step(
                    title: Text('Step 3'),
                    content: Text('This is the content of Step 3.'),
                    isActive: currentStep == 2,
                  ),
                ],
              ),
            );
          }
      ),







      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton.icon(
              onPressed: onStepCancel,
              icon: Icon(Icons.cancel),
              label: Text('Annuler'),
            ),
            ElevatedButton.icon(
              onPressed: onStepContinue,
              icon: Icon(Icons.arrow_forward),
              label: Text('Continuer'),
            ),
          ],
        ),
      ),
    );
  }
}






/* Step(
              title: Text('Step 2'),
              content: Container(
                height: 500,
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: dataListe.length,
                        itemBuilder: (context, index) {
                          final item = dataListe[index];
                          return ListTile(
                            title: Text(item.title),
                            subtitle: Text(item.subtitle),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
)  */
