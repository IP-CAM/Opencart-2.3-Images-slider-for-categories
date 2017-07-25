<?php
class ControllerExtensionModuleCategorySlider extends Controller {
	public function index(){
		$this->load->language('extension/module/category_slider');
		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {

			$this->model_setting_setting->editSetting('category_slider', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true));
		}


		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		$data['heading_title'] = $this->language->get('heading_title');
		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['entry_status'] = $this->language->get('entry_status');

		$data['entry_effect'] = $this->language->get('entry_effect');
		$data['entry_bullets'] = $this->language->get('entry_bullets');
		$data['entry_max_depth'] = $this->language->get('entry_max_depth');
		$data['entry_size'] = $this->language->get('entry_size');
		$data['entry_height'] = $this->language->get('entry_height');
		$data['entry_width'] = $this->language->get('entry_width');
		$data['select_autoplay'] = $this->language->get('select_autoplay');
		$data['select_autoplay_time'] = $this->language->get('select_autoplay_time');

		$data['select_effect_fade'] = $this->language->get('select_effect_fade');
		$data['select_effect_slide'] = $this->language->get('select_effect_slide');

		$data['select_bullets_disable'] = $this->language->get('select_bullets_disable');
		$data['select_bullets_all'] = $this->language->get('select_bullets_all');
		$data['select_bullets_arrows'] = $this->language->get('select_bullets_arrows');
		$data['select_bullets_bullets'] = $this->language->get('select_bullets_bullets');

		// если метод validate вернул warning, передадим его представлению
		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		// далее идет формирование массива breadcrumbs (хлебные крошки)
		$data['breadcrumbs'] = array();
		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);
		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_module'),
			'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL')
		);
		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('module/category_slider', 'token=' . $this->session->data['token'], 'SSL')
		);

		//ссылки для формы и кнопки "cancel"
		$data['action'] = $this->url->link('extension/module/category_slider', 'token=' . $this->session->data['token'], 'SSL');
		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		//переменная с статусом модуля
		if (isset($this->request->post['category_slider_status'])) {
			$data['category_slider_status'] = $this->request->post['category_slider_status'];
		} else {
			$data['category_slider_status'] = $this->config->get('category_slider_status');
		}

		if (isset($this->request->post['category_slider_effect'])) {
			$data['category_slider_effect'] = $this->request->post['category_slider_effect'];
		} else {
			$data['category_slider_effect'] = $this->config->get('category_slider_effect');
		}

		if (isset($this->request->post['category_slider_bullets'])) {
			$data['category_slider_bullets'] = $this->request->post['category_slider_bullets'];
		} else {
			$data['category_slider_bullets'] = $this->config->get('category_slider_bullets');
		}

		if (isset($this->request->post['category_slider_autoplay'])) {
			$data['category_slider_autoplay'] = $this->request->post['category_slider_autoplay'];
		} else {
			$data['category_slider_autoplay'] = $this->config->get('category_slider_autoplay');
		}

		if (isset($this->request->post['category_slider_autoplay_speed'])) {
			$data['category_slider_autoplay_speed'] = $this->request->post['category_slider_autoplay_speed'];
		} else {
			$data['category_slider_autoplay_speed'] = $this->config->get('category_slider_autoplay_speed');
		}

		if (isset($this->request->post['category_slider_max_depth'])) {
			$data['category_slider_max_depth'] = $this->request->post['category_slider_max_depth'];
		} else {
			$data['category_slider_max_depth'] = $this->config->get('category_slider_max_depth');
		}

		if (isset($this->request->post['category_slider_width'])) {
			$data['category_slider_width'] = $this->request->post['category_slider_width'];
		} else {
			$data['category_slider_width'] = $this->config->get('category_slider_width');
		}

		if (isset($this->request->post['category_slider_height'])) {
			$data['category_slider_height'] = $this->request->post['category_slider_height'];
		} else {
			$data['category_slider_height'] = $this->config->get('category_slider_height');
		}


		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module/category_slider.tpl', $data));
	}
	protected function validate()
	{
		if (!$this->user->hasPermission('modify', 'extension/module/category')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		return !$this->error;
	}
}