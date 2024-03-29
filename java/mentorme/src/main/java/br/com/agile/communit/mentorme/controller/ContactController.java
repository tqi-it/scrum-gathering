package br.com.agile.communit.mentorme.controller;

import br.com.agile.communit.mentorme.model.Contact;
import br.com.agile.communit.mentorme.service.ContactService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Validated
@RestController
@RequiredArgsConstructor
@RequestMapping("/contact")
public class ContactController {

	private final ContactService contactService;

	@GetMapping()
	public ResponseEntity<List<Contact>> findAll() {
		return ResponseEntity.status(HttpStatus.OK).body(contactService.findAll());
	}

}
