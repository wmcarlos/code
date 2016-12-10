function message(operation, val){
	var text = "";
	switch(operation){
		case "add":
			if(val == '0'){
				text = "Successfully registered";
			}else if (val == '1'){
				text = "Registration already exists";
			}else if (val == '2'){
				text = "Error executing query";
			}
		break;
	}
}