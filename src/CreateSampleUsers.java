/**
 * Created by christophergrant on 4/6/16.
 */
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;
public class CreateSampleUsers {
    public static void main(String[] args){
        ArrayList<String> names = new ArrayList<>();
        ArrayList<String>friends = new ArrayList<>();
        String[] fnames = {"James","John", "Robert","Michael",
                "William","David", "Richard","Charles",
                "Joseph","Thomas","Christopher","Daniel",
                "Paul","Mark", "Donald","George",
                "Kenneth","Steven", "Edward","Brian"};

        String[] lnames = {"Smith","Johnson", "Williams","Jones",
                "Brown","Davis", "Miller","Wilson",
                "Moore","Taylor","Anderson","Thomas",
                "Jackson","White", "Harris","Martin",
                "Thompson","Garcia", "Martinez","Robinson"};
        Random rand = new Random();
        DateFormat login = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Calendar dobC = Calendar.getInstance();
        Calendar loginC = Calendar.getInstance();
        System.out.println(login.format(dobC.getTime()));
        dobC.add(Calendar.DATE, 1);
        System.out.println(login.format(dobC.getTime()));
        for(int i =0; i<100; i++ ){
            String statement = "INSERT INTO Users VALUES(" + i + ',';
            String fname = fnames[rand.nextInt(fnames.length)];
            String lname = lnames[rand.nextInt(lnames.length)];
            String name = fname + " " + lname;
            while(names.contains(name)){
                fname = fnames[rand.nextInt(fnames.length)];
                lname = lnames[rand.nextInt(lnames.length)];
                name = fname + " " + lname;
            }
            names.add(name);
            String email = fname+lname + "@gmail.com";
            statement+= "\'" + name + "\', \'" + email + "\', TIMESTAMP \'";
            statement += login.format(dobC.getTime()).toString() + "\',TIMESTAMP \'";
            statement+=login.format(loginC.getTime()).toString() + "\');";
            System.out.println(statement);
            dobC.add(Calendar.DATE, 1);
        }
        for(int i =0; i<200; i++){
            String statement = "INSERT INTO Friendships VALUES(";
            String f1 = rand.nextInt(names.size()) + "";
            String f2 = rand.nextInt(names.size()) + "";
            String friend = f1  + ", " + f2;
            while (friends.contains(friend) || f1.equals(f2)){
                 f1 = rand.nextInt(names.size()) + "";
                 f2 = rand.nextInt(names.size()) + "";
                 friend = f1  + ", " + f2;
            }
            friends.add(friend);
            friend = f2  + ", " + f1;
            friends.add(friend);
            Boolean confirmed = rand.nextBoolean();
            statement+= " " + friend + ", " + confirmed + " );";
            System.out.println(statement);
        }
    }
}
