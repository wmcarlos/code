<?php
	require_once("models/model_db.php"); 
 	class model_helper extends model_db{

 		public function load(){
 			$v = $_GET['v'];
 			if(isset($v) and !empty($v)){
 				$controller = "controllers/controller_".$v.".php";
 				$view = "views/view_".$v.".php";
 				if(is_file($controller) and is_file($view)){
 					include($controller);
 					include($view);
 				}else{
 					include("controllers/controller_404.php");
 					include("views/view_404.php");
 				}
 			}else{
 				include("controllers/controller_dashboard.php");
 				include("views/view_dashboard.php");
 			}
 		}

 		public function getmodules(){
 			$role = $_SESSION["role"];
 			if(isset($role) and !empty($role)){
 				$sql = "select distinct md.module_id, md.name, md.icon_class from cd_module as md
					inner join cd_service as sv on (sv.module_id = md.module_id)
					inner join cd_access as ac on (ac.service_id = sv.service_id)
					where ac.role = ".$role." order by md.position asc";

				$this->execute($sql);

				while($row = $this->getdata()){
					$arr[] = $row;
				}

				$this->free_result();
				$this->close();
				return $arr;
 			}else{
 				return null;
 			}
 			
 		}

 		public function getservices($module){
 			$role = $_SESSION["role"];
 			if(isset($role) and !empty($role)){
 				$sql = 'select sv.service_id, sv.name, sv.url, sv.icon_class from cd_service as sv
					inner join cd_access as ac on (ac.service_id = sv.service_id)
					where ac.role = '.$role.' and sv.module_id = '.$module.'
					order by sv.position asc';

				$this->execute($sql);

				while($row = $this->getdata()){
					$arr[] = $row;
				}

				$this->free_result();
				$this->close();

				return $arr;
 			}else{
 				return null;
 			}
 			
 		}

 		public function RenderMenu(){

 			$menu = "<li><a href='?v=home'>Home</a></li>
 					 <li><a href='?v=login'>Login</a></li>";
 			$modules = $this->getmodules();

 			if( count($modules) > 0 ){
 				$menu = "<li><a href='?v=dashboard'>Dashboard</a></li>";
 				$contm = 0;
	 			while($modules[$contm]['module_id'] != null){
	 				$menu.="<li class='dropdown'><a class='dropdown-toggle' data-toggle='dropdown' href='#'>".$modules[$contm]['name']." <span class='caret'></span></a> <ul class='dropdown-menu'>";

	 					$services = $this->getservices($modules[$contm]['module_id']);
	 					$conts = 0;

	 					while($services[$conts]['service_id'] != null){
	 						$menu.="<li><a href='?v=".$services[$conts]['url']."'>".$services[$conts]['name']."</a></li>";
	 						$conts++;
	 					}

	 					$menu.="</ul></li>";
	 				$contm++;
	 			}
	 			$menu.="<li><a href='?v=login&txtoperation=logout'>Logout</a></li>";
 			}
 			return $menu;
 		}
 	}
?>