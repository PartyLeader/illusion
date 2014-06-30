package com.company.permgen.webapp.controller;

import com.company.permgen.webapp.model.User;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import java.util.Date;

/** A Spring MVC form controller for the Letter example. */
public class LetterFormController extends SimpleFormController {

  public LetterFormController() {
    setCommandClass(User.class);
  }

  protected ModelAndView onSubmit(Object command) throws Exception {
    User user = (User) command;
      ModelAndView modelAndView = new ModelAndView(getSuccessView(), "user", user);
      modelAndView.addObject("date", new Date());
      return modelAndView;
  }
}
