part of example_forcedart;

@Controller()
class PathController {
  
  @RequestMapping(value: "/var/{var1}/")
  String variable(req, Model model, var1) {
    model.addAttribute("variable", var1);
    return "pathvar";
  }

}