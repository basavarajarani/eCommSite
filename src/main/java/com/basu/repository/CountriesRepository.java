package com.basu.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Component;

import com.basu.schemas.Countries;

@Component
public interface CountriesRepository extends JpaRepository<Countries, Long> {

}
