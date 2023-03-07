package br.com.agile.communit.mentorme.controller;

import javax.validation.Valid;
import javax.validation.constraints.NotBlank;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import lombok.AllArgsConstructor;

@Validated
@RestController
@AllArgsConstructor
@RequestMapping("/contactHistory")
public class ContactHistoryController {

//	@Operation(summary = "Registra o histórico de contato entre duas pessoas")
//	@ApiResponses(value = { @ApiResponse(responseCode = "200", description = "Contato registrado", content = {
//			@Content(mediaType = "application/json", schema = @Schema(hidden = true)) }) })
//	@PostMapping(value = "/register")
	public void register(@Valid @NotBlank(message = "Obrigatório") @RequestParam("busca") String busca) {

		//TODO
	}

}
