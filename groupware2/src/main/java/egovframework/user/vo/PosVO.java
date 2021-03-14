package egovframework.user.vo;

import egovframework.common.vo.SearchVO;

public class PosVO extends SearchVO {
	private String posId;
	private String posNm;
	
	
	public String getPosId() {
		return posId;
	}
	public void setPosId(String posId) {
		this.posId = posId;
	}
	
	
	public String getPosNm() {
		return posNm;
	}
	public void setPosNm(String posNm) {
		this.posNm = posNm;
	}
	
	
}
