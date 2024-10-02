import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:secondtest/controller/ControllerManagerVehicule/ControllerAddVehicule.dart';
import 'package:secondtest/model/class_data_oms_type/Enquete/VehiculeResp.dart';
import 'package:secondtest/model/provider/collecte_data_provider/provider_collecte_data_enquette.dart';
import 'package:secondtest/widgets/general_widget/dialog/DialogBottomSheetType.dart';


class recordCarCrash extends StatefulWidget {

  recordCarCrash({
    Key? key,
    required this.onStepUpdated,
    this.listVehicule,
    this.isConsult = false,
  }) : super(key: key);

  final Function(int) onStepUpdated;
  List<VehiculeResp>? listVehicule = [];
  bool isConsult;


  static int someAction(Function(int) onStepUpdated) {
    onStepUpdated(3);
    print("je suis dans la fonction somme action du child de record Road ");
    return 22222;
  }


  @override
  State<recordCarCrash> createState() => _recordCarCrashState();
}

class _recordCarCrashState extends State<recordCarCrash> {
  List<VehiculeResp>? listVehiculeRecord = [];

  @override
  void initState() {
    super.initState();
    print("initiation de la page Record Car terminer ----");
    listVehiculeRecord = context.read<ProviderColleteDataEnquete>().list_data_enq_vehicules;
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    listVehiculeRecord = context.watch<ProviderColleteDataEnquete>().list_data_enq_vehicules;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listVehiculeRecord?.length,
      itemBuilder: (BuildContext context, int index) {
        VehiculeResp? oneVehicule = listVehiculeRecord?[index];
        return Card(
          color: Color.fromRGBO(225, 243, 255, 0.8784313725490196),
          child: ListTile(
            leading: Icon(
              Icons.car_crash_rounded,
              size: 50,
              color: Colors.blueAccent,
            ),
            title: Text(
                "Vehicule N° ${oneVehicule?.vehicleAccidentNumber ?? 'No Number'} - Matricule : ${oneVehicule?.plate ?? 'No plate'} "),
            subtitle: Text(
                "${oneVehicule?.type?.value}  -  ${oneVehicule?.brand?.value}  -  ${oneVehicule?.model?.value}"),
            trailing: IconButton(
              icon: Icon(
                Icons.delete_forever_sharp,
                size: 30,
                color: Colors.red,
              ),
              onPressed: widget.isConsult ? null :
                  () {
                onPressToDeleteOneCar(vehiculeResp: oneVehicule);
                //context.read<ProviderColleteDataEnquete>().DeleteVehicule(vehiculeResp: oneVehicule);
              },
            ),
            onTap: () {
              //-----------recovery
              recordCarCrash.someAction((p0) => null);
              //------------test recovery

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ControllerAddVehicule(vehicule: oneVehicule, isConsult: widget.isConsult),
                ),
              );
            },
          ),
        );
      },
    );
  }


  onPressToDeleteOneCar({required VehiculeResp? vehiculeResp}) async {
    //await MethodeLinkPersonInPatient(context: context, person: person);

    CustomBottomSheet(
      typeAction: 'danger',
      heightFactor: 0.33,
      title: "Suppression de Véhicule",
      subTitle: "Confirmation de suppression",
      confirmAction: () async {

        context.read<ProviderColleteDataEnquete>().DeleteVehicule(vehiculeResp: vehiculeResp);

      },
      exitAction: () {
        print("Annuler");
      },
      content:Container(
        margin: EdgeInsets.all(50),
        height: 30,
        decoration: BoxDecoration(
          color: Colors.red[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            "Voulez-vous vraiment Supprimer le Véhicule de Matricule : ${vehiculeResp?.plate} ?",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.red[400],
            ),
          ),
        ),
      ),
    ).show(context);

  }





}



