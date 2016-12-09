<?php 
	$dir = is_file("models/model_user.php") ? "models/model_user.php" : "../models/model_user.php";
	require_once($dir);

	$user = new model_user();

	$user->username = $_POST["txtusername"];
	$user->password = $_POST["txtpassword"];

	$txtoperation = $_REQUEST["txtoperation"];

	switch ($txtoperation) {
	 	case "login":
	 		$data["type"] = "login";
	 		$arruser = $user->search($data["type"]);

	 		if( count($arruser) > 0 ){
	 			$_SESSION["username"] = $arruser[0]["username"];
	 			$_SESSION["role"] = $arruser[0]["role"];
	 			header("location: index.php?v=dashboard");
	 		}else{
	 			header("location: index.php?v=login&error=1");
	 		}
	 	break;
	 	case "logout":
	 		unset($_SESSION["username"]);
	 		unset($_SESSION["role"]);
	 		session_destroy();
	 		header("location: index.php?v=login&logout=yes");
	 	break;
	 } 
?>