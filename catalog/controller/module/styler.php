<?php  
class ControllerModuleStyler extends Controller {
	protected function index($setting) {

		$this->data['styler'] = $setting;
			
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/styler.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/styler.tpl';
		} else {
			$this->template = 'default/template/module/styler.tpl';
		}
		
		isset($this->session->data['token'])? $token_added_in_url = 'token=' . $this->session->data['token'] : $token_added_in_url = '';
		$this->data['styler']['action_url'] = str_replace('index.php?', 'admin/index.php?', $this->url->link('module/styler', $token_added_in_url, 'SSL'));
				

		$GLOBALS["styler"] = $this->data['styler'];

	/*
		echo "<pre>";
		var_dump($this->url);
		echo "</pre>";
		*/
		
		
	//	$this->render();

	}
}
?>