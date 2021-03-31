//login in googlr cloud platform 
//choose maps and location
//get the api key
const GOOGLE_API_KEY = '';

class LocationHelper {
  static String generateLocationPreview({double latitude, double longitude}) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$longitude&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$latitude,$longitude&key=$GOOGLE_API_KEY';
  }
}
