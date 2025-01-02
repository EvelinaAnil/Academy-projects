package edu.itstep.backendandroid.controller;

import edu.itstep.backendandroid.entity.Record;
import edu.itstep.backendandroid.entity.User;
import edu.itstep.backendandroid.respository.RecordRepository;
import edu.itstep.backendandroid.respository.UserRepository;
import org.apache.coyote.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class RecordController {
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RecordRepository recordRepository;

    @GetMapping("/records")
    public List<Record> getAllRecords(){
        return recordRepository.findAll();
    }

    @GetMapping("/records/{id}")
    public List<Record> getAllRecordsByUserId(@PathVariable int id){
        return recordRepository.findAllByUserId(id);
    }

    @GetMapping("/record/{id}")
    public ResponseEntity<Record> getRecordById(@PathVariable int id){
        Record record = recordRepository.findById(id).orElse(null);
        if(record != null){
            return ResponseEntity.ok(record);
        }
        else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
        }
    }

    @GetMapping("/recordsByLogin/{login}")
    public List<Record> getRecordsByUserLogin(@PathVariable String login){
        return recordRepository.findAllByUser_Login(login);
    }

    @PostMapping("/addRecord")
    public ResponseEntity<?> createRecord(@RequestBody Record record) {
        User user = userRepository.findUserByLogin(record.getUser().getLogin());
        if (user != null) {
            record.setUser(user);
            Record recordAdded = recordRepository.save(record);
            return ResponseEntity.ok(recordAdded.getId());
        } else {
            return ResponseEntity.badRequest().body("error adding");
        }
    }

    @PutMapping("/updateRecord/{id}")
    public ResponseEntity<?> updateRecord(@PathVariable int id, @RequestBody Record updateRecord){
        Record recordToUpdate = recordRepository.findById(id).orElse(null);
        if(recordToUpdate != null){
            recordToUpdate.setRecordName(updateRecord.getRecordName());
            recordToUpdate.setDescription(updateRecord.getDescription());
            recordRepository.save(recordToUpdate);
            return ResponseEntity.ok("updated");
        }
        else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("nothing to update");
        }
    }

    @DeleteMapping("/deleteRecord/{id}")
    public ResponseEntity<?> deleteRecord(@PathVariable int id){
        Record record = recordRepository.findById(id).orElse(null);
        if(record != null){
            recordRepository.deleteById(id);
            return ResponseEntity.ok("deleted");
        }
        else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("nothing to delete");
        }
    }



}
