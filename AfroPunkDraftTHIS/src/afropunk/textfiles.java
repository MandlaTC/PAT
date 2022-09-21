package afropunk;

import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.PrintWriter;
import java.io.IOException;
import java.util.Scanner;
import java.io.File;
import javax.swing.JOptionPane;
import java.io.BufferedWriter;

public class textfiles {
    private String path; // txtfile path 
    
    public textfiles(String Path){
        this.path = Path;
    }// Constructor Method
    
    
    public textfiles(){
        this.path="";
    }// construtor
     
    public void WriteFile(String contents,boolean append) throws IOException{
        PrintWriter writer = new PrintWriter(new FileWriter(this.path),append); // creates an IO file writer
        writer.println(contents);
        writer.close();
    } // writes a string to the textfile
    
    public void WriteFile(String contents,String FilePath,boolean append) throws IOException{
        PrintWriter writer = new PrintWriter(new FileWriter(FilePath),append); // creates an IO file writer
        writer.println(contents);
        writer.close();
    } // writes a string to the textfile
    
    public String ReadFile(){
        String output = "";
        try{
            Scanner reader = new Scanner(new File(this.path));
            while(reader.hasNext()){
                output+=reader.nextLine();
            }// end while
            reader.close();
            return output;
        }
        catch(Exception error){
            JOptionPane.showMessageDialog(null,"Error:File not Found");
        }
        return null;
    }
    
    public String ReadFile(String FilePath){
        String output = "";
        try{
            Scanner reader = new Scanner(new File(FilePath));
            while(reader.hasNext()){
                output+=reader.nextLine();
            }// end while
            reader.close();
            return output;
        }
        catch(Exception error){
            JOptionPane.showMessageDialog(null,"Error:File not Found");
        }
        return null;
    }
    
    public boolean newFile(String name) throws IOException{
        File f = new File(name);
        if(f.createNewFile()){
            this.path = name+".txt"; //sets new path
            return true;
        }
        return false;
    }// creates a new file 
}
