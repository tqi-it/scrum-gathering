package br.com.agile.communit.mentorme.service;

import org.springframework.stereotype.Service;

import br.com.agile.communit.mentorme.repository.ContactHistoryRepository;
import br.com.agile.communit.mentorme.request.ContactHistoryRequest;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class ContactHistoryService {
	
	private ContactHistoryRepository contactHistoryRepository;

    public void registerContactHistory(ContactHistoryRequest request) {
    	//TODO
//    	ContactHistory contactHistory = new ContactHistory();
//    	contactHistoryRepository.save(contactHistory);
    }
}
