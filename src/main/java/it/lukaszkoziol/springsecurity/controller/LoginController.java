package it.lukaszkoziol.springsecurity.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {
    @GetMapping("showMyLoginPage")
    public String showMyLoginPage() {
        return "fancy-login";           //plain-login.jsp || or new one: fancy-login
    }
    @GetMapping("/access-denied")
    public String showAccessDenied() {
        return "access-denied";
    }
}
