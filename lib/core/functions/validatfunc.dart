import 'package:get/utils.dart';

validateFunc(String val, int min, int max, String type) {
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "put real email to check";
    }
  }
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "the username isn't valid";
    }
  }
  if (val.isEmpty) {
    return "fill the input first!!";
  }
  if (val.length < min) {
    return "the input must be longer then $min litters";
  }
  if (val.length > max) {
    return "the input is too big it must be smaller then $max litters";
  }
}
