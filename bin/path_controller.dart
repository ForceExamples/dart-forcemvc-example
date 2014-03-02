part of example_forcedart;

@Controller()
class PathController {
  
  @RequestMapping(value: "/var/{var1}/")
  String variable(req, Model model) {
    model.addAttribute("variable", req.path_variables['var1']);
    return "pathvar";
  }

}