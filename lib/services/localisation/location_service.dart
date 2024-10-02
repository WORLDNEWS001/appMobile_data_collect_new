import 'package:flutter/services.dart';
import 'package:location/location.dart';
import 'package:geocoding/geocoding.dart' as geocoding;
import 'package:secondtest/model/other_class_object/GeoPosition.dart';

class LocationService {

  // Get Position
  Future<LocationData?> getPosition () async {
    try{
      print("je suis dans la fonction get position");
      Location location = Location();
      return location.getLocation();    
    } on PlatformException catch (error){
      print("Nous avons une erreur pour recuperé la position  Qui est :   $error");
      return null;
    }
  } 


  // Convertir Position en Ville
  Future<GeoPosition?> getCity() async{
      final position =await getPosition();
      if(position == null) return null;
      final lat = position.latitude ?? 0.0;
      final lon = position.longitude ?? 0.0;
      final altitude = position.altitude ?? 0.0;
      List<geocoding.Placemark> placemarts = await geocoding.placemarkFromCoordinates(lat, lon);
      print("******** Le PlaceMarks de getCity est de  $placemarts");
      final firstChoice = placemarts.first;
      print("******** Le firstChoice de getCity est de  $firstChoice");
      final GeoPosition geoPosition = GeoPosition(
          city: firstChoice.locality ?? "",
          lat: lat,
          lon: lon,
          altitude: altitude,
          street: firstChoice.street ?? "",
      );
      print("******** Le GeoPosition de getCity est de  $GeoPosition");
      return geoPosition;
  }


  // convertir une ville en Position
  Future<GeoPosition?> getCoordsFromCity(String city) async {
    final placemarks = await geocoding.locationFromAddress(city);
    if(placemarks.isEmpty) return null;
    final bestChoice = placemarks.first;

    List<geocoding.Placemark> GetInfoPlacemarts = await geocoding.placemarkFromCoordinates(bestChoice.latitude, bestChoice.longitude);
    final firstChoice_InfoPlacemarts = GetInfoPlacemarts.first;

    return GeoPosition(
        city: city,
        lat: bestChoice.latitude,
        lon: bestChoice.longitude,
        street: firstChoice_InfoPlacemarts.street ?? "",
    );
  }

}