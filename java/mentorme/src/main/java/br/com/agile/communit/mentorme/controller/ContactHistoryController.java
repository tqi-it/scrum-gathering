package br.com.agile.communit.mentorme.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.com.agile.communit.mentorme.controller.request.ContactHistoryRequest;
import br.com.agile.communit.mentorme.controller.response.ContactHistoryResponse;
import br.com.agile.communit.mentorme.service.ContactHistoryService;

@Validated
@RestController
@RequiredArgsConstructor
@RequestMapping("/contactHistory")
public class ContactHistoryController {

	private final ContactHistoryService contactHistoryService;

//	@Operation(summary = "Registra o histórico de contato entre duas pessoas")
//	@ApiResponses(value = { @ApiResponse(responseCode = "200", description = "Contato registrado", content = {
//			@Content(mediaType = "application/json", schema = @Schema(hidden = true)) }) })
	@PostMapping(value = "/register")
	public ResponseEntity<ContactHistoryResponse> register(@RequestBody ContactHistoryRequest contactHistoryRequest) {
		return ResponseEntity.status(HttpStatus.CREATED).body(contactHistoryService.registerContactHistory(contactHistoryRequest));
	}

}
