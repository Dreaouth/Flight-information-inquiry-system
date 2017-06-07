package information;

public class Ticket {
	private int id;
	private String startCode;
	private String startcityname;
	private String arriveCode;
	private String arriveCityname;
	private int number;
	private int price;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getStartCode() {
		return startCode;
	}
	public void setStartCode(String startCode) {
		this.startCode = startCode;
	}
	public String getStartcityname() {
		return startcityname;
	}
	public void setStartcityname(String startcityname) {
		this.startcityname = startcityname;
	}
	public String getArriveCode() {
		return arriveCode;
	}
	public void setArriveCode(String arriveCode) {
		this.arriveCode = arriveCode;
	}
	public String getArriveCityname() {
		return arriveCityname;
	}
	public void setArriveCityname(String arriveCityname) {
		this.arriveCityname = arriveCityname;
	}

}
