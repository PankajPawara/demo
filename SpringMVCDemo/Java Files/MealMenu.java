import javax.persistence.*;

public class MealMenu {
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int ID;
	private String Day, Breakfast, Lunch, Dinner;
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public String getDay() {
		return Day;
	}
	public void setDay(String day) {
		Day = day;
	}
	public String getBreakfast() {
		return Breakfast;
	}
	public void setBreakfast(String breakfast) {
		Breakfast = breakfast;
	}
	public String getLunch() {
		return Lunch;
	}
	public void setLunch(String lunch) {
		Lunch = lunch;
	}
	public String getDinner() {
		return Dinner;
	}
	public void setDinner(String dinner) {
		Dinner = dinner;
	}
	public MealMenu() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MealMenu(int iD, String day, String breakfast, String lunch, String dinner) {
		super();
		ID = iD;
		Day = day;
		Breakfast = breakfast;
		Lunch = lunch;
		Dinner = dinner;
	}
	@Override
	public String toString() {
		return "MealMenu [ID=" + ID + ", Day=" + Day + ", Breakfast=" + Breakfast + ", Lunch=" + Lunch + ", Dinner="
				+ Dinner + "]";
	}
	
}
