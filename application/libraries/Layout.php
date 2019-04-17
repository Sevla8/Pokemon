<?php 
if (!defined('BASEPATH')) 
	exit('No direct script access allowed');

class Layout {
	private $CI;
	private $var = array();
	private $theme = 'default';
	
	public function __construct() {
		$this->CI = get_instance();
		$this->var['output'] = '';
		$this->var['title'] = ucfirst($this->CI->router->fetch_method()).'-'.ucfirst($this->CI->router->fetch_class());
		$this->var['charset'] = $this->CI->config->item('charset');
		$this->var['css'] = array();
		$this->var['js'] = array();
	}

	public function set_title($title) {
		if (is_string($title) && !empty($title)) {
			$this->var['title'] = $title;
			return $this;
		} 
		return false;
	}

	public function set_charset($charset) {
		if (is_string($charset) && !empty($charset)) {
			$this->var['charset'] = $charset;
			return $this;
		}
		return false;
	}

	public function link_css($css) {
		//if (is_string($css) && !empty($css) && $css in array("header.css", "footer.css")
		if (is_string($css) && !empty($css)/* && file_exists('../links/css/'.$css.'.css')*/) {
			$this->var['css'][] = css_url($css);
			return $this;
		}
		return false;
	}

	public function link_js($js) {
		if (is_string($js) && !empty($js)/* && file_exists('../links/js/'.$js.'.js')*/) {
			$this->var['js'][] = js_url($js);
			return $this;
		}
		return false;
	}

	public function set_theme($theme) {
		if (is_string($theme) && !empty($theme) && file_exists('../themes/'.$theme.'.php')) {
			$this->theme = $theme;
			return $this;
		}
		return false;
	}
	
	public function view($name, $data = array()) {
		$this->var['output'] .= $this->CI->load->view($name, $data, true);
		return $this;
	}
	
	public function print() {
		$this->CI->load->view('../themes/'.$this->theme, $this->var);
	}
}
