package br.com.agile.communit.mentorme.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.com.agile.communit.mentorme.controller.request.SkillRequest;
import br.com.agile.communit.mentorme.controller.response.SkillResponse;
import br.com.agile.communit.mentorme.service.SkillService;
import lombok.AllArgsConstructor;

@Validated
@RestController
@AllArgsConstructor
@RequestMapping("/skill")
public class SkillController {

	SkillService skillService;

	@PostMapping(value = "/create")
	public ResponseEntity<SkillResponse> create(@RequestBody SkillRequest skillRequest) {
		return ResponseEntity.status(HttpStatus.CREATED).body(skillService.save(skillRequest));
	}

	@GetMapping(value = "/list")
	public ResponseEntity<List<SkillResponse>> list() {
		return ResponseEntity.status(HttpStatus.OK).body(skillService.findAll());
	}

}
