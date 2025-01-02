package edu.itstep.backendandroid.respository;

import edu.itstep.backendandroid.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Integer> {
    User findUserByLogin(String login);

}
