<?php 
	#init model helper
	$dirhe = is_file("models/model_helper.php") ? "models/model_helper.php" : "../models/model_helper.php";
	require_once($dirhe);
	$helper = new model_helper();
	#end model helper

	$dirmo = is_file("models/model_module.php") ? "models/model_module.php" : "../models/model_module.php";
	require_once($dirmo);
	$module = new model_module();

	$module->module_id = $_REQUEST["txtmodule_id"];
	$module->name = $_POST["txtname"];
	$module->position = $_POST["txtposition"];
	$module->icon_class = $_POST["txticon_class"];
	$txtoperation = $_REQUEST["txtoperation"];

	switch ($txtoperation){
		case 'add':
			$data["type"] = "byname";
			$getdata = $module->search($data);
			if( count($getdata) > 0 ){
				$error = 1;
			}else{
				if($module->add()){
					$error = 0;
				}else{
					$error = 2;
				}
			}
		break;
		case "search":
			$data["type"] = "single";
			$getdata = $module->search($data);
			if( count($getdata) > 0 ){
				$txtmodule_id = $getdata[0]['module_id'];
				$txtname = $getdata[0]['name'];
				$txtposition = $getdata[0]['position'];
				$txticon_class = $getdata[0]['icon_class'];
			}
		break;
		default:
			$data["type"] = "all";
			$all = $module->search($data);
			$cont = 0;
			$cad = "";

			while($all[$cont]["module_id"] != null){
				$cad.= "<tr>";
					$cad.="<td>".$all[$cont]['module_id']."</td>";
					$cad.="<td>".$all[$cont]['name']."</td>";
					$cad.="<td>".$all[$cont]['position']."</td>";
					$cad.="<td>".$helper->getbuttons($all[$cont]['isactive'], 'module', $all[$cont]['module_id'])."</td>";
				$cad.="</tr>";
				$cont++;
			}
		break;
	}
?>