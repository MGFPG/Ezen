package Pratice;

public class PersonInfo {
	
    private int PN;
    private String name;
    private int age;
    private String sex;
    private String number;
    private String phonenumber;

    public int getPN() {
        return PN;
    }

    public void setPN(int pn) {
        this.PN = pn;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }
    
    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getPhonenumber() {
        return phonenumber;
    }

    public void setPhonenumber(String phonenumber) {
        this.phonenumber = phonenumber;
    }

    public void showInfo() {
        System.out.println("이름 : " + this.name);
        System.out.println("나이 : " + this.age);
        System.out.println("성별 : " + this.sex);
        System.out.println("전화번호 : " + this.number);
        System.out.println("휴대폰번호 : " + this.phonenumber);
    }

}
