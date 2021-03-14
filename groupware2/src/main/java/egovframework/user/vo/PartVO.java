package egovframework.user.vo;

import egovframework.common.vo.SearchVO;

public class PartVO extends SearchVO {
	private String partId;
	private String partNm;
	
	
	public String getPartId() {
		return partId;
	}
	public void setPartId(String partId) {
		this.partId = partId;
	}
	
	
	public String getPartNm() {
		return partNm;
	}
	public void setPartNm(String partNm) {
		this.partNm = partNm;
	}
		
}
