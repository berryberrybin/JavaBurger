package dto;

public class ProductOption {
	private int optionNumber;
	private String categoryNumber;
	private String optionName;
	private int optionPrice;

	public ProductOption(String optionName) {
		this.optionName = optionName;
	}

	public ProductOption(int optionNumber, String categoryNumber, String optionName, int optionPrice) {
		this.optionNumber = optionNumber;
		this.categoryNumber = categoryNumber;
		this.optionName = optionName;
		this.optionPrice = optionPrice;
	}

	public ProductOption(String optionName, int optionPrice) {
		this.optionName = optionName;
		this.optionPrice = optionPrice;
	}

	public ProductOption(String categoryNumber, String optionName, int optionPrice) {
		this.categoryNumber = categoryNumber;
		this.optionName = optionName;
		this.optionPrice = optionPrice;
	}

	public int getOptionNumber() {
		return optionNumber;
	}

	public void setOptionNumber(int optionNumber) {
		this.optionNumber = optionNumber;
	}

	public String getCategoryNumber() {
		return categoryNumber;
	}

	public void setCategoryNumber(String categoryNumber) {
		this.categoryNumber = categoryNumber;
	}

	public String getOptionName() {
		return optionName;
	}

	public void setOptionName(String optionName) {
		this.optionName = optionName;
	}

	public int getOptionPrice() {
		return optionPrice;
	}

	public void setOptionPrice(int optionPrice) {
		this.optionPrice = optionPrice;
	}

	@Override
	public String toString() {
		final StringBuilder sb = new StringBuilder("");
		sb.append("옵션번호 = ").append(optionNumber);
		sb.append(" | | 카테고리번호 = ").append(categoryNumber);
		sb.append(" | | 옵션이름 = '").append(optionName).append('\'');
		sb.append(" | | 상품가격 = ").append(optionPrice);
		System.out.println();
		return sb.toString();
	}
}
