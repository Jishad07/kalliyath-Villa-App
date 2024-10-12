import 'dart:collection';
import 'dart:typed_data';
import 'package:kalliyath_villa_admin/add_villa/add_villa.dart';
import 'package:kalliyath_villa_admin/add_villa/image_save/imagesave_functions.dart';
import 'package:kalliyath_villa_admin/add_villa/dialogue_fields.dart/drop_down.dart';
import 'package:kalliyath_villa_admin/add_villa/dialogue_fields.dart/text_field.dart';

String villaname = villaNamecontroller.text.trim();
String description = villaDescriptioncontroller.text.trim();
LinkedHashMap<String, dynamic> location = LinkedHashMap<String, dynamic>();

Map<String, dynamic> locationaddress = {};
String type = '';
bool ac = false;
String price = villaPricecontroller.text.trim();
String bhk = villaBhkcontroller.text.trim();
String perperson = villaperpersoncontroller.text.trim();
bool wifi = false;
bool parking = false;
bool tv = false;
bool swimmingpool = false;
bool playground = false;
bool spa = false;
bool fitness = false;

Future<List> imagecontroller(List values) async {
  List result = [];
  for (Uint8List i in values) {
    String imageurl = await addimageTofirebase(i);
    result.add(imageurl);
  }
  return result;
}

List img = [];
Future<Map<String, dynamic>> getallvillasdetails(
    {List? imagesindatabase, required bool istrue, String? id}) async {
  if (istrue == true) {
    final image2 = await imagecontroller(imagesupdate);
    image2.addAll(editchangeslist);
    image2.sort();
    img = image2;
  } else {
    img = await imagecontroller(imagesList);
  }

  final data = {
    'name': villaname,
    'description': description,
    'location': location,
    'locationadress': locationaddress,
    'type': type,
    'totalstar': 0,
    'reviews': [],
    'ac': ac,
    'status': false,
    'saved': false,
    'price': price,
    'perperson': perperson,
    'bhk': bhk,
    'wifi': wifi,
    'parking': parking,
    'tv': tv,
    'swimmingpool': swimmingpool,
    'playground': playground,
    'spa': spa,
    'fitness': fitness,
    'images': img
  };
  return data;
}

editcontroller(Map<String, dynamic> details) async {
  villaNamecontroller.text = details['name'];
  villaDescriptioncontroller.text = details['description'];
  villaPricecontroller.text = details['price'];
  villaperpersoncontroller.text = details['perperson'];
  villaBhkcontroller.text = details['bhk'];
  selectedVilla = details['type'];
  location = details['location'];
  locationaddress = details['locationadress'];
  type = details['type'];
  editchangeslist = details['images'];
  ac = details['ac'];
  wifi = details['wifi'];
  parking = details['parking'];
  tv = details['tv'];
  swimmingpool = details['swimmingpool'];
  playground = details['playground'];
  spa = details['spa'];
  fitness = details['fitness'];
  acistrue = details['ac'];
}
