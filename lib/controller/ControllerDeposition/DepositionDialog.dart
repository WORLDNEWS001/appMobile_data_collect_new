import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:secondtest/model/provider/deposition_provider/depositionProvider.dart';

class DepositionDialog extends StatefulWidget {
  @override
  _DepositionDialogState createState() => _DepositionDialogState();
}

class _DepositionDialogState extends State<DepositionDialog> {
  final _formKey = GlobalKey<FormState>();
   TextEditingController? _identityController;
   TextEditingController? _depositionController;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _identityController = context.watch<ProviderDeposition>().controllerIdentitePerson;
    _depositionController = context.watch<ProviderDeposition>().controllerDeposition;
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Tous les champs sont valides, vous pouvez faire l'action souhaitée
      context.read<ProviderDeposition>().addDeposition();
      Navigator.of(context).pop(); // Ferme le dialog
    } else {
      // Un ou plusieurs champs sont invalides
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Erreur"),
            content: Text("Tous les champs doivent être remplis."),
            actions: <Widget>[
              TextButton(
                child: Text(
                    "OK",
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        padding: EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width * 0.8, // 80% de la largeur de l'écran
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              "Ajouter une Déposition",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: _identityController,
                    decoration: InputDecoration(
                      labelText: "Identité de la personne",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez entrer l\'identité de la personne';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _depositionController,
                    decoration: InputDecoration(
                      labelText: "Déposition Faites",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    maxLines: 4,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez entrer la déposition';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Annuler"),
                ),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: Text("Ajouter",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Pour appeler ce dialog dans une page :
void showDepositionDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return DepositionDialog();
    },
  );
}

