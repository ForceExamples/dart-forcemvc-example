part of example_forcedart;

@Controller()
class AboutController {
  
  @Value("application")
  String application;
  
  @Value("version")
  int version;
  
  @RequestMapping(value: "/test/about/")
  String aboutPage(req, Model model) {
    model.addAttribute("application", application);
    model.addAttribute("version", version);
    return "about";
  }
  
}