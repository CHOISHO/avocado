export default function checkSQLReservedWord(value: string){ 
    if(value.length > 0) { 
      //특수문자 제거 
      var expText = /[&\/\#,+()$~%.'":@^*?<>{}]/g;

      if(expText.test(value) == true){ 
        value = value.replace(expText, '');
        return false; 
      } 

      //특정문자열(sql예약어의 앞뒤공백포함) 제거
      var sqlArray = ["OR", "SELECT", "INSERT", "DELETE", "UPDATE","CREATE", "DROP", "EXEC",  "UNION","FETCH", "DECLARE", "TRUNCATE"];
       
      var regex; 
      for(var i=0; i<sqlArray.length; i++) { 
            regex = new RegExp( sqlArray[i] ,"gi") ; 
            
            if (regex.test(value) ) { 
                value = value.replace(regex, ""); 
                return false; 
            }
        }
    }

    return true; 
} 