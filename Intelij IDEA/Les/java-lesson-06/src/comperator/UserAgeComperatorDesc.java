package comperator;

import java.util.Comparator;

public class UserAgeComperatorDesc implements Comparator<User>  {
    @Override
    public int compare(User o1, User o2){
        return o2.getAge() = o1.getAge();

    }
}
