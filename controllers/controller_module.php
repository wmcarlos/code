<?php 
	#init model helper
	$dirhe = is_file("models/model_helper.php") ? "models/model_helper.php" : "../models/model_helper.php";
	require_once($dirhe);
	$helper = new model_helper();
	#end model helper

	$dirmo = is_file("models/model_module.php") ? "models/model_module.php" : "../models/model_module.php";
	require_once($dirmo);
	$module = new model_module();


	$txtoperation = $_REQUEST["txtoperation"];

	switch ($txtoperation){
		default:
			$data["type"] = "all";
			$all = $module->search($data);
			$cont = 0;

			while($all[$cont]["module_id"] != null){



				$cont++;
			}

		break;
	}
?>