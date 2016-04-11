import java.sql.SQLException;
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

            fs.createUser(name,email,dob);
            loggedIn();

        }
    }
    public static void loggedIn(){
        System.out.println("Welcome " + name + " You are logged in. Exiting");
    }
}
