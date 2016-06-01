<?php
class ModelCatalogShtanec extends Model {
	public function addShtanec($data) {
		$this->event->trigger('pre.admin.shtanec.add', $data);

		$this->db->query("INSERT INTO " . DB_PREFIX . "shtanec
		            SET
		            width_e = '" . (int)$data['width_e'] . "',
		            height_e = '" . (int)$data['height_e'] . "',
		            width = '" . (int)$data['width'] . "',
		            nomer = '" . (int)$data['nomer'] . "',
		            status = '" . (int)$data['status'] . "',
		            val = '" . (float)$data['val'] . "',
		            image = '" . $this->db->escape($data['image']) . "',
		            status = '" . (int)$data['status'] . "',
		            date_modified = NOW(),
		            date_added = NOW()");

		$shtanec_id = $this->db->getLastId();

		$this->cache->delete('shtanec');

		$this->event->trigger('post.admin.shtanec.add', $shtanec_id);

		return $shtanec_id;
	}

	public function editShtanec($shtanec_id, $data) {
		$this->event->trigger('pre.admin.shtanec.edit', $data);

		$this->db->query("UPDATE " . DB_PREFIX . "shtanec
		                    SET
                                width_e = '" . (int)$data['width_e'] . "',
                                height_e = '" . (int)$data['height_e'] . "',
                                width = '" . (int)$data['width'] . "',
                                nomer = '" . (int)$data['nomer'] . "',
                                status = '" . (int)$data['status'] . "',
                                val = '" . (float)$data['val'] . "',
                                image = '" . $this->db->escape($data['image']) . "',
                                date_modified = NOW(),
                                status = '" . (int)$data['status'] . "'
	                        WHERE id = '" . (int)$shtanec_id . "'");



		$this->cache->delete('shtanec');

		$this->event->trigger('post.admin.shtanec.edit', $shtanec_id);
	}

	public function deleteShtanec($shtanec_id) {
		$this->event->trigger('pre.admin.shtanec.delete', $shtanec_id);

		$this->db->query("DELETE FROM " . DB_PREFIX . "shtanec WHERE id = '" . (int)$shtanec_id . "'");

		$this->cache->delete('shtanec');

		$this->event->trigger('post.admin.shtanec.delete', $shtanec_id);
	}

	public function getShtanec($shtanec_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "shtanec
		WHERE id=" . (int)$shtanec_id . "'");

		return $query->row;
	}

	public function getShtanecList($data = array()) {
		$sql = "SELECT *
		FROM " . DB_PREFIX . "shtanec s";

		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}

			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}

		$query = $this->db->query($sql);

		return $query->rows;
	}

	public function getTotalShtanecList() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "shtanec");

		return $query->row['total'];
	}
}
