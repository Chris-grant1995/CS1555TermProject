import java.sql.SQLException;

/**
 * Created by christophergrant on 4/10/16.
 */
public class Main {
    public static void main(String[] args) throws SQLException{
        FaceSpace fs = new FaceSpace();
        fs.createUser("Chris Grant", "crg50@pitt.edu", "1995-11-20 00:00:00");
        fs.createUser("Andrew Grant", "agrant112095@gmail.com", "1995-11-20 00:00:00");
        fs.testUser();
        fs.initiateFriendship(101,102);
        fs.testFriends();
        fs.establishFriendship(101,102);
        fs.testFriends();
        fs.done();
    }
}
