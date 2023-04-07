package com.kbk.fep.mngr.svc;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import com.kbk.fep.mngr.dao.vo.FepLineInfoVo;

public interface FepLineInfoSvc {
	
public void deleteItem(int seqNo) ;
	
	public void saveItem(int seqNo, String extCd, String extNm, String bizCd, String bizNm, 
			String bizType, String bizClcd, String nwLine, String nwRouter, String fwVpn, 
			String devClcd, String kbkIp, String kbkNatIp, String kbkPort, String extIp, 
			String extPort, String srType, String extUser, String history) ;
	
	public void getExcelTest(HttpServletResponse response, FepLineInfoVo inputVo, String searchKey, String title);
	public void getExcelFireWall(HttpServletResponse response, FepLineInfoVo inputVo, String searchKey);
	public void getExcelL3(HttpServletResponse response, FepLineInfoVo inputVo, String searchKey);
	public void getExcelL4(HttpServletResponse response, FepLineInfoVo inputVo, String searchKey);
	public void saveItem(FepLineInfoVo inputVo) ;
	public Map<Integer, FepLineInfoVo> loadItem() ;
	public List<FepLineInfoVo> loadItemList() ;
	public void getExcelDown(HttpServletResponse response) ;
	public void getExcelDown2(HttpServletResponse response) ;
	
	public int deleteItem2(int seqNo);
	public int updateItem2(FepLineInfoVo inputVo);
	public int insertItem2(FepLineInfoVo inputVo);
	public List<FepLineInfoVo> selectItem2(FepLineInfoVo inputVo, String searchKey);
}
