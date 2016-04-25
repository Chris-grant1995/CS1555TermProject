import java.sql.Timestamp;
import java.util.Calendar;

/**
 * Created by christophergrant on 4/25/16.
 */
public class Testing {
    public static void main(String[] args){
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.MONTH, -4);
        Timestamp time = new Timestamp(cal.getTimeInMillis());
        System.out.println(time.toString());
    }
}
