package br.com.agile.communit.mentorme.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.com.agile.communit.mentorme.response.PersonResponse;
import br.com.agile.communit.mentorme.service.PersonService;
import lombok.AllArgsConstructor;

@Validated
@RestController
@AllArgsConstructor
@RequestMapping("/person")
public class PersonController {

	PersonService personService;

	@GetMapping(value = "/listMentors")
	public ResponseEntity<List<PersonResponse>> listMentors() {
		return ResponseEntity.status(HttpStatus.OK).body(personService.listMentor());
	}
	
	@GetMapping(value = "/listMentored")
	public ResponseEntity<List<PersonResponse>> listMentored() {
		return ResponseEntity.status(HttpStatus.OK).body(personService.listMentored());
	}

}
