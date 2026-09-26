<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Medicine Reminder </title>
        <link rel="stylesheet"href="css/style.css">
    </head>
    <body>
        <div class="main-container">
            <div class ="left-section">
                <div class="logo"> 
                    <img src="images/capsule.jpg" alt="Medicine"><!-- comment --></div>
                <h1> Medicine Reminder</h1><!-- comment -->
                <p>
                    Never Miss Your Medicine again.
                    Add your medicine and get a reminder at the right time.
                    
                </p>
                
                <div class="feature">
                    <div> 
                        <img src="images/alarm.jpg" alt="Smart Time Reminder" >
                        <span>Smart Time Reminder</span>   
                    </div>
            <div> 
                <img src="images/capsule.jpg" alt="Medicine Tracking" >
                <span>Medicine Tracking</span>   
                       </div>
                   
                    <div> 
                        <img src="images/bell.jpg" alt="Insert Alert">
                        <span>Insert Alert</span>  
                       </div>
                            </div>
                <div class="right-section">
                    <h2>Add Medicine</h2><!-- comment -->
                    <form action ="AddMedicineServlet"method ="post">
                        <label >Medicine Name</label><!-- comment -->
                        <input type="text"
                               name ="medicineName"
                               placeholder="Enter medicine name"
                               required>
                        
                        <label>Medicine Time</label><!-- comment -->
                        <input type ="medicineTime "required><!-- comment -->
                        
                        <button type="submit">
                            Add Medicine
                        </button>         
                    </form>
                    
                    <br><!-- comment -->
                    <a href="medicines.jsp" class="view-button">
                        View Medicine
                    </a>
                </div>

        </div>
    </body>
</html>
