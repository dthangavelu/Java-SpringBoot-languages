package com.spring.languages.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.languages.model.Language;
import com.spring.languages.service.LanguageService;

@Controller
public class LanguageController {

	@Autowired
	private LanguageService languageService;
	
	@GetMapping("/languages")
	public String index(Model model, @ModelAttribute("language") Language language, @ModelAttribute("name_error") String name_error, @ModelAttribute("creator_error") String creator_error, @ModelAttribute("version_error") String version_error) {
		model.addAttribute("allLang", languageService.getAll());
		return "index";
	}
	
	@PostMapping("/language/new")
	public String createNewLang(@Valid @ModelAttribute("language") Language language, BindingResult result, RedirectAttributes redirectAttributes) {
		if(result.hasErrors()) {			
			   List<FieldError> errors = result.getFieldErrors();
			    for (FieldError error : errors ) {			        
			        redirectAttributes.addFlashAttribute(error.getField()+"_error", (error.getField() + " - " + error.getDefaultMessage()));
			    }			    			
		}else {
			languageService.createNewLang(language);
		}
		return "redirect:/languages";
	}
	
	@GetMapping("/languages/{name}")
	public String getLangByName(@PathVariable("name") String name, Model model) {		
		model.addAttribute("lang", languageService.getLangByName(name));
		return "languageDetails";
	}
	
	@GetMapping("/delete/{name}")
	public String destroyLanguageByName(@PathVariable("name") String name) {		
		languageService.destroyLanguageByName(name);
		return "redirect:/languages";
	}
	
	@GetMapping("/edit/{name}")
	public String editLanguageByName(@PathVariable("name") String name, Model model, @ModelAttribute("language") Language language) {		
		model.addAttribute("lang", languageService.getLangByName(name));
		return "editLanguage";
		
	}
	
	@PostMapping("/edit/{name}")
	public String edit(@Valid @ModelAttribute("language") Language language, BindingResult result, Model model, @PathVariable("name") String name) {
		
		if(result.hasErrors()) {			
			   List<FieldError> errors = result.getFieldErrors();
			    for (FieldError error : errors ) {			        
			    	model.addAttribute(error.getField()+"_error", (error.getField() + " - " + error.getDefaultMessage()));
			    }
			    return "editLanguage";
		}else {
			System.out.println("langu: " + language.getCreator() +" | " + language.getName() + " | " + language.getVersion());
			languageService.updateLanguage(name, language);
			return "redirect:/languages";
		}
		
	}
	
	
}
