import 'package:path/path.dart';

class problem {
  int n = 234;
  late String nn;
  late int result;
  
  problem() {
    nn = n.toString();
    int num = 0;
    for (var i in nn.split('')) {
      num += int.parse(i);
    }
    result = num;

  
  }

}
