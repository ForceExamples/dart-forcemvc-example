library multiplayer_game_force;

import 'package:forcemvc/force_mvc.dart';
import 'package:http/http.dart';

class CountController {
  int count = 0;
  
  CountController() {
    count = 1;
  }
  
  @RequestMapping(value: "/bla", method: "GET")
  void index(req, Model model) {
    model.addAttribute("bla", "hallo");
  }
  
  @RequestMapping(value: "/count")
  void index2(req, Model model) {
    count++;
    model.addAttribute("bla", "count $count");
  }
}