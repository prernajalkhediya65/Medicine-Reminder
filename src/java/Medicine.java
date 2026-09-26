public class Medicine {
    int id;
    String medicineName;
    String medicineTime;
    
    public Medicine(){
        
    }
    public Medicine(String medicineName, String medicineTime){
        this.medicineName = medicineName;
        this.medicineTime = medicineTime;
    }
    public int getId(){
        return id;
    }
    
    public void setId(int id){
        this.id = id;
    }
    public String getMedicineNmae(){
        return medicineName;
    }
    public void setMedicineName(String medicineName){
        this.medicineName = medicineName;
        
    }
    public String getMedicineTime(){
        return medicineTime;
    }
    public void setMedicineTime(String medicineTime){
        this.medicineTime = medicineTime;
    }
}
