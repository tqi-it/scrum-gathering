package br.com.agile.communit.mentorme.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.jvnet.hk2.annotations.Optional;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.com.agile.communit.mentorme.request.InterestRequest;
import br.com.agile.communit.mentorme.request.PersonRequest;
import br.com.agile.communit.mentorme.request.SkillRequest;
import br.com.agile.communit.mentorme.response.PersonResponse;
import br.com.agile.communit.mentorme.response.SkillResponse;
import br.com.agile.communit.mentorme.service.PersonService;
import br.com.agile.communit.mentorme.service.SkillService;
import lombok.AllArgsConstructor;

@Validated
@RestController
@AllArgsConstructor
@RequestMapping("/person")
public class PersonController {

	PersonService personService;
	SkillService skillService;

	@GetMapping(value = "/listMentors")
	public ResponseEntity<List<PersonResponse>> listMentors() {
		return ResponseEntity.status(HttpStatus.OK).body(personService.listMentor());
	}

	@GetMapping(value = "/listMentored")
	public ResponseEntity<List<PersonResponse>> listMentored() {
		return ResponseEntity.status(HttpStatus.OK).body(personService.listMentored());
	}

	@PostMapping(value = "/register")
	public ResponseEntity<PersonResponse> register(@RequestBody PersonRequest personRequest) {
		return ResponseEntity.status(HttpStatus.CREATED).body(personService.save(personRequest));
	}

	@GetMapping("{id}")
	public ResponseEntity<PersonResponse> getById(@PathVariable("id") Integer idPerson) {
		return ResponseEntity.status(HttpStatus.OK).body(personService.findOne(idPerson));
	}

	@DeleteMapping("{id}")
	public ResponseEntity<Void> delete(@PathVariable("id") Integer idPerson) {
		personService.delete(idPerson);
		return ResponseEntity.status(HttpStatus.OK).build();
	}

	@PostMapping(value = "/addInterest")
	public ResponseEntity<SkillResponse> addInterest(@RequestBody InterestRequest interestRequest) {
		return ResponseEntity.status(HttpStatus.CREATED).body(skillService.addInterest(interestRequest));
	}

	@PostMapping(value = "/addSkill")
	public ResponseEntity<SkillResponse> addSkill(@RequestBody InterestRequest interestRequest) {
		return ResponseEntity.status(HttpStatus.CREATED).body(skillService.addSkill(interestRequest));
	}

	@PostMapping(value = "/listMentorsBySkills")
	public ResponseEntity<List<PersonResponse>> listMentorsBySkills(
			@RequestBody(required = false) List<SkillRequest> skills) {
		return (skills == null || skills.isEmpty()) ? listMentors()
				: ResponseEntity.status(HttpStatus.CREATED).body(personService.listMentorsBySkills(skills));
	}

	@PostMapping(value = "/listMentoredsByInterests")
	public ResponseEntity<List<PersonResponse>> listMentoredsByInterests(
			@RequestBody(required = false) List<SkillRequest> skills) {
		return (skills == null || skills.isEmpty()) ? listMentored()
				: ResponseEntity.status(HttpStatus.CREATED).body(personService.listMentorsBySkills(skills));
	}

}
