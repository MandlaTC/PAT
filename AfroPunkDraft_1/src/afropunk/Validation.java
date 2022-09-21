package afropunk;


public class Validation {
    
    public boolean CheckString(String s){
        return s.matches("[a-zA-Z]+");
    }
    
    public boolean numCheck(String s){
        return s.matches("[0-9]+");
    }
    
    public boolean cellCheck(String s){
        if(s.length()==10 && s.matches("[0-9]+")){ 
            return true;
        }
        return false;
    }
    
          
    public boolean specialCheck(String s){
        String specialCharactersString = "!@#$%&*()'+,-./:;<=>?[]^_`{|}";
        for (int i=0; i < s.length() ; i++)
        {
            char ch = s.charAt(i);
            if(specialCharactersString.contains(Character.toString(ch))) {
                return true;               
            }    
            else if(i == s.length()-1) {    
                return false;
            }
            
        }
        return false;
       }// end specialCheck
    
           
    public boolean emailCheck(String s){
        if(s.contains("@")){
               return true;
           }
        return false;
    }
}
