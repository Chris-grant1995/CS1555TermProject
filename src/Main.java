import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Scanner;

/**
 * Created by christophergrant on 4/10/16.
 */
public class Main {
    static FaceSpace fs;
    static Scanner scan;
    static int userID;
    static String name;
    public static void main(String[] args) throws SQLException{
        fs = new FaceSpace();
        scan = new Scanner(System.in);
        userID = 0;
        System.out.println("1. Login");
        System.out.println("2. Create Account");
        System.out.print("Enter your choice: ");
        String input = scan.nextLine();
        while(!input.equals("1") && !input.equals("2") ){
            System.out.print("Invalid Choice, Enter your choice again: ");
            input = scan.nextLine();
        }
        if(input.equals("1")){
            System.out.print("Enter Your Email to Login:");
            String email  = scan.nextLine();
            email = email.toLowerCase();
            userID = fs.getIDFromEmail(email);
            while(userID == 0 || new Integer(userID).equals(null)){
                System.out.print("Invalid Email:");
                email = scan.nextLine().toLowerCase();
                userID = fs.getIDFromEmail(email);
            }
            name = fs.getNameFromID(userID);
            loggedIn();

        }
        else{
            System.out.print("Enter your Name: ");
            name = scan.nextLine();

            System.out.print("Enter your email: ");
            String email = scan.nextLine().toLowerCase();
            while(!email.contains("@")){
                System.out.print("Enter your email: ");
                email = scan.nextLine().toLowerCase();
            }
            while (!fs.isEmailUnique(email)){
                System.out.print("Email Already in Use, enter another: ");
                email = scan.nextLine().toLowerCase();
            }
            email = email.toLowerCase();
            System.out.print("Enter your DOB (YYYY-MM-DD): ");
            String dob = (scan.nextLine()).trim() + " 00:00:00";

            while(!fs.createUser(name,email,dob)){
                System.out.println("Failure, Try again");
                System.out.print("Enter your Name: ");
                name = scan.nextLine();

                System.out.print("Enter your email: ");
                email = scan.nextLine().toLowerCase();
                while(!email.contains("@")){
                    System.out.print("Enter your email: ");
                    email = scan.nextLine().toLowerCase();
                }
                while (!fs.isEmailUnique(email)){
                    System.out.print("Email Already in Use, enter another: ");
                    email = scan.nextLine().toLowerCase();
                }
                email = email.toLowerCase();
                System.out.print("Enter your DOB (YYYY-MM-DD): ");
                dob = (scan.nextLine()).trim() + " 00:00:00";
            }
            userID = fs.getIDFromEmail(email);
            loggedIn();

        }
    }
    public static void loggedIn() throws SQLException{
        if(!fs.updateLastLogin(userID)){
            System.out.println("Error Logging in.");
            return;
        }
        ArrayList<String> choices = new ArrayList<String>();
        for(int i =1; i <9; i++  ){
            choices.add(i+"");
        }
        while(true){
            //fs.testUser();
            System.out.println("Welcome " + name + " You are logged in.");
            System.out.println("1. Show Friends");
            System.out.println("2. Send User Friend Request");
            System.out.println("3. Confirm Friend Request");
            System.out.println("4. View My Messages");
            System.out.println("5. Send Message");
            System.out.println("6. Create Group");
            System.out.println("7. Join Group");
            System.out.println("8. Logout");


            System.out.print("Enter your choice: ");
            String input = scan.nextLine();
            while(!choices.contains(input)){
                System.out.print("Enter your choice: ");
                input = scan.nextLine();
            }
            if(input.equals("1")){
                //Dan
                ArrayList<Integer> friends = fs.getFriendsUserIDs(userID);
                ArrayList<Integer> pending = fs.getPendingFriendsUserIDs(userID);
                //System.out.println(pending.get(0));
                for(int i =0; i< friends.size(); i++){
                    int id = friends.get(i);
                    System.out.println(fs.getUserFromUserID(id) + "\t Friends");
                }
                for(int i =0; i<pending.size(); i++){
                    int id = pending.get(i);
                    System.out.println(fs.getUserFromUserID(id) + "\t Pending");
                }
            }
            else if(input.equals("2")){
                System.out.print("Enter The email of the user you want to send the request to:");
                String email  = scan.nextLine();
                email = email.toLowerCase();
                int otherID = fs.getIDFromEmail(email);
                while(otherID == 0 || new Integer(otherID).equals(null)){
                    System.out.print("Invalid Email:");
                    email = scan.nextLine().toLowerCase();
                    otherID = fs.getIDFromEmail(email);
                }
                if(fs.notAlreadyFriends(userID,otherID)){
                    fs.initiateFriendship(userID,otherID);
                }
                else{
                    System.out.println("Already Friends");
                }
            }
            else if(input.equals("3")){
                System.out.print("Enter The email of the user you want to confirm: ");
                String email  = scan.nextLine();
                email = email.toLowerCase();
                int otherID = fs.getIDFromEmail(email);
                while(otherID == 0 || new Integer(otherID).equals(null)){
                    System.out.print("Invalid Email:");
                    email = scan.nextLine().toLowerCase();
                    otherID = fs.getIDFromEmail(email);
                }
                if(!fs.establishFriendship(otherID,userID)){
                    System.out.println("Try again");
                }
            }
            else if(input.equals("4")){
                fs.displayMessages(userID);
            }
            else if(input.equals("5")){
                System.out.print("Enter The email of the user you want to send a message to: ");
                String email  = scan.nextLine().toLowerCase();
                int otherID = fs.getIDFromEmail(email);
                while(otherID == 0 || new Integer(otherID).equals(null)){
                    System.out.print("Invalid Email:");
                    email = scan.nextLine().toLowerCase();
                    otherID = fs.getIDFromEmail(email);
                }
                System.out.print("Enter The subject of your message: ");
                String subj  = scan.nextLine();
                System.out.print("Enter The contents of your message: ");
                String message  = scan.nextLine();
                if(!fs.sendMessageToUser(subj,message,otherID,userID)){
                    System.out.println("Error Occurred");
                }

            }
            else if(input.equals("6")){
                System.out.print("Enter The name of the group you want to create: ");
                String name  = scan.nextLine().toLowerCase();
                int groupID = fs.getGroupIDFromName(name);
                while(groupID != -1){
                    System.out.print("Invalid Name:");
                    name = scan.nextLine().toLowerCase();
                    groupID = fs.getGroupIDFromName(name);
                }
                System.out.print("Enter The Description for your group: ");
                String desc  = scan.nextLine();
                System.out.print("Enter Max number of members in your group:  ");
                int  max  = scan.nextInt();
                if(!fs.createGroup(name,desc,max)){
                    System.out.println("Error Occurred");
                }
            }
            else if(input.equals("7")){
                System.out.print("Enter The name of the group you want to join: ");
                String name  = scan.nextLine().toLowerCase();
                int groupID = fs.getGroupIDFromName(name);
                while(groupID == -1){
                    System.out.print("Invalid Name:");
                    name = scan.nextLine().toLowerCase();
                    groupID = fs.getGroupIDFromName(name);
                }
                if(!fs.addToGroup(groupID,userID)){
                    System.out.println("Error Occurred");
                }
            }
            else if(input.equals("8")){
                fs.done();
                System.exit(0);
            }
        }
    }
}
