<!DOCTYPE html> 
 
<html> 
 
<head> 
 
    <meta http-equiv="Content-Type" 
          content="text/html; charset=UTF-8"> 
 
    <title>Medicine Reminder</title> 
 
    <link rel="stylesheet" href="css/style.css"> 
 
</head> 
 
<body> 
 
    <div class="main-container"> 
 
 
         
 
        <div class="left-section"> 
 
             
            <div class="logo"> 
 
                <img src="images/capsule.jpg" 
                     alt="Medicine"> 
 
            </div> 
 
 
            <h1> 
                Medicine Reminder 
            </h1> 
 
 
            <p class="description"> 
 
                Never Miss Your Medicine Again. 
                Add your medicine and get a reminder 
                at the right time. 
 
            </p> 
 
 
            
 
            <div class="features"> 
 
 
                <div class="feature"> 
 
                    <img src="images/alarm.jpg" 
                         alt="Smart Time Reminder"> 
 
                    <div> 
 
                        <span> 
                            Smart Time Reminder 
                        </span> 
 
                        <small> 
                            Get reminder at the right time 
                        </small> 
 
                    </div> 
 
                </div> 
 
 
                <div class="feature"> 
 
                    <img src="images/capsule.jpg" 
                         alt="Medicine Tracking"> 
 
                    <div> 
 
                        <span> 
                            Medicine Tracking 
                        </span> 
 
                        <small> 
                            Keep track of your medicines 
                        </small> 
 
                    </div> 
 
                </div> 
 
 
                <div class="feature"> 
 
                    <img src="images/bell.jpg" 
                         alt="Instant Alert"> 
 
                    <div> 
 
                        <span> 
                            Instant Alert 
                        </span> 
 
                        <small> 
                            Never miss your medicine 
                        </small> 
 
                    </div> 
 
                </div> 
 
 
            </div> 
 
        </div> 
 
 
          
 
        <div class="right-section"> 
 
            <div class="form-header"> 
 
                <div class="form-icon"> 
                    ? 
                </div> 
 
                <div> 
 
                    <h2> 
                        Add Medicine 
                    </h2> 
 
                    <p> 
                        Set your medicine schedule 
                    </p> 
 
                </div> 
 
            </div> 
 
 
            <form action="saveMedicineServlet" 
                  method="post"> 
 
 
                 
                <label> 
                    Medicine Name 
                </label> 
 
                <input type="text" 
                       name="medicineName" 
                       placeholder="Enter medicine name" 
                       required> 
 
 
                <!-- Medicine Time --> 
 
                <label> 
                    Medicine Time 
                </label> 
 
                
<div class="time-box">

    <input type="text"
           name="medicineTime"
           placeholder="07:30"
           pattern="(0[1-9]|1[0-2]):[0-5][0-9]"
           required>

    <select name="ampm" required>

        <option value="">AM/PM</option>
        <option value="AM">AM</option>
        <option value="PM">PM</option>

    </select>

</div>
 
 
                
                <button type="submit"> 
 
                    + Add Medicine 
 
                </button> 
 
 
            </form> 
 
 
             
            <a href="medicine.jsp" 
               class="view-button"> 
 
                ? View My Medicines 
 
            </a> 
 
 
            <!-- Information --> 
 
            <div class="info-box"> 
 
                <div class="info-icon"> 
                    ? 
                </div> 
 
                <div> 
 
                    <h3> 
                        Stay on Schedule 
                    </h3> 
 
                    <p> 
                        We'll remind you when it's 
                        time to take your medicine. 
                    </p> 
 
                </div> 
 
            </div> 
 
 
        </div> 
 
 
    </div> 
 
 
     
 
    <div class="footer"> 
 
        ? Medicine Reminder System 
 
        <span> 
            | Stay Healthy ? Stay on Time 
        </span> 
 
    </div> 
 
 
</body> 
 
</html>