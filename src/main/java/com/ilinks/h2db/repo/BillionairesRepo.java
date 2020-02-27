package com.ilinks.h2db.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ilinks.h2db.model.Billionaire;

@Repository
public interface BillionairesRepo extends JpaRepository<Billionaire, Long> {

}
