package com.kbk.fep.mngr.ctl;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.web.servlet.MockMvc;

import com.kbk.fep.mngr.dao.FepApiDao;
import com.kbk.fep.mngr.svc.FepApiSvc;

@WebMvcTest(FepApiCtl.class)
public class FepApiCtlTest {
	
	@Autowired
	private MockMvc mockMvc;
	
	@MockBean
	private FepApiSvc apiSvc;
	
	@MockBean
	private FepApiDao apiDao;
	
	@Test
	public void restartGw() throws Exception {
		mockMvc.perform(get("/api/restart-gw").param("gwName", "olt_099012_a_01"))
			.andDo(print())
			.andExpect(status().is2xxSuccessful());
	}

}
