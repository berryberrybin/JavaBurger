package dto;

public class Payment {
    private int paymentNumber;
    private String userId;
    private String paymentDate;
    private int paymentMehtod;
    private int paymentPrice;
    private int userCouponNumber;

    public Payment(int paymentNumber, String userId, String paymentDate, int paymentMehtod, int paymentPrice, int userCouponNumber) {
        this.paymentNumber = paymentNumber;
        this.userId = userId;
        this.paymentDate = paymentDate;
        this.paymentMehtod = paymentMehtod;
        this.paymentPrice = paymentPrice;
        this.userCouponNumber = userCouponNumber;
    }

    public int getPaymentNumber() {
        return paymentNumber;
    }

    public void setPaymentNumber(int paymentNumber) {
        this.paymentNumber = paymentNumber;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(String paymentDate) {
        this.paymentDate = paymentDate;
    }

    public int getPaymentMehtod() {
        return paymentMehtod;
    }

    public void setPaymentMehtod(int paymentMehtod) {
        this.paymentMehtod = paymentMehtod;
    }

    public int getPaymentPrice() {
        return paymentPrice;
    }

    public void setPaymentPrice(int paymentPrice) {
        this.paymentPrice = paymentPrice;
    }

    public int getUserCouponNumber() {
        return userCouponNumber;
    }

    public void setUserCouponNumber(int userCouponNumber) {
        this.userCouponNumber = userCouponNumber;
    }

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("");
        sb.append("paymentNumber=").append(paymentNumber);
        sb.append(", userId='").append(userId).append('\'');
        sb.append(", paymentDate='").append(paymentDate).append('\'');
        sb.append(", paymentMehtod=").append(paymentMehtod);
        sb.append(", paymentPrice=").append(paymentPrice);
        sb.append(", userCouponNumber=").append(userCouponNumber);
        return sb.toString();
    }
}