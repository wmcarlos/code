<?php 
	require_once("model_db.php");
	class model_user extends model_db{
		private $user_id,
				$role,
				$created,
				$updated,
				$first_name,
				$last_name,
				$sex,
				$birthday,
				$email,
				$phone,
				$username,
				$password,
				$avatar,
				$isactive;

		public function __construct(){
			$this->user_id = 0;
			$this->role = 0;
			$this->created = "";
			$this->updated = "";
			$this->first_name = "";
			$this->last_name = "";
			$this->sex = '';
			$this->birthday = "";
			$this->email = "";
			$this->phone = "";
			$this->username = "";
			$this->password = "";
			$this->avatar = "";
			$this->isactive = 'Y';
		}

		public function __set($atr, $val){
			$this->$atr = $val;
		}

		public function __get($atr){
			return $this->$atr;
		}

		public function search($data){
			$t = strtolower($data["type"]);
			$sql = "";
			
			switch ($t) {
				case 'login':
					$this->password = md5($this->password);
					$sql = "select * from cd_user where username = '$this->username' and password = '$this->password'";
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