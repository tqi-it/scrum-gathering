package br.com.agile.communit.mentorme.service;

import br.com.agile.communit.mentorme.exception.NotFoundException;
import br.com.agile.communit.mentorme.model.Contact;
import br.com.agile.communit.mentorme.model.Person;
import br.com.agile.communit.mentorme.model.SkillToLearn;
import br.com.agile.communit.mentorme.model.SkillToTeach;
import br.com.agile.communit.mentorme.repository.*;
import br.com.agile.communit.mentorme.request.PersonRequest;
import br.com.agile.communit.mentorme.request.SkillRequest;
import br.com.agile.communit.mentorme.response.PersonResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@RequiredArgsConstructor
@Service
public class PersonService {

	private final PersonRepository personRepository;
	private final ContactRepository contactRepository;
	private final ContactTypeRepository contactTypeRepository;
	private final ContactHistoryRepository contactHistoryRepository;
	private final SkillToTeachRepository skillToTeachRepository;
	private final SkillToLearnRepository skillToLearnRepository;

	public Person findById(Integer personId) {
		return personRepository.findById(personId).orElseThrow(() -> new NotFoundException("Usuário não encontrado"));
	}

	public PersonResponse findOne(Integer personId) {
		return personRepository.findById(personId)
				.map(it -> PersonResponse.entityToResponse(it,
						contactRepository.findByPersonId(it.getId()).orElse(new ArrayList<>()),
						contactHistoryRepository.countContactsTo(it.getId()),
						skillToTeachRepository.findByPersonId(it.getId()).orElse(new ArrayList<>()),
						skillToLearnRepository.findByPersonId(it.getId()).orElse(new ArrayList<>())))
				.get();
	}

	public List<PersonResponse> listMentor() {
		return personRepository.findByCanTeachOrderByNameAsc(true).orElse(new ArrayList<>()).stream()
				.map(it -> PersonResponse.entityToResponse(it,
						contactRepository.findByPersonId(it.getId()).orElse(new ArrayList<>()),
						contactHistoryRepository.countContactsTo(it.getId()),
						skillToTeachRepository.findByPersonId(it.getId()).orElse(new ArrayList<>()),
						skillToLearnRepository.findByPersonId(it.getId()).orElse(new ArrayList<>())))
				.collect(Collectors.toList());
	}

	public List<PersonResponse> listMentored() {
		return personRepository.findByWantToLearnOrderByNameAsc(true).orElse(new ArrayList<>()).stream()
				.map(it -> PersonResponse.entityToResponse(it,
						contactRepository.findByPersonId(it.getId()).orElse(new ArrayList<>()), 0L,
						skillToTeachRepository.findByPersonId(it.getId()).orElse(new ArrayList<>()),
						skillToLearnRepository.findByPersonId(it.getId()).orElse(new ArrayList<>())))
				.collect(Collectors.toList());
	}

	public PersonResponse save(PersonRequest personRequest) {
		Person person = personRepository.save(PersonRequest.requestToEntity(personRequest));
		final List<Contact> contacts = new ArrayList<>();
		personRequest.getContacts().forEach(contact -> {
			contacts.add(
					contactRepository.save(Contact.builder().person(person).value(contact.getValue())
							.type(contactTypeRepository.findByType(contact.getType())
									.orElseThrow(() -> new NotFoundException("Tipo de contato não encontrado")))
							.build()));
		});

		return PersonResponse.entityToResponse(person, contacts, 0L, new ArrayList<>(), new ArrayList<>());
	}

	public void delete(Integer id) {
		Person person = personRepository.findById(id)
				.orElseThrow(() -> new NotFoundException("Usuário não encontrado"));
		person.setActive(false);
		personRepository.save(person);
	}

	public List<PersonResponse> listMentorsBySkills(List<SkillRequest> skillsRequest) {
		if (skillsRequest == null || skillsRequest.isEmpty()) {
			return listMentor();
		}
		List<SkillToTeach> skills = skillToTeachRepository
				.findBySkillIn(skillsRequest.stream().map(it -> SkillRequest.toEntity(it)).collect(Collectors.toList()))
				.orElseThrow(() -> new NotFoundException("Sem mentores para a habilidade informada"));

		List<PersonResponse> response = new ArrayList<>();
		for (SkillToTeach skill : skills) {
			response.add(PersonResponse.entityToResponse(skill.getPerson(),
					contactRepository.findByPersonId(skill.getPerson().getId()).orElse(new ArrayList<>()), 0L,
					skillToTeachRepository.findByPersonId(skill.getPerson().getId()).orElse(new ArrayList<>()),
					skillToLearnRepository.findByPersonId(skill.getPerson().getId()).orElse(new ArrayList<>())));
		}

		return response;

	}

	public List<PersonResponse> listMentoredsByInterests(List<SkillRequest> skillsRequest) {
		if (skillsRequest == null || skillsRequest.isEmpty()) {
			return listMentored();
		}
		List<SkillToLearn> skills = skillToLearnRepository
				.findBySkillIn(skillsRequest.stream().map(it -> SkillRequest.toEntity(it)).collect(Collectors.toList()))
				.orElseThrow(() -> new NotFoundException("Sem pessoas interessadas na habilidade informada"));

		List<PersonResponse> response = new ArrayList<>();
		for (SkillToLearn skill : skills) {
			response.add(PersonResponse.entityToResponse(skill.getPerson(),
					contactRepository.findByPersonId(skill.getPerson().getId()).orElse(new ArrayList<>()), 0L,
					skillToTeachRepository.findByPersonId(skill.getPerson().getId()).orElse(new ArrayList<>()),
					skillToLearnRepository.findByPersonId(skill.getPerson().getId()).orElse(new ArrayList<>())));
		}

		return response;

	}
}
