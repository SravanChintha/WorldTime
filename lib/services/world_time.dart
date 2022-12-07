import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location=''; // location name for the UI
  String time=''; // time in that location
  String flag=''; // url to an assets flag icon
  String url='';  // location url for api endpoint
  bool isDayTime = false; // true or false if daytime or not

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {

    try {
      var urls = Uri.parse('http://worldtimeapi.org/api/timezone/$url');
      //make the request
      Response response = await get(urls);
      Map data = jsonDecode(response.body);

      // get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);
      String offsetTwo = data['utc_offset'].substring(4,6);

      // create a DateTime object
      DateTime now = DateTime.parse(datetime);
      print(int.parse(offsetTwo));
      print(int.parse(offset));
      now = now.add(Duration(hours: int.parse(offset), minutes: int.parse(offsetTwo)));
      // now = now.add(Duration(minutes: int.parse(offsetTwo)));

      // set the time property
      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
      print(isDayTime);
    } catch (e) {
      print('caught error: $e');
      time = 'could not get time data';
    }
  }

}
