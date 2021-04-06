package myweb_ex;


public class SignUp {
   private String name;
   private String position;
   private String id;
   private String password;
   private String code;
   private String gender;
   
   public SignUp() {
      this("", "", "", "", "", "");
   }
   
   public SignUp(String id, String pwd, String name, String pos, String code, String gender) {
      this.name = name;
      this.position = pos;
      this.id = id;
      this.password = pwd;
      this.code = code;
      this.gender = gender;
   }

   public String getName() {
      return name;
   }

   public void setName(String name) {
      this.name = name;
   }

   public String getPosition() {
      return position;
   }

   public void setPosition(String position) {
      this.position = position;
   }

   public String getId() {
      return id;
   }

   public void setId(String id) {
      this.id = id;
   }

   public String getPassword() {
      return password;
   }

   public void setPassword(String password) {
      this.password = password;
   }

   public String getCode() {
      return code;
   }

   public void setCode(String code) {
      this.code = code;
   }

   public String getGender() {
      return gender;
   }

   public void setGender(String gender) {
      this.gender = gender;
   }
   
   
   

}
