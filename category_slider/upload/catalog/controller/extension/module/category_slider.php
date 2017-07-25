<?php
class ControllerExtensionModuleCategorySlider extends Controller {
	public function index(){
		$this->load->model('setting/setting');
		if($this->config->get('category_slider_status')){
			$cat_id = $this->request->get['path'];
			$cat_id = explode('_', $cat_id);
			if($cat_id[0] == '') unset($cat_id[0]);
			$depth = count($cat_id);
			$cat_id = array_pop($cat_id);
			$data = [];
			//Get slides
			$settSlider = $this->config->get('categorySlider'.$cat_id);

			$this->load->model('tool/image');

			if(!empty($settSlider)){
				$settSlider = unserialize($settSlider);
				$slides = (!empty($settSlider['slide'])) ? $settSlider['slide'] : [];
				$slideLink = (!empty($settSlider['slideLink'])) ? $settSlider['slideLink'] : [];

				$width = $this->config->get('category_slider_width');
				$height = $this->config->get('category_slider_height');

				$slider = [];
				foreach($slides as $k => $v){
					if(empty($v)) continue;
					$slider[] = [
						'image' => $this->model_tool_image->resize($v, $width, $height),
						'thumb' => $this->model_tool_image->resize($v, 100, 100),
						'link' => (!empty($slideLink[$k])) ? $slideLink[$k] : '',
					];
				}
				$data['slides'] = $slider;
				$data['effect'] = $this->config->get('category_slider_effect');
				$data['bullets'] = $this->config->get('category_slider_bullets');
				$data['autoplay_speed'] = $this->config->get('category_slider_autoplay_speed');
				$data['autoplay'] = $this->config->get('category_slider_autoplay');
				$max_depth = $this->config->get('category_slider_max_depth');

				if($depth <= $max_depth) {
					$this->document->addScript('/catalog/view/javascript/slick/slick.min.js');
					$this->document->addStyle('/catalog/view/javascript/slick/slick.css');
					$this->document->addStyle('/catalog/view/javascript/slick/slick-theme.css');
					if ( file_exists( DIR_TEMPLATE . $this->config->get( 'config_template' ) . '/template/extension/module/category_slider.tpl' ) ) {
						return $this->load->view( $this->config->get( 'config_template' ) . '/template/extension/module/category_slider.tpl', $data );
					} else {
						return $this->load->view( 'extension/module/category_slider.tpl', $data );
					}
				}
			}
		}
	}
}