package it.lukaszkoziol.springsecurity.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AppController {

    @GetMapping("/")                        // security_demo_war transfer to start home.jsp page
    public String showHome() {
        return "home";                      //WEB-INF/view/home.jsp
    }

    @GetMapping("/leaders")
    public String showLeaders() {
        return "leaders";
    }

    @GetMapping("/systems")
    public String showSystems() {
        return "admin";
    }
}
