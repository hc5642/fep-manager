package com.kbk.fep.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Component;

@Component
@PropertySource({
	"file:/kbksw/swdpt/anylink/fep-manager/config/txinfo.properties",
	"file:/kbksw/swdpt/anylink/fep-manager/config/error.properties",
	"file:/kbksw/swdpt/anylink/fep-manager/config/phone.properties"
})
//@PropertySource({
//	"C:/__dev__/kbankapi/workspace/fep-manager/src/main/resources/txinfo.properties",
//	"C:/__dev__/kbankapi/workspace/fep-manager/src/main/resources/error.properties"
//})
public class FepPropInfo {
	
	@Autowired
	private Environment env;
	
	public String getValue(String key) {
		return env.getProperty(key);
	}

}
