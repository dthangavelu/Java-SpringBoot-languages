package com.spring.languages.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.languages.model.Language;

@Service
public class LanguageService {
	
	private List<Language> languages = new ArrayList<Language>(Arrays.asList(
			new Language("Java", "James Gosling", "1.8"),
			new Language("Python", "Guido Rossum", "3.6"),
			new Language("Java Script", "Brendon Eich", "8.9")
			));
	
	public List<Language> getAll(){
		return languages;
	}
	
	public void createNewLang(Language lang) {
		languages.add(lang);
	}
	
	public Language getLangByName(String name) {
		Language lang = new Language();
		for(int i = 0; i < languages.size(); i++) {
			if(name.toLowerCase().trim().equals(languages.get(i).getName().toLowerCase().trim())) {
				lang = languages.get(i);
				break;
			}
		}
		return lang;
	}
	
	public void destroyLanguageByName(String name) {
		for(int i = 0; i < languages.size(); i++) {
			if(name.toLowerCase().trim().equals(languages.get(i).getName().toLowerCase().trim())) {
				languages.remove(i);
				break;
			}
		}
	}

	public void updateLanguage(String name, Language language) {		
		System.out.println(("in service: " + language.getCreator() + " | " + language.getName() + " | " + language.getVersion()));
		for(int i = 0; i < languages.size(); i++) {
			if(name.toLowerCase().trim().equals(languages.get(i).getName().toLowerCase().trim())) {
				languages.set(i, language);
				break;
			}
		}
		
	}
	
}
