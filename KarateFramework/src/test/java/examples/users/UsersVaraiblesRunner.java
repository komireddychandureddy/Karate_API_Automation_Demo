package examples.users;

import com.intuit.karate.junit5.Karate;

class UsersVaraiblesRunner {
    
    @Karate.Test
    Karate testUsers() {
        return Karate.run("variables").relativeTo(getClass());
    }    

}
