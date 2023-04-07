package com.kbk.fep;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

@Controller
public class FepManagerController {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@PostMapping("/eai")
	public String eai(Model model, @RequestParam("url") String url, @RequestParam("data") String data,
			@RequestHeader(required = false) HttpHeaders headerMap) {

		try {
			RestTemplate rest = new RestTemplate();
//			String inputData = "";
			String sendData = data;
			logger.info("### 헤더 데이터 : [" + headerMap + "]");

			HttpEntity<byte[]> request = new HttpEntity<byte[]>(sendData.getBytes(), new HttpHeaders());
			ResponseEntity<byte[]> response = rest.postForEntity(url, request, byte[].class);
			if (response != null)
				logger.info("### 응답 데이터 : [" + new String(response.getBody()) + "]");
			else
				logger.info("### 응답 데이터 : [NULL]");

			model.addAttribute("url", url);
			model.addAttribute("data", data);

		} catch (Exception e) {
			logger.error("### 에러발생 : ", e);
			e.printStackTrace();
		}

		return "eai";
	}


}
