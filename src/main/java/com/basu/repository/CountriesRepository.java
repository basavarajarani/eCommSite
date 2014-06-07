package com.basu.repository;

import java.util.Set;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Component;

import com.basu.schemas.Countries;

@Component
public interface CountriesRepository extends JpaRepository<Countries, Long> {

	@Query("select c from Country c")
	Set<Countries> findAllCountries();
}
