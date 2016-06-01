<?php
class ModelModuleMaterials extends Model {
	function getListCustomerMaterials(){
		$sql = "SELECT * FROM " . DB_PREFIX . "customer_materials WHERE firm =0";
		$q = $this->db->query($sql);
		return $q->rows;
	}

	function addOther($name){
		$sql = "INSERT INTO " . DB_PREFIX . "customer_materials(name, description, price, firm)
				VALUES('" . $this->db->escape($name) . "', '" . $this->db->escape($name) . "', 0, '" . (int)$this->customer->manufacturer_id . "')";
		$this->db->query($sql);
		return $this->db->getLastId();
	}
}