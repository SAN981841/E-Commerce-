
package com.learn.mycart.helper;

public class Helper {
    public static String get10Words(String desc){
        String[] str = desc.split(" ");
        if(str.length>10){
            String result="";
            for(int i=0 ;i<10;i++){
                result=result+str[i]+" ";
            }
            return result+"...";
        }else{
            return (desc+"...");
        }
    }
    
}
