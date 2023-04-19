package com.kbk.fep.mngr.svc;

import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

/**
 * 컨트롤러 테스트
 * @author ohhyonchul
 *
 */
@SpringBootTest
public class FepApiSvcImplTest {
	
	@Autowired
	private FepApiSvc svc;
	
	@Test
	public void restartGw() {
		boolean result = svc.restartGw("olt_099012_a_01");
		Assertions.assertThat(result);
	}

}
