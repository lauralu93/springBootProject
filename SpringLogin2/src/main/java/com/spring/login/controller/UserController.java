package com.spring.login.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Optional;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.login.entity.User;
import com.spring.login.repository.UserRepository;

@Controller
public class UserController {
	
	@Autowired
	private UserRepository userRepository;


	@RequestMapping(value = { "/", "/home" }, method = RequestMethod.GET)
	public ModelAndView hello(HttpServletResponse response, @ModelAttribute User user) throws IOException {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("home"); //e' possibile utilizzare il metodo setViewName() 
								// per dire in quale pagina voglio andare
		
		return mv;
	}
	
	@RequestMapping(value = "/addUser", method = RequestMethod.GET)
	public ModelAndView displayNewUserForm() {
		
		ModelAndView mv = new ModelAndView("addUser"); // oppure posso indicare il nome della pagina direttamente 
														// quando costruisco l'oggetto modelAndView
		
		mv.addObject("headerMessage", "Aggiungi dettagli nuovo utente");
		mv.addObject("user", new User());
		
		return mv;
	}

	@RequestMapping(value = "/cercaUtente", method = RequestMethod.GET)
	public ModelAndView findUser() {
		
		ModelAndView mv = new ModelAndView("cercaUtente"); // oppure posso indicare il nome della pagina direttamente 
														// quando costruisco l'oggetto modelAndView
		return mv;
	}
	  
	@RequestMapping(value = "/addUser", method = RequestMethod.POST)
	public ModelAndView saveNewUser(@ModelAttribute User user) {
		
		ModelAndView mv = new ModelAndView("home");

		System.out.println("STAMPAMI NOME " + user.getNome() + " E COGNOME " + user.getCognome());
		
		User userCheck = userRepository.save(user);
		
		if (userCheck != null) {
			
			mv.addObject("headerMessage", "Nuovo utente aggiunto con successo");
			mv.addObject("message","benvenuto " + userCheck.getNome() + ", ora puoi effettuare l'accesso");
		} else {
			
			return new ModelAndView("error");
		}

		return mv;
	}
	
	//verifica utente e login
	@RequestMapping(value = "/checkUser", method = RequestMethod.POST)
	public ModelAndView login (@ModelAttribute User user, ModelMap model) {
		
		User utente = userRepository.findByEmailAndPassword(user.getEmail(), user.getPassword());
		
		ModelAndView mv = new ModelAndView();
		if (utente != null) {
			mv.setViewName("login");
			model.addAttribute("nomeUtente", utente.getNome());
			model.addAttribute("cognomeUtente", utente.getCognome());
			
		}
		else {
			mv.addObject("errorMessage", "ops! qualcosa e' andato storto! riprova");
			mv.setViewName("home");
		}
		return mv;
	}
	
	//gestire una ricerca (ritorna una vista con tabella di tutti gli utenti)
	@RequestMapping(value = "/find", method = RequestMethod.GET)
	public ModelAndView findAll () {
		
		ArrayList <User> utenti = (ArrayList<User>) userRepository.findAll();	
		 
		ModelAndView mv = new ModelAndView("findAll");
		mv.addObject("utenti", utenti);
			// nell'elaborazione della tabella il model attribute memorizza per ogni utente il suo ID
			// (e lo passa al controller quando avviene richiesta delete/update
		mv.addObject("user", new User());
		
		return mv;
		
	}	
	
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.POST)
	public ModelAndView deleteUser(@PathVariable("id") int id) {
		
		System.out.println("DENTRO controller DELETE");
	
		userRepository.deleteById(id);

	ArrayList <User> utenti = (ArrayList<User>) userRepository.findAll();	
	 
	ModelAndView mv = new ModelAndView("findAll");
	mv.addObject("utenti", utenti);
	mv.addObject("user", new User());
	
	return mv;
	}
	
	@RequestMapping(value = "/editUser", method = RequestMethod.POST)
	public ModelAndView editUser (@ModelAttribute User user) {
		
		//ArrayList <User> utenti = (ArrayList<User>) userRepository.findAll();	
			// qui l'user (model attribute ha solo l'ID)
		System.out.println("stampo l'utente in arrivo dalla jsp " + user);
		
		User userCheck = userRepository.findById(user.getId());
		
		System.out.println("stampo l'utente ricavato dalla query " + userCheck);
		
		ModelAndView mv = new ModelAndView("pannelloUtente2");
		//mv.addObject("utenti", utenti);
		mv.addObject("user", userCheck);
		
		return mv;
		
	}	

	@RequestMapping(value = "/ultimateEdit", method = RequestMethod.POST)
	public ModelAndView ultimateEdit (@ModelAttribute User user) {
		
		//ArrayList <User> utenti = (ArrayList<User>) userRepository.findAll();	
		
		System.out.println("stampo l'utente in arrivo dalla jsp " + user);
			
		User userCheck = userRepository.save(user);
		ArrayList <User> utenti = (ArrayList<User>) userRepository.findAll();
		
		System.out.println("stampo l'utente ricavato dalla query " + userCheck);
		
		ModelAndView mv = new ModelAndView("findAll");
		mv.addObject("utenti", utenti);
		
		return mv;
		
	}	
	
}
