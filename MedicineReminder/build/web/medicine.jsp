<%@page import="java.sql.*"%>  
<%@page contentType="text/html" pageEncoding="UTF-8"%>  
  
<!DOCTYPE html>  
<html>  
  
<head>  
  
    <meta http-equiv="Content-Type"  
          content="text/html; charset=UTF-8">  
  
    <title>My Medicines</title>  
  
    <link rel="stylesheet"  
          href="css/style.css">  
  
</head>  
  
  
<body>  
  
  
<div class="medicine-page">  
  
  
    <!-- Logo -->  
  
    <div class="logo">  
  
        <img src="images/capsule.jpg"  
             alt="Medicine">  
  
    </div>  
  
  
    <!-- Heading -->  
  
    <h1>  
        💊 My Medicines  
    </h1>  
  
  
    <p class="subtitle">  
        Your scheduled medicines  
    </p>  
  
  
    <!-- Medicine Table -->  
  
    <table>  
  
        <tr>  
  
            <th>Medicine</th>  
  
            <th>Time</th>  
  
            <th>Status</th>  
  
            <th>Action</th>  
  
        </tr>  
  
  
<%  
  
    try {  
  
        // Load MySQL Driver  
  
        Class.forName(  
            "com.mysql.cj.jdbc.Driver"  
        );  
  
  
        // Connect to database  
  
        Connection con =  
            DriverManager.getConnection(  
                "jdbc:mysql://localhost:3306/medicine_db",  
                "root",  
                ""  
            );  
  
  
        // Create statement  
  
        Statement st =  
            con.createStatement();  
  
  
        // Fetch medicines  
  
        ResultSet rs =  
            st.executeQuery(  
                "SELECT * FROM medicine"  
            );  
  
  
        // Read every medicine  
  
        while(rs.next()) {  
  
            // Get medicine name  
  
            String medicineName =  
                rs.getString("medicine_name");  
  
  
            // Get medicine time from database  
  
            String time24 =  
                rs.getString("medicine_time");  
  
  
            // Convert database time  
            // from 24-hour to 12-hour  
  
            String[] timeParts =  
                time24.split(":");  
  
            int hour =  
                Integer.parseInt(timeParts[0]);  
  
            String minute =  
                timeParts[1];  
  
  
            String ampm;  
  
  
            if (hour >= 12) {  
  
                ampm = "PM";  
  
            } else {  
  
                ampm = "AM";  
  
            }  
  
  
            int displayHour = hour;  
  
  
            if (displayHour == 0) {  
  
                displayHour = 12;  
  
            }  
            else if (displayHour > 12) {  
  
                displayHour =  
                    displayHour - 12;  
  
            }  
  
  
            String displayTime =  
                String.format(  
                    "%02d:%s %s",  
                    displayHour,  
                    minute,  
                    ampm  
                );  
  
%>  
  
  
        <tr>  
  
            <!-- Medicine Name -->  
  
            <td>  
  
                <%= medicineName %>  
  
            </td>  
  
  
            <!-- Medicine Time -->  
  
            <td>  
  
                <!--  
                    This is visible to user  
                    Example: 07:30 PM  
                -->  
  
                <span class="display-time">  
  
                    <%= displayTime %>  
  
                </span>  
  
  
                <!--  
                    This is used by JavaScript  
                    Example: 19:30  
                -->  
  
                <span class="actual-time"  
                      style="display:none;">  
  
                    <%= time24 %>  
  
                </span>  
  
            </td>  
  
  
            <!-- Status -->  
  
            <td>  
  
                <span class="active">  
  
                    Scheduled  
  
                </span>  
  
            </td>  
  
  
            <!-- Delete -->  
  
            <td>  
  
                <a href="deleteMedicineServlet?id=<%= rs.getInt("id") %>">  
  
                    Delete  
  
                </a>  
  
            </td>  
  
        </tr>  
  
  
<%  
  
        }  
  
  
        // Close database resources  
  
        rs.close();  
  
        st.close();  
  
        con.close();  
  
  
    }  
  
    catch (Exception e) {  
  
%>  
  
  
        <tr>  
  
            <td colspan="4">  
  
                <b>Database Error:</b>  
  
                <%= e.getMessage() %>  
  
            </td>  
  
        </tr>  
  
  
<%  
  
    }  
  
%>  
  
  
    </table>  
  
  
    <br>  
  
  
    <!-- Add Medicine Button -->  
  
    <a href="index.jsp"  
       class="view-button">  
  
        + Add New Medicine  
  
    </a>  
  
  
    <br><br>  
  
  
    <!-- ========================= -->  
    <!-- ENABLE NOTIFICATION BUTTON -->  
    <!-- ========================= -->  
  
    <button type="button"  
            onclick="enableNotifications()">  
  
        🔔 Enable Notifications  
  
    </button>  
  
  
