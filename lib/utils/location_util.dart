const GOOGLE_API_KEY = '';
const google_assinature = '';

class LocationUtil {
  static String generateLocationPreviewImage(
      {required double latitude, required double longitude}) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=13&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C40.$latitude,$longitude&key=$GOOGLE_API_KEY&signature=$google_assinature&signature=ywb3t91cMLOWWOW7kjGKoR0qqjA=';
  }
}
