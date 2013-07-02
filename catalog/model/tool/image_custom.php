<?php
class ModelToolImageCustom extends Model {
	// Simply returns the filename URL without resizing.
	public function return_filename($filename) {
		if (!file_exists(DIR_IMAGE . $filename) || !is_file(DIR_IMAGE . $filename)) {
			return;
		} 
		
		if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
			return HTTPS_IMAGE . $filename;
		} else {
			return HTTP_IMAGE . $filename;
		}	
	}
}
?>