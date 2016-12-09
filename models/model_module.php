<?php 
	require_once("model_db.php");

	class model_module extends model_db{
		private $module_id,
				$created,
				$updated,
				$name,
				$position,
				$icon_class,
				$isactive;

		public function __construct(){
			$this->module_id = 0;
			$this->created = "";
			$this->updated = "";
			$this->name = "";
			$this->position = 0;
			$this->icon_class = "";
			$this->isactive = 'Y';
		}

		public function __set($atr, $val){
			$this->$atr = $val;
		}

		public function __get($atr){
			return $this->$atr;
		}

		public function search($data){
			$type = strtolower($data['type']);
			$sql = "";

			switch ($type) {
				case 'all':
					$sql = "select * from cd_module order by name asc";
				break;
				case 'single':
					$sql = "select * from cd_module where module_id = $this->module_id";
				break;
			}

			$this->execute($sql);
			while($row = $this->getdata()){
				$arr[] = $row;
			}

			$this->free_result();
			$this->close();
			
			return $arr;
		}
	}
?>