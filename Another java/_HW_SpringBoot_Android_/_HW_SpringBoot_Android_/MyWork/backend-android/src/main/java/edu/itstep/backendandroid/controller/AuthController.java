package edu.itstep.backendandroid.controller;

import com.sun.source.tree.BinaryTree;
import edu.itstep.backendandroid.entity.User;
import edu.itstep.backendandroid.entity.UserHelp;
import edu.itstep.backendandroid.respository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.function.EntityResponse;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


@RestController
public class AuthController {
    @Autowired
    private UserRepository userRepository;

    @PostMapping("/registerUser")
    public ResponseEntity<?> RegisterUser(@RequestBody User user){
        List<User> users = userRepository.findAll();
        for (User item : users) {
            if(item.getLogin().equals(user.getLogin())){
                return ResponseEntity.status(HttpStatus.CONFLICT).body("This user has already registered");
            }
        }
        userRepository.save(user);
        return ResponseEntity.ok(HttpStatus.OK);
    }

    @PostMapping("/signUser")
    public ResponseEntity<?> LoginUser(@RequestBody UserHelp userh){
        List<User> users = userRepository.findAll();

        for (User item : users) {
            if(item.getLogin().equals(userh.getLogin())){
                if(item.getPassword().equals(userh.getPassword())){
                    return ResponseEntity.ok(HttpStatus.OK);
                }
            }
        }
        return ResponseEntity.status(HttpStatus.CONFLICT).body("Incorrect data");
    }

}
