/**
 * Created by christophergrant on 4/10/16.
 */
import java.sql.*;  //import the file containing definitions for the parts
import java.text.ParseException;
import java.text.*;
import java.lang.*;
import java.util.*;
import java.util.Date;

import oracle.jdbc.*;
//import com.sun.org.apache.xpath.internal.operations.String;

import javax.sound.midi.SysexMessage;

public class FaceSpace {
    Connection connection;
    PreparedStatement preparedStatement;
    ResultSet resultSet;
    String username;
    String password;
    public FaceSpace() throws SQLException{
        username = "crg50";
        password = "3943007";
        DriverManager.registerDriver (new oracle.jdbc.driver.OracleDriver());
        String url = "jdbc:oracle:thin:@class3.cs.pitt.edu:1521:dbclass";
        connection = DriverManager.getConnection(url, username, password);
        System.out.println("Sucessfully Connected");
    }


    public void runDriver() throws SQLException {
        String[] fnames = {"Jordon", "Bobby", "Michelle", "Andrea",
        "Chris", "Elai", "George"};

        String[] lnames = {"Grant", "Rappoport", "Kindler", "Sammson", "Bobbyfishyhead",
        "Liquamidic","Saucypan", "Readingrainbow", "Joshua", "Herring"};

        Random rand = new Random();
        String fnameOne = fnames[rand.nextInt(fnames.length)];
        String lnameOne = lnames[rand.nextInt(lnames.length)];
        String emailOne = fnameOne.toLowerCase() + "." + lnameOne.toLowerCase() + "@gmail.com";

        System.out.println("CREATING USER 1: " + emailOne);
        createUser(fnameOne + " " + lnameOne, emailOne, "1995-03-04 00:00:00");
        System.out.println();

        int userOneID = getIDFromEmail(emailOne);

        String fnameTwo = fnames[rand.nextInt(fnames.length)];
        String lnameTwo = lnames[rand.nextInt(lnames.length)];
        String emailTwo = fnameTwo.toLowerCase() + "." + lnameTwo.toLowerCase() + "@gmail.com";

        System.out.println("CREATING USER 2: " + emailTwo);
        createUser(fnameTwo + " " + lnameTwo, emailTwo, "1995-03-04 00:00:00");
        int userTwoID = getIDFromEmail(emailTwo);
        System.out.println();


        System.out.println("Establishing Friendship between Robert Jones and User 2");
        int robertUserID = getIDFromEmail("robertjones@gmail.com");
        initiateFriendship(robertUserID, userTwoID);
        establishFriendship(userTwoID, robertUserID);
        System.out.println();

        System.out.println("User 1 searching for Users named George");
        chrisSearch("George");
        System.out.println();

        System.out.println("User 1 calling three degrees on Robert Jones");
        threeDegrees(userOneID, robertUserID);
        System.out.println();

        System.out.println("User 1 sending Friendship request to user 2");
        initiateFriendship(userOneID, userTwoID);
        System.out.println();


        System.out.println("Printing Friends / Invitations as User 2");
        ArrayList<Integer> friends = getFriendsUserIDs(userTwoID);
        ArrayList<Integer> pending = getPendingFriendsUserIDs(userTwoID);
        for(int i =0; i< friends.size(); i++){
            int id = friends.get(i);
            System.out.println(getUserFromUserID(id) + "\t Friends");
        }
        for(int i =0; i<pending.size(); i++){
            int id = pending.get(i);
            System.out.println(getUserFromUserID(id) + "\t Pending");
        }
        System.out.println();

        System.out.println("User 2 Confirming User 1 friendship request.");
        establishFriendship(userTwoID, userOneID);
        System.out.println();

        System.out.println("Printing Friends / Invitations as User 2 after friendship established.");
        friends = getFriendsUserIDs(userTwoID);
        pending = getPendingFriendsUserIDs(userTwoID);
        for(int i =0; i< friends.size(); i++){
            int id = friends.get(i);
            System.out.println(getUserFromUserID(id) + "\t Friends");
        }
        for(int i =0; i<pending.size(); i++){
            int id = pending.get(i);
            System.out.println(getUserFromUserID(id) + "\t Pending");
        }
        System.out.println();


        System.out.println("User 1 sending messages to User 2");
        sendMessageToUser("Message 1", "THIS MESSAGE IS FROM USER 1 TO USER 2", userTwoID, userOneID);
        sendMessageToUser("Message 2", "THIS IS ANOTHER MESSAGE THAT IS FROM USER 1 TO USER 2", userTwoID, userOneID);
        sendMessageToUser("Message 3", "THIS IS THE FINAL MESSAGE FROM USER 1 TO USER 2", userTwoID, userOneID);


        System.out.println("User 2 Viewing Message Inbox");
        displayMessages(userTwoID);
        System.out.println();


        System.out.println("User 1 Is Creating a Group");
        createGroup("Cool Group", "Group for User 1 and User 2", 10);
        int groupID = getGroupIDFromName("Cool Group");
        System.out.println("GROUP ID: " + Integer.toString(groupID));
        System.out.println();

        System.out.println("User 1 adding User 2 to groups");
        addToGroup(groupID, userTwoID);
        System.out.println();

    }

    public boolean createUser(String name, String email,String dob) throws SQLException{
        try {
            System.out.println("Creating New User");
            String statement = "INSERT INTO Users VALUES(UsersSEQ.nextval,?, ?, ?, ?)";
            Calendar loginC = Calendar.getInstance();
            DateFormat login = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            preparedStatement = connection.prepareStatement(statement);
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, email);
            java.util.Date d = new Date();

            d = login.parse(dob);

            //System.out.println("Invalid Date");

            Timestamp birthday = new Timestamp(d.getTime());
            Timestamp time = new Timestamp(loginC.getTimeInMillis());
            preparedStatement.setTimestamp(3, birthday);
            preparedStatement.setTimestamp(4, time);
            //System.out.println("Executing Query: ");
            preparedStatement.executeUpdate();
            //System.out.println("Done");
            return true;
        }
        catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }
    public void initiateFriendship(int id1, int id2) throws SQLException{
        String statement = "INSERT INTO Friendships VALUES(?, ?, 0, NULL)";
        preparedStatement = connection.prepareStatement(statement);
        preparedStatement.setInt(1,id1);
        preparedStatement.setInt(2,id2);
        preparedStatement.executeUpdate();
    }
    public boolean establishFriendship(int id1, int id2) throws SQLException{
        try {
            String statement = "UPDATE Friendships SET confirmed = 1, confirmedTime = ? WHERE senID = ? AND recID = ?";
            preparedStatement = connection.prepareStatement(statement);
            Timestamp time = new Timestamp(System.currentTimeMillis());
            preparedStatement.setTimestamp(1,time);
            preparedStatement.setInt(2, id1);
            preparedStatement.setInt(3, id2);
            preparedStatement.executeUpdate();
            return true;
        }
        catch (Exception e){
            return false;
        }
    }
    public void testUser()throws SQLException{
        System.out.println("Running TestUser");
        String statement = "SELECT * FROM Users";
        preparedStatement = connection.prepareStatement(statement);
        resultSet = preparedStatement.executeQuery();
        while (resultSet.next()){
            System.out.println("User ID \t Name");
            System.out.println(resultSet.getString(1) + "\t" + resultSet.getString(2));
        }
    }
    public void testFriends() throws SQLException{
        System.out.println("Running TestFriends");
        String statement = "SELECT * FROM Friendships";
        preparedStatement = connection.prepareStatement(statement);
        resultSet = preparedStatement.executeQuery();
        while (resultSet.next()){
            System.out.println("Sender ID \t Rec ID \t Confirmed");
            System.out.println(resultSet.getInt(1) + "\t" + resultSet.getInt(2) + "\t" + resultSet.getInt(3) );
        }
    }
    public int getIDFromEmail(String email) throws SQLException{
        String statement = "SELECT * FROM Users WHERE email = ?";
        preparedStatement = connection.prepareStatement(statement);
        preparedStatement.setString(1,email);
        resultSet = preparedStatement.executeQuery();
        while(resultSet.next()){
           return resultSet.getInt(1);
        }
        return 0;
    }
    public String getNameFromID(int id) throws SQLException{
        String statement = "SELECT * FROM Users WHERE userID = ?";
        preparedStatement = connection.prepareStatement(statement);
        preparedStatement.setInt(1,id);
        resultSet = preparedStatement.executeQuery();
        while(resultSet.next()){
            return resultSet.getString(2);
        }
        return null;
    }
    public String getEmailFromID(int id) throws SQLException{
        String statement = "SELECT * FROM Users WHERE userID = ?";
        preparedStatement = connection.prepareStatement(statement);
        preparedStatement.setInt(1,id);
        resultSet = preparedStatement.executeQuery();
        while(resultSet.next()){
            return resultSet.getString(3);
        }
        return null;
    }
    public boolean isEmailUnique(String email) throws SQLException{
        boolean flag = true;
        String statement = "SELECT * FROM Users WHERE email = ?";
        preparedStatement = connection.prepareStatement(statement);
        preparedStatement.setString(1,email);
        resultSet = preparedStatement.executeQuery();
        while(resultSet.next()){
            flag = false;
        }
        return flag;
    }
    public boolean notAlreadyFriends(int id1, int id2) throws SQLException{
        boolean flag = true;
        String statement = "SELECT * FROM Friendships WHERE (senID = ? AND recID = ?) OR (senID = ? AND recID = ?)";
        preparedStatement = connection.prepareStatement(statement);
        preparedStatement.setInt(1,id1);
        preparedStatement.setInt(2,id2);
        preparedStatement.setInt(3,id2);
        preparedStatement.setInt(4,id1);

        resultSet = preparedStatement.executeQuery();
        while(resultSet.next()){
            flag = false;
        }
        return flag;

    }

    public ArrayList<Integer> getPendingFriendsUserIDs(int userID) throws SQLException {
        String statement = "SELECT * FROM Friendships WHERE (senID = ?) OR (recID = ?)";
        preparedStatement = connection.prepareStatement(statement);
        preparedStatement.setInt(1, userID);
        preparedStatement.setInt(2,userID);
        resultSet = preparedStatement.executeQuery();

        ArrayList<Integer> results = new ArrayList<Integer>();
        while (resultSet.next()) {
            if  (resultSet.getInt(3) == 1) {
                continue;
            }
            int senID = resultSet.getInt(1);
            int recID = resultSet.getInt(2);

            results.add((senID == userID) ? recID : senID);
        }

        return results;
    }

    public ArrayList<Integer> getFriendsUserIDs(int userID) throws SQLException {
        String statement = "SELECT * FROM Friendships WHERE (senID = ?) OR (recID = ?)";
        preparedStatement = connection.prepareStatement(statement);
        preparedStatement.setInt(1, userID);
        preparedStatement.setInt(2,userID);
        resultSet = preparedStatement.executeQuery();

        ArrayList<Integer> results = new ArrayList<Integer>();
        while (resultSet.next()) {
            if  (resultSet.getInt(3) != 1) {
                continue;
            }
            int senID = resultSet.getInt(1);
            int recID = resultSet.getInt(2);

            results.add((senID == userID) ? recID : senID);
        }

        return results;
    }
    public boolean updateLastLogin(int userID){
        try{
            String statement  = "UPDATE Users Set lastLogin = ? WHERE userID = ?";
            preparedStatement = connection.prepareStatement(statement);
            //Calendar loginC = Calendar.getInstance();
            Timestamp time = new Timestamp(System.currentTimeMillis());

            preparedStatement.setTimestamp(1,time);
            preparedStatement.setInt(2,userID);
            preparedStatement.executeUpdate();
            return true;

        }
        catch (Exception e){
            return false;
        }
    }
    
    public boolean createGroup(String name, String description, int limit) throws SQLException{
        System.out.println("Creating new group");
        try{
            String statement = "INSERT INTO Groups VALUES(GroupSEQ.nextval,?, ?, ?)";
            preparedStatement = connection.prepareStatement(statement);
            preparedStatement.setString(1,name);
            preparedStatement.setString(2,description);
            preparedStatement.setInt(3, limit);
            preparedStatement.executeUpdate();
            return true;
        }catch (Exception e){
            return false;
        }

    }
    public boolean addToGroup(int groupID, int userID){
        try{
            String statement = "SELECT count(userID), groupID from Membership WHERE groupID = ? GROUP BY groupID";
            preparedStatement = connection.prepareStatement(statement);
            preparedStatement.setInt(1,groupID);
            resultSet = preparedStatement.executeQuery();
            int numOfMems = -1;
            while(resultSet.next()){
                numOfMems = resultSet.getInt(1);
            }
            statement = "SELECT maxMems FROM Groups where groupID = ?";
            preparedStatement = connection.prepareStatement(statement);
            preparedStatement.setInt(1,groupID);
            resultSet = preparedStatement.executeQuery();
            int maxMems = -1;
            while(resultSet.next()){
                maxMems = resultSet.getInt(1);
            }
            if(numOfMems < maxMems){
                statement = "INSERT INTO Membership VALUES(?,?)";
                preparedStatement = connection.prepareStatement(statement);
                preparedStatement.setInt(1,groupID);
                preparedStatement.setInt(2,userID);
                preparedStatement.executeUpdate();
            }
            else{
                return false;
            }



            return true;
        }catch (Exception e){
            return false;
        }
    }
    public int getGroupIDFromName(String name ){
        int ID = -1;
        try{
            String statement = "SELECT groupID from Groups WHERE name = ?";
            preparedStatement = connection.prepareStatement(statement);
            preparedStatement.setString(1,name);
            resultSet = preparedStatement.executeQuery();

            while(resultSet.next()){
                ID = resultSet.getInt(1);
            }
            return ID;
        }catch (Exception e){
            return -1;
        }

    }

    public boolean sendMessageToUser(String subj, String body, int rec, int send){
        try{
            String statement = "INSERT INTO Messages VALUES(MsgSEQ.nextval,?,?,?,?,?,0)";
            preparedStatement = connection.prepareStatement(statement);
            preparedStatement.setInt(1,rec);
            preparedStatement.setInt(2,send);
            preparedStatement.setString(3,subj);
            preparedStatement.setString(4,body);
            Timestamp time = new Timestamp(System.currentTimeMillis());
            preparedStatement.setTimestamp(5,time);
            preparedStatement.executeUpdate();

            return true;
        }
        catch (Exception e){
            return false;
        }

    }
    public boolean displayMessages(int userID){
        try{
            String statement = "SELECT * FROM Messages WHERE recID = ?";
            preparedStatement = connection.prepareStatement(statement);
            preparedStatement.setInt(1,userID);
            resultSet = preparedStatement.executeQuery();
            ArrayList<String> subjMsg = new ArrayList<String>();
            ArrayList<Integer> emailIDs = new ArrayList<Integer>();
            System.out.println("From \t Subj \t Message ");
            while(resultSet.next()){
                int sendID = resultSet.getInt(3);
                String subj = resultSet.getString(4);
                String msg = resultSet.getString(5);
                subjMsg.add("\t" + subj + "\t" + msg);
                emailIDs.add(sendID);
            }
            for(int i =0; i<subjMsg.size(); i++){
                String email = getEmailFromID(emailIDs.get(i));
                System.out.println(email + subjMsg.get(i));
            }
            return true;
        }catch (Exception e){
            return false;
        }
    }


    public void done(){
        try {
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public int threeDegrees(int userID1, int userID2){
        try{

            String statement = "SELECT * FROM Friendships where confirmed = 1";
            preparedStatement = connection.prepareStatement(statement);

            resultSet = preparedStatement.executeQuery();
            //Graph g = new Graph(1000);
            EdgeWeightedDigraph g = new EdgeWeightedDigraph(1000);
            while(resultSet.next()){
                int id1 = resultSet.getInt(1);
                int id2 = resultSet.getInt(2);

                g.addEdge(new DirectedEdge(id1,id2,0,0));
                g.addEdge(new DirectedEdge(id2,id1,0,0));
            }
            DijkstraSP d = new DijkstraSP(g,userID1);
            Iterator<DirectedEdge> path = d.pathTo(userID2).iterator();
            ArrayList<Integer> paths = new ArrayList<Integer>();
            int counter = 0;
            while(path.hasNext()){
                DirectedEdge t = path.next();
                if(counter ==0 ){
                    paths.add(t.from());
                }
                paths.add(t.to());
                counter++;
            }
            paths.remove(0);
            paths.remove(0);
            paths.remove(paths.size()-1);
            if(paths.size() < 4){

                System.out.print(getNameFromID(userID1) + "--> ");
                for(int i =0; i<paths.size()-1; i++){
                    System.out.print(getNameFromID(paths.get(i)) + "--> ");
                }
                System.out.println(getNameFromID(userID2));
                return 1;
            }
            else{
                return 0;
            }

        }
        catch (Exception e){
            //System.out.println(e.getMessage());
            return -1;
        }
    }


    //
    // USER SEARCH
    //

    public ArrayList<Integer> searchForUsersWithTerm(String searchTerm) throws SQLException {
        String[] terms =  searchTerm.split("\\s+");

        ArrayList<Integer> results = new ArrayList<Integer>();
        Set<Integer> hs = new HashSet<Integer>();

        for (String s : terms) {
            hs.addAll(getUserIDsWithNameOrEmail(s));
        }

        results.addAll(hs);
        return results;
    }


    private ArrayList<Integer> getUserIDsWithNameOrEmail(String term) throws SQLException {
        String statement = "SELECT * FROM Users WHERE name = ? OR email = ?";
        preparedStatement = connection.prepareStatement(statement);
        preparedStatement.setString(1, term + "%");
        preparedStatement.setString(2, term + "%");
        resultSet = preparedStatement.executeQuery();

        ArrayList<Integer> results = new ArrayList<Integer>();
        while (resultSet.next()) {
            results.add(resultSet.getInt(1));
        }

        return results;
    }

    private ArrayList<Integer> getUserIDsWithEmail(String email) throws SQLException {
        String statement = "SELECT * FROM Users WHERE email = ?";
        preparedStatement = connection.prepareStatement(statement);
        preparedStatement.setString(1, "%" + email + "%");
        resultSet = preparedStatement.executeQuery();

        ArrayList<Integer> results = new ArrayList<Integer>();
        while (resultSet.next()) {
            results.add(resultSet.getInt(3));
        }

        return results;
    }
    public String getUserFromUserID(int userID) throws SQLException {
        String statement = "SELECT * FROM Users WHERE userID = ?";
        preparedStatement = connection.prepareStatement(statement);
        preparedStatement.setInt(1, userID);
        resultSet = preparedStatement.executeQuery();
        String result = "";

        while (resultSet.next()) {
            result = resultSet.getInt(1) + "\t" + resultSet.getString(2) + "\t" + resultSet.getString(3) +"\t" + resultSet.getString(4);
        }

        return result;
    }

    public boolean chrisSearch(String searchTerm){
        searchTerm = searchTerm.toLowerCase();
        try{

           String [] terms = searchTerm.split(" ");
            for(int i =0; i< terms.length; i++){
                System.out.println("Results found for " + terms[i]);
                String statement = "SELECT * FROM Users";
                preparedStatement = connection.prepareStatement(statement);
                resultSet = preparedStatement.executeQuery();
                while(resultSet.next()){
                    String userID = resultSet.getString(1);
                    String name = resultSet.getString(2);
                    String email = resultSet.getString(3);
                    if(userID.toLowerCase().contains(terms[i]) || name.toLowerCase().contains(terms[i]) || email.toLowerCase().contains(terms[i]) ){
                        System.out.println(userID + "\t" +name + "\t" +email + "\t" );
                    }
                }

            }
           return true;
        }
        catch (Exception e){
            return false;
        }
    }
    public boolean deleteAccount(int userID)throws SQLException{
        try{
            String statement = "DELETE FROM Users where userID = ? ";
            preparedStatement = connection.prepareStatement(statement);
            preparedStatement.setInt(1, userID);
            preparedStatement.executeUpdate();
            return true;
        }
        catch (Exception e){
            return false;
        }
    }

    public boolean topMessages(int users, int months){
        try {
            Calendar cal = Calendar.getInstance();
            cal.add(Calendar.MONTH, -months);
            Timestamp time = new Timestamp(cal.getTimeInMillis());

            HashMap<Integer,Integer> userIDs = new HashMap<Integer, Integer>();
            String statement = "SELECT recID, count(msgID) FROM Messages WHERE dateSent >= ? GROUP BY recID";
            preparedStatement = connection.prepareStatement(statement);
            preparedStatement.setTimestamp(1,time);
            resultSet = preparedStatement.executeQuery();
            //System.out.println("REC ID \t # RECIEVED");
            while(resultSet.next()){
                int id = resultSet.getInt(1);
                int count = resultSet.getInt(2);
                //System.out.println(id + "\t" + count);
                userIDs.put(id,count);
            }
            statement = "SELECT senID, count(msgID) FROM Messages WHERE dateSent >= ? GROUP BY senID";
            preparedStatement = connection.prepareStatement(statement);
            preparedStatement.setTimestamp(1,time);
            resultSet = preparedStatement.executeQuery();
            //System.out.println("Sen ID \t # RECIEVED");
            while(resultSet.next()){
                int id = resultSet.getInt(1);
                int count = resultSet.getInt(2);
                //System.out.println(id + "\t" + count);
                int temp =0;
                if(userIDs.containsKey(id))
                    temp = userIDs.get(id);
                userIDs.put(id,temp+count);
            }
            System.out.println("Top Messages:");
            for(int i =0; i<users; i++){
                int maxVal = -1;
                int maxKey = -1;
                Iterator<Integer> keys = userIDs.keySet().iterator();
                while(keys.hasNext()){
                    int tempKey = keys.next();
                    int tempVal = userIDs.get(tempKey);
                    if(tempVal > maxVal){
                        maxVal = tempVal;
                        maxKey = tempKey;
                    }
                }
                System.out.println(getNameFromID(maxKey) + "\t" + maxVal);
                userIDs.remove(maxKey);
            }
            return true;
        }
        catch (Exception e){
            //e.printStackTrace();
            return false;
        }
    }


}
