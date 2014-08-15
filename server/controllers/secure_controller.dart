part of example_forcedart;

@Controller
@Authentication
class AdminController {
  
  int redirect = 0;
  
  @RequestMapping(value: "/admin/info/")
  String variable(req, Model model) {
    return "info";
  }
  
}