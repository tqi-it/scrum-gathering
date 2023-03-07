package br.com.agile.communit.mentorme.controller;

import javax.validation.Valid;
import javax.validation.constraints.NotBlank;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.com.agile.communit.mentorme.request.ContactHistoryRequest;
import br.com.agile.communit.mentorme.response.ContactHistoryResponse;
import br.com.agile.communit.mentorme.service.ContactHistoryService;
import lombok.AllArgsConstructor;

@Validated
@RestController
@AllArgsConstructor
@RequestMapping("/contactHistory")
public class ContactHistoryController {
	
	ContactHistoryService contactHistoryService;

//	@Operation(summary = "Registra o histórico de contato entre duas pessoas")
//	@ApiResponses(value = { @ApiResponse(responseCode = "200", description = "Contato registrado", content = {
//			@Content(mediaType = "application/json", schema = @Schema(hidden = true)) }) })
//	@PostMapping(value = "/register")
	public ResponseEntity<ContactHistoryResponse> register(@Valid @NotBlank(message = "Obrigatório") @RequestBody ContactHistoryRequest contactHistoryRequest) {
		;
		return ResponseEntity.status(HttpStatus.CREATED).body(contactHistoryService.registerContactHistory(contactHistoryRequest));
	}

}
