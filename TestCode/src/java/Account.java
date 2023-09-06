import java.util.Arrays;

public class Account {
    private String username;
    private String password;
    private String gender;
    private String role;
    private String[] hobbies;

    public Account(String username, String password, String gender, String role, String[] hobbies) {
        this.username = username;
        this.password = password;
        this.gender = gender;
        this.role = role;
        this.hobbies = hobbies;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String[] getHobbies() {
        return hobbies;
    }

    public void setHobbies(String[] hobbies) {
        this.hobbies = hobbies;
    }

    @Override
    public String toString() {
        return "Account [username=" + username + ", password=" + password + ", gender=" + gender + ", role=" + role
                + ", hobbies=" + Arrays.toString(hobbies) + "]";
    }
}
