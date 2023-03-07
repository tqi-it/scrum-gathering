package br.com.agile.communit.mentorme.controller;

import java.util.List;

import javax.validation.Valid;
import javax.validation.constraints.NotBlank;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.com.agile.communit.mentorme.request.PersonRequest;
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
	
	@PostMapping(value = "/register")
	public ResponseEntity<PersonResponse> register(@Valid @NotBlank(message = "Obrigatório") @RequestBody PersonRequest personRequest) {
		return ResponseEntity.status(HttpStatus.CREATED).body(personService.save(personRequest));
	}

}
