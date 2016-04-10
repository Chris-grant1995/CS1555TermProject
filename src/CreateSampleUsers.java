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
            String statement = "INSERT INTO Users VALUES(UsersSEQ.nextval,";
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
            String f1 = (rand.nextInt(names.size()) + 1) + "";
            String f2 = (rand.nextInt(names.size()) + 1) + "";
            String friend = f1  + ", " + f2;
            while (friends.contains(friend) || f1.equals(f2)){
                 f1 = rand.nextInt(names.size()) + "";
                 f2 = rand.nextInt(names.size()) + "";
                 friend = f1  + ", " + f2;
            }
            friends.add(friend);
            friend = f2  + ", " + f1;
            friends.add(friend);
            int confirmed = rand.nextInt(2);
            statement+= " " + friend + ", " + confirmed + " );";
            System.out.println(statement);
        }
        String[] groups = {"CS", "COE", "EE", "NeuroSci", "LibArts", "Com", "Nursing", "Rehab", "Mech E", "Premed"};
        for(int i =0; i<groups.length; i++){
            String statement = "INSERT INTO Groups VALUES(GroupSEQ.nextval," + "\'" + groups[i] + "\', \'";
            int maxMems = rand.nextInt(100);
            String desc = groups[i] + " Group";
            statement+= desc + "\', ";
            statement+= maxMems + ");";
            System.out.println(statement);
            ArrayList<Integer> members = new ArrayList<>();
            int totalmems = rand.nextInt(maxMems);
            //System.out.println(totalmems);
            for(int x =0; x<totalmems; x++){
                int num = i+1;
                String memtable = "INSERT INTO Membership VALUES(" + num +",";
                int user = rand.nextInt(100) + 1;
                while(members.contains(user)){
                    user = rand.nextInt(100) + 1;
                }
                members.add(user);
                memtable += user + ");";
                System.out.println(memtable);
            }

        }
        for(int i =0; i<300; i++){
            String statement = "INSERT INTO Messages VALUES(MsgSEQ.nextval,";
            int recID = rand.nextInt(100) + 1;
            int senID = rand.nextInt(100) + 1;
            while(recID == senID){
                recID = rand.nextInt(100) + 1;
                senID = rand.nextInt(100) + 1;
            }
            statement+= recID + ", "+ senID + ", \'";
            String sub = "Test Sub " + i;
            statement+= sub + "\', \'";
            String text = "Test text " + i;
            statement+= text + "\', TIMESTAMP \'";
            statement+=login.format(loginC.getTime()).toString() + "\');";
            System.out.println(statement);

        }
    }
}
