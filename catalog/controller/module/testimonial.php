<?php  
class ControllerModuletestimonial extends Controller {

	public function insert(){
		$this->language->load('module/testimonial');
		
		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('catalog/testimonial');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST' )) {
			$this->model_catalog_testimonial->addReferFriend($this->request->post);
			
			//send email to customer
			$this->language->load('mail/referfriend');
			$subject = sprintf($this->language->get('text_subject'), $this->config->get('config_name'));
			$message  = sprintf($this->language->get('text_greeting'), $this->config->get('config_name')) . "\n\n";		
			$message1  = sprintf($this->language->get('text_greeting1'), $this->config->get('config_name')) . "\n\n";
			$message1  .= sprintf($this->language->get('text_greeting2'), $this->config->get('config_name')) . "\n\n";	
			
			$mail = new Mail();
			$mail->protocol = $this->config->get('config_mail_protocol');
			$mail->parameter = $this->config->get('config_mail_parameter');
			$mail->hostname = $this->config->get('config_smtp_host');
			$mail->username = $this->config->get('config_smtp_username');
			$mail->password = $this->config->get('config_smtp_password');
			$mail->port = $this->config->get('config_smtp_port');
			$mail->timeout = $this->config->get('config_smtp_timeout');				
			$mail->setTo($this->request->post['e-mail']);
			$mail->setFrom($this->config->get('config_email'));
			$mail->setSender($this->config->get('config_name'));
			$mail->setSubject(html_entity_decode($subject, ENT_QUOTES, 'UTF-8'));
			$mail->setText(html_entity_decode($message, ENT_QUOTES, 'UTF-8'));
			$mail->send();
			//send email to friend
			
			$mail->setTo($this->request->post['friendsemail']);
			$mail->setFrom($this->config->get('config_email'));
			$mail->setSender($this->config->get('config_name'));
			$mail->setSubject(html_entity_decode($subject, ENT_QUOTES, 'UTF-8'));
			$mail->setText(html_entity_decode($message1, ENT_QUOTES, 'UTF-8'));
			$mail->send();

			
			$this->session->data['text_success'] = $this->language->get('text_success');
						
			$this->redirect($this->url->link('module/testimonial/success', 'SSL'));
		}
		
		
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/testimonial.tpl')) {
            $this->template = $this->config->get('config_template') . '/template/module/testimonial.tpl';
        } else {
            $this->template = 'default/template/module/testimonial.tpl';
        } 
		}

	protected function index($setting) {
		$this->language->load('module/testimonial');

		$this->data['testimonial_title'] = html_entity_decode($setting['testimonial_title'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');

      	$this->data['heading_title'] = $this->language->get('heading_title');
      	$this->data['text_more'] = $this->language->get('text_more');
      	$this->data['text_more2'] = $this->language->get('text_more2');
		$this->data['isi_testimonial'] = $this->language->get('isi_testimonial');
		$this->data['show_all'] = $this->language->get('show_all');
		$this->data['showall_url'] = $this->url->link('product/testimonial'); 
		$this->data['more'] = $this->url->link('product/testimonial', 'testimonial_id='); 
		$this->data['isitesti'] = $this->url->link('product/isitestimonial');
		$this->data['heading_title_right'] = $this->language->get('heading_title_right');
		$this->data['entry_name'] = $this->language->get('entry_name');
		$this->data['entry_email'] = $this->language->get('entry_email');
		$this->data['entry_phone'] = $this->language->get('entry_phone');
		$this->data['entry_friend_name'] = $this->language->get('entry_friend_name');
		$this->data['entry_friend_email'] = $this->language->get('entry_friend_email');
		

		$this->load->model('catalog/testimonial');
		
		$this->data['testimonials'] = array();
		$this->data['action'] = $this->url->link('module/testimonial/insert', '', 'SSL');
		$this->data['total'] = $this->model_catalog_testimonial->getTotalTestimonials();
		$results = $this->model_catalog_testimonial->getTestimonials(0, $setting['testimonial_limit'], (isset($setting['testimonial_random']))?true:false);


		foreach ($results as $result) {
			

			//$result['description'] = strip_tags(html_entity_decode($result['description']));

			if (!isset($setting['testimonial_character_limit']))
				$setting['testimonial_character_limit'] = 0;

			if ($setting['testimonial_character_limit']>0)
			{
				$lim = $setting['testimonial_character_limit'];
				if (mb_strlen($result['description'],'UTF-8')>$lim) 
					$result['description'] = mb_substr($result['description'], 0, $lim-3, 'UTF-8'). ' ' .'<a href="'.$this->data['more']. $result['testimonial_id'] .'" title="'.$this->data['text_more2'].'">'. $this->data['text_more'] . '</a>';
				else
					$result['description'] = $result['description'] . ' ' .'<a href="'.$this->data['more']. $result['testimonial_id'] .'" title="'.$this->data['text_more2'].'">'. $this->data['text_more'] . '</a>';

			}
			else
				$result['description'] = $result['description'] . ' ' .'<a href="'.$this->data['more']. $result['testimonial_id'] .'" title="'.$this->data['text_more2'].'">'. $this->data['text_more'] . '</a>';


			$this->data['testimonials'][] = array(
				'id'			=> $result['testimonial_id'],											  
				'title'		=> $result['title'],
				'description'	=> $result['description'],
				'rating'		=> $result['rating'],
				'name'		=> $result['name'],
				'date_added'	=> $result['date_added'],
				'city'		=> $result['city']

			);
		}

		

		$this->id = 'testimonial';

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/testimonial.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/testimonial.tpl';
		} else {
			$this->template = 'default/template/module/testimonial.tpl';
		}
		
		$this->render();
	}
	public function success() {
		$this->language->load('module/testimonial');
		$this->document->setTitle($this->language->get('heading_title_right')); 

      	$this->data['breadcrumbs'] = array();

      	$this->data['breadcrumbs'][] = array(
        	'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),
        	'separator' => false
      	);

      	$this->data['breadcrumbs'][] = array(
        	'text'      => $this->language->get('heading_title_right'),
			'href'      => $this->url->link('account/voucher'),
        	'separator' => $this->language->get('text_separator')
      	);	
		$this->data['heading_title'] = $this->language->get('heading_title_right');
	
		$this->data['text_message'] = $this->language->get('text_message');
	
		$this->data['button_continue'] = $this->language->get('button_continue');
		
		$this->data['continue'] = HTTP_SERVER . 'index.php?route=common/home';

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/success.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/common/success.tpl';
		} else {
			$this->template = 'default/template/common/success.tpl';
		}
		$this->children = array(
			'common/column_left',
			'common/column_right',
			'common/content_top',
			'common/content_bottom',
			'common/footer',
			'common/header'
		);
				
 		$this->response->setOutput($this->render()); 
	}
}
?>