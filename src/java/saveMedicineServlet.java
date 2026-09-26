import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/saveMedicineServlet")
public class saveMedicineServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        // Medicine name
        String medicineName =
                request.getParameter("medicineName");

        // Time from index.jsp
        String medicineTime =
                request.getParameter("medicineTime");

        // AM or PM from index.jsp
        String ampm =
                request.getParameter("ampm");

        response.setContentType("text/html");

        try {

            // Split time into hour and minute
            String[] timeParts =
                    medicineTime.split(":");

            int hour =
                    Integer.parseInt(timeParts[0]);

            String minute =
                    timeParts[1];


            // Convert PM to 24-hour format
            if (ampm.equals("PM") && hour != 12) {

                hour = hour + 12;

            }


            // Convert 12 AM to 00
            if (ampm.equals("AM") && hour == 12) {

                hour = 0;

            }


            // Final time
            String finalTime =
                    String.format(
                            "%02d:%s",
                            hour,
                            minute
                    );


            // Load MySQL driver
            Class.forName(
                    "com.mysql.cj.jdbc.Driver"
            );


            // Database connection
            Connection con =
                    DriverManager.getConnection(
                            "jdbc:mysql://localhost:3306/medicine_db",
                            "root",
                            ""
                    );


            // Insert medicine
            String sql =
                    "INSERT INTO medicine " +
                    "(medicine_name, medicine_time) " +
                    "VALUES (?, ?)";


            PreparedStatement ps =
                    con.prepareStatement(sql);


            ps.setString(1, medicineName);

            ps.setString(2, finalTime);


            ps.executeUpdate();


            // Close connection
            ps.close();
            con.close();


            // Redirect to your actual JSP file
            response.sendRedirect(
                    "medicine.jsp"
            );


        } catch (Exception e) {

            e.printStackTrace();

            response.getWriter().println(
                    "<h2>Database Error</h2>"
            );

            response.getWriter().println(
                    "<p>" +
                    e.getMessage() +
                    "</p>"
            );

        }
    }
}