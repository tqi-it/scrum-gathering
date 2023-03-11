package br.com.agile.communit.mentorme.service;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.stereotype.Service;

import br.com.agile.communit.mentorme.exception.AlreadyExistsException;
import br.com.agile.communit.mentorme.exception.NotFoundException;
import br.com.agile.communit.mentorme.model.Person;
import br.com.agile.communit.mentorme.model.Skill;
import br.com.agile.communit.mentorme.model.SkillToLearn;
import br.com.agile.communit.mentorme.model.SkillToTeach;
import br.com.agile.communit.mentorme.repository.SkillRepository;
import br.com.agile.communit.mentorme.repository.SkillToLearnRepository;
import br.com.agile.communit.mentorme.repository.SkillToTeachRepository;
import br.com.agile.communit.mentorme.request.InterestRequest;
import br.com.agile.communit.mentorme.request.SkillRequest;
import br.com.agile.communit.mentorme.response.SkillResponse;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class SkillService {

	private final PersonService personService;

	private final SkillToLearnRepository skillToLearnRepository;
	private final SkillToTeachRepository skillToTeachRepository;
	private final SkillRepository skillRepository;

	public Skill findById(Integer skillId) {
		return skillRepository.findById(skillId).orElseThrow(() -> new NotFoundException("Habilidade não encontrado"));
	}

	public List<SkillResponse> findAll() {
		return skillRepository.findAll().stream().map(it -> SkillResponse.toResponse(it)).collect(Collectors.toList());
	}

	public SkillResponse save(SkillRequest skillRequest) {

		skillRepository.findByLabel(skillRequest.getName()).ifPresent(skill -> {
			throw new AlreadyExistsException("Habilidade já cadastrada");
		});

		Skill skill = Skill.builder().description(skillRequest.getDescription()).label(skillRequest.getName()).build();

		skillRepository.save(skill);

		return SkillResponse.builder().id(skill.getId()).description(skill.getDescription()).name(skill.getLabel())
				.build();
	}

	public SkillResponse addInterest(InterestRequest interestRequest) {

		Person person = personService.findById(interestRequest.getPersonId());
		Skill skill = findById(interestRequest.getSkillId());

		SkillToLearn skillToLearn = skillToLearnRepository
				.save(SkillToLearn.builder().person(person).skill(skill).build());

		return SkillResponse.builder().id(skillToLearn.getId()).description(skill.getDescription())
				.name(skill.getLabel()).build();
	}

	public SkillResponse addSkill(InterestRequest interestRequest) {

		Person person = personService.findById(interestRequest.getPersonId());
		Skill skill = findById(interestRequest.getSkillId());

		SkillToTeach skillToTeach = skillToTeachRepository
				.save(SkillToTeach.builder().person(person).skill(skill).build());

		return SkillResponse.builder().id(skillToTeach.getId()).description(skill.getDescription())
				.name(skill.getLabel()).build();
	}
}
