part of example_forcedart;

@Controller()
class PostController {
  
  @RequestMapping(value: "/form/")
  String form(req, Model model) {
    return "form";
  }
  
  @RequestMapping(value: "/post/", method: "POST")
  void countMethod(req, Model model) {
     req.getPostParams().then((map) {
       model.addAttribute("email", map["email"]);
     });
     model.addAttribute("status", "ok");
  }
  
}