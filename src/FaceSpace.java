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
    public void createUser(String name, String email,String dob  ) throws SQLException{
        System.out.println("Creating New User");
        String statement = "INSERT INTO Users VALUES(UsersSEQ.nextval,?, ?, ?, ?)";
        Calendar loginC = Calendar.getInstance();
        DateFormat login = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        preparedStatement = connection.prepareStatement(statement);
        preparedStatement.setString(1,name);
        preparedStatement.setString(2,email);
        java.util.Date d = new Date();
        try {
            d = login.parse(dob);
        } catch (ParseException e) {
            System.out.println("Invalid Date");
        }
        Timestamp birthday = new Timestamp(d.getTime());
        Timestamp time = new Timestamp(loginC.getTimeInMillis());
        preparedStatement.setTimestamp(3,birthday);
        preparedStatement.setTimestamp(4,time);
        //System.out.println("Executing Query: ");
        preparedStatement.executeUpdate();
        //System.out.println("Done");
    }
    public void initiateFriendship(int id1, int id2) throws SQLException{
        String statement = "INSERT INTO Friendships VALUES(?, ?, 0)";
        preparedStatement = connection.prepareStatement(statement);
        preparedStatement.setInt(1,id1);
        preparedStatement.setInt(2,id2);
        preparedStatement.executeUpdate();
    }
    public void establishFriendship(int id1, int id2) throws SQLException{
        String statement = "UPDATE Friendships SET confirmed = 1 WHERE senID = ? AND recID = ?";
        preparedStatement = connection.prepareStatement(statement);
        preparedStatement.setInt(1,id1);
        preparedStatement.setInt(2,id2);
        preparedStatement.executeUpdate();
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

<<<<<<< Updated upstream
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
    
    public void createGroup(String name, String description, int limit) throws SQLException{
        System.out.println("Creating new group");
        String statement = "INSERT INTO Groups VALUES(GroupSEQ.nextval,?, ?, ?)";
        preparedStatement = connection.prepareStatement(statement);
        preparedStatement.setString(1,name);
        preparedStatement.setString(2,description);
        preparedStatement.setInt(3, limit);
        preparedStatement.executeUpdate();
    }


    public void done(){
        try {
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
