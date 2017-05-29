package information;

public class City {
	private int id;
	private String cityCode;
	private String cityName;
	private String province;
	private String dromeName;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCityName() {
		return cityName;
	}
	public void setCityName(String cityName) {
		this.cityName = cityName;
	}
	public String getCityCode() {
		return cityCode;
	}
	public void setCityCode(String cityCode) {
		this.cityCode = cityCode;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getDromeName() {
		return dromeName;
	}
	public void setDromeName(String dromeName) {
		this.dromeName = dromeName;
	}


}
