import java.sql.Connection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet ("/AddMedicineServlet")
public class AddMedicineServlet extends HttpServlet {

            
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
String medicineName = request.getParameter("medicineName");
String medicineTime = request.getParameter("medicineTime");

    try{
        Connection con = DBConnection.getConnection();
        
        String sql = "INSERT INTO medicine(medicine_name,medicine_time)values(?,?)";
        
        PreparedStatement ps = con.prepareStatement(sql);
        
        ps.setString(1,medicineName);
        ps.setString(2,medicineTime);
        
        ps.executeUpdate();
        
        response.sendRedirect("medicine.jsp");
    }
    catch(Exception e){
        PrintWriter out = response.getWriter();
        out.println("<h2>ERROR :"+e+"</h2>");
    }
    
}
}