</div>  
  
  
  
<!-- ========================= -->  
<!-- MEDICINE REMINDER SCRIPT -->  
<!-- ========================= -->  
  
<script>  
  
  
let notifiedMedicines = {};  
  
  
  
// =====================================  
// ENABLE BROWSER NOTIFICATIONS  
// =====================================  
  
function enableNotifications() {  
  
  
    // Check browser support  
  
    if (!("Notification" in window)) {  
  
  
        alert(  
            "Your browser does not support notifications."  
        );  
  
  
        return;  
  
    }  
  
  
  
    // Ask permission  
  
    Notification.requestPermission()  
  
        .then(function(permission) {  
  
  
            // Permission granted  
  
            if (permission === "granted") {  
  
  
                alert(  
                    "✅ Notifications enabled successfully!"  
                );  
  
  
            }  
  
  
  
            // Permission denied  
  
            else if (permission === "denied") {  
  
  
                alert(  
                    "❌ Notifications are blocked. Please allow notifications in browser settings."  
                );  
  
  
            }  
  
  
  
            // Permission not selected  
  
            else {  
  
  
                alert(  
                    "Notification permission was not selected."  
                );  
  
  
            }  
  
  
        });  
  
  
}  
  
  
  
  
// =====================================  
// CHECK MEDICINE TIME  
// =====================================  
  
function checkMedicineTime() {  
  
  
  
    // Current date and time  
  
    const now = new Date();  
  
  
  
    // Current hour  
  
    let currentHour =  
  
        String(now.getHours())  
  
        .padStart(2, '0');  
  
  
  
    // Current minute  
  
    let currentMinute =  
  
        String(now.getMinutes())  
  
        .padStart(2, '0');  
  
  
  
    // Current time in 24-hour format  
  
    let currentTime =  
  
        currentHour + ":" +  
  
        currentMinute;  
  
  
  
  
    // Get all table rows  
  
    const rows =  
  
        document.querySelectorAll(  
  
            "table tr"  
  
        );  
  
  
  
  
    // Check every row  
  
    rows.forEach(function(row) {  
  
  
  
        // Get cells  
  
        const cells =  
  
            row.querySelectorAll("td");  
  
  
  
  
        // Skip header row  
  
        if (cells.length < 2) {  
  
  
            return;  
  
  
        }  
  
  
  
  
        // Medicine name  
  
        let medicineName =  
  
            cells[0]  
  
            .innerText  
  
            .trim();  
  
  
  
  
        // Get hidden 24-hour time  
  
        let timeElement =  
  
            cells[1]  
  
            .querySelector(".actual-time");  
  
  
  
  
        // If time is not found  
  
        if (!timeElement) {  
  
  
            return;  
  
  
        }  
  
  
  
  
        let medicineTime =  
  
            timeElement  
  
            .innerText  
  
            .trim();  
  
  
  
  
        // Remove extra spaces  
  
        medicineTime =  
  
            medicineTime.replace(/\s/g, "");  
  
  
  
  
        // Compare database time  
  
        // with current time  
  
        if (medicineTime === currentTime) {  
  
  
  
            // Unique key  
  
            let key =  
  
                medicineName +  
  
                "_" +  
  
                currentTime;  
  
  
  
  
            // Show reminder only once  
  
            if (!notifiedMedicines[key]) {  
  
  
  
                notifiedMedicines[key] = true;  
  
  
  
  
                // =====================================  
                // NORMAL ALERT  
                // =====================================  
  
                alert(  
  
                    "🔔 Medicine Reminder!\n\n" +  
  
                    "Time to take: " +  
  
                    medicineName  
  
                );  
  
  
  
  
                // =====================================  
                // BROWSER NOTIFICATION  
                // =====================================  
  
                if (  
  
                    "Notification" in window &&  
  
                    Notification.permission === "granted"  
  
                ) {  
  
  
  
                    new Notification(  
  
                        "💊 Medicine Reminder",  
  
                        {  
  
                            body:  
  
                            "It's time to take " +  
  
                            medicineName,  
  
  
  
                            icon:  
  
                            "images/capsule.jpg"  
  
                        }  
  
                    );  
  
  
  
                }  
  
  
  
            }  
  
  
  
        }  
  
  
  
    });  
  
  
  
}  
  
  
  
  
// =====================================  
// CHECK EVERY 1 SECOND  
// =====================================  
  
setInterval(  
  
    checkMedicineTime,  
  
    1000  
  
);  
  
  
  
  
// =====================================  
// CHECK WHEN PAGE LOADS  
// =====================================  
  
checkMedicineTime();  
  
  
  
</script>  
  
  
</body>  
  
</html>