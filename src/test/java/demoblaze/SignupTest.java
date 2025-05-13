package demoblaze;

import com.intuit.karate.junit5.Karate;

class SignupTest {
    @Karate.Test
    Karate testSignup() {
        return Karate.run("signup").relativeTo(getClass());
    }
}
