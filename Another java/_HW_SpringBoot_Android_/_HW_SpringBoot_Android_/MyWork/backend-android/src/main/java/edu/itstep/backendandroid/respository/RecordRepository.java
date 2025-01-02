package edu.itstep.backendandroid.respository;

import edu.itstep.backendandroid.entity.Record;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface RecordRepository extends JpaRepository<Record, Integer> {
    List<Record> findAllByUserId(int userId);
    List<Record> findAllByUser_Login(String login);
}
