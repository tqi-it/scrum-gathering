package br.com.agile.communit.mentorme.service;

import java.time.LocalDateTime;

import br.com.agile.communit.mentorme.enums.RequestType;
import org.springframework.stereotype.Service;

import br.com.agile.communit.mentorme.model.ContactHistory;
import br.com.agile.communit.mentorme.model.Person;
import br.com.agile.communit.mentorme.repository.ContactHistoryRepository;
import br.com.agile.communit.mentorme.request.ContactHistoryRequest;
import br.com.agile.communit.mentorme.response.ContactHistoryResponse;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class ContactHistoryService {

	private final ContactHistoryRepository contactHistoryRepository;

	public ContactHistoryResponse registerContactHistory(ContactHistoryRequest request) {
		var history = ContactHistory.builder()
				.to(Person.builder().id(request.getPersonTo()).build()).contactType(request.getContactType())
				.contactValue(request.getContactValue())
				.when(LocalDateTime.now())
				.requestType(request.isMentor() ? RequestType.MENTORIA : RequestType.MENTORADO)
				.build();

		ContactHistory contactHistory = contactHistoryRepository.save(history);

		return ContactHistoryResponse.builder().id(contactHistory.getId()).build();
	}
}
