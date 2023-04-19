package com.kbk.fep.mngr.dao;

import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.Test;

public class FepApiDaoTest {
	
	@Test
	public void cmdDownGw() {
		boolean isSuccess = false;
		FepApiDaoImpl dao = null;
		try {
			dao = new FepApiDaoImpl();
			dao.cmdDownGw("olt_099012_a_01");
			isSuccess = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Assertions.assertThat(isSuccess).isTrue();
		}
	}
	
	@Test
	public void cmdBootGw() {
		boolean isSuccess = false;
		FepApiDaoImpl dao = null;
		try {
			dao = new FepApiDaoImpl();
			dao.cmdBootGw("olt_099012_a_01");
			isSuccess = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Assertions.assertThat(isSuccess).isTrue();
		}
	}

}
