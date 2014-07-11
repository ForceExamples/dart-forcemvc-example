import 'package:unittest/unittest.dart';
import 'package:unittest/mock.dart';
import 'package:forcemvc/force_mvc.dart';
import '../server.dart';
import 'dart:io';

class MockHttpRequest extends Mock implements HttpRequest {}

main() {  
  // First tests!  
  var countController = new CountController();
  
  Model model = new Model();
  ForceRequest req = new ForceRequest(new MockHttpRequest());
  
  test('testing the count controller', () {
      var view = countController.countMethod(req, model);
      expect(view, "count");
      expect(model.getData()["count"], "2");
  });
  
 
}
