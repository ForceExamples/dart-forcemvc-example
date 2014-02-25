part of example_forcedart;

@Controller()
class CountController {
  int count = 0;
  
  CountController() {
    count = 1;
  }
  
  @ModelAttribute("datetime")
  String addDateTime() {
    DateTime now = new DateTime.now();
    return now.toString();
  }
  
  @RequestMapping(value: "/count")
  String countMethod(req, Model model) {
    count++;
    model.addAttribute("count", "$count");
    return "count";
  }
  
  @RequestMapping(value: "/var/{var1}")
  String variable(req, Model model) {
    model.addAttribute("variable", req.path_variables['var1']);
    return "pathvar";
  }
  
  @RequestMapping(value: "/json")
  void countJson(req, Model model) {
    model.addAttribute("count", "$count");
    model.addAttribute("bla", "hallo");
  }
}