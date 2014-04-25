part of example_forcedart;

@Controller()
class RedirectController {
  
  int redirect = 0;
  
  @RequestMapping(value: "/redirect/")
  String variable(req, Model model) {
    redirect++;
    return "redirect:/viewable/";
  }
  
  @RequestMapping(value: "/viewable/")
  String countMethod(req, Model model) {
     model.addAttribute("number", "$redirect");
     model.addAttribute("name", "redirect");
     return "number";
  }
  
}