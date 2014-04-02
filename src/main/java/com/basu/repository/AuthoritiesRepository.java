package com.basu.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Component;

import com.basu.schemas.Authorities;

@Component
public interface AuthoritiesRepository extends JpaRepository<Authorities, String> {

}
