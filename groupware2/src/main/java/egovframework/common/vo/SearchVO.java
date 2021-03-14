package egovframework.common.vo;

import java.io.Serializable;

public class SearchVO implements Serializable {

	private final int defUnitScale	= 10;
	private final int defPageScale	= 5;
	
	private int pageIndex			= 1;			// 현재 페이지
	private int firstIndex			= 1;			// 첫페이지 번호
	private int lastIndex			= 1;			// 마지막 페이지 번호
	private int pageScale			= defPageScale;	// 한 페이지당 목록에 표시되는 페이지 갯수, default 10개
	private int unitScale			= defUnitScale;	// 게시물 출력 갯수, default 10개
	private int unitNumber			= 1;
	private String schKeyWord		= "";			// 검색 키워드
	private String schKeyValue		= "";			// 검색 값
	private String schKeyValue1		= "";			// 검색 값
	private String schKeyValue2		= "";			// 검색 값
	private String schArray			= "";			// 정렬 컬럼
	private String schSort			= "";			// 정렬 방법
	private String parameter		= "";
	
	public int getPageIndex() {
		return pageIndex;
	}
	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}

	
	public int getFirstIndex() {
		return firstIndex;
	}
	public void setFirstIndex(int firstIndex) {
		this.firstIndex = firstIndex;
	}
	
	
	public int getLastIndex() {
		return lastIndex;
	}
	public void setLastIndex(int lastIndex) {
		this.lastIndex = lastIndex;
	}
	
	
	public int getPageScale() {
		return pageScale;
	}
	public void setPageScale(int pageScale) {
		this.pageScale = pageScale;
	}
	
	
	public int getUnitScale() {
		return unitScale;
	}
	public void setUnitScale(int unitScale) {
		this.unitScale = unitScale;
	}
	
	
	public int getUnitNumber() {
		return unitNumber;
	}
	public void setUnitNumber(int unitNumber) {
		this.unitNumber = unitNumber;
	}
	
	
	public String getSchKeyWord() {
		return schKeyWord;
	}
	public void setSchKeyWord(String schKeyWord) {
		this.schKeyWord = schKeyWord;
	}
	
	
	public String getSchKeyValue() {
		return schKeyValue;
	}
	public void setSchKeyValue(String schKeyValue) {
		this.schKeyValue = schKeyValue;
	}
	
	public String getSchKeyValue1() {
		return schKeyValue1;
	}
	public void setSchKeyValue1(String schKeyValue1) {
		this.schKeyValue1 = schKeyValue1;
	}
	
	public String getSchKeyValue2() {
		return schKeyValue2;
	}
	public void setSchKeyValue2(String schKeyValue2) {
		this.schKeyValue2 = schKeyValue2;
	}
	
	
	public String getSchArray() {
		return schArray;
	}
	public void setSchArray(String schArray) {
		this.schArray = schArray;
	}
	
	
	public String getSchSort() {
		return schSort;
	}
	public void setSchSort(String schSort) {
		this.schSort = schSort;
	}
	
	
	public int getDefUnitScale() {
		return defUnitScale;
	}

	
	public int getDefPageScale() {
		return defPageScale;
	}
	

	public String getParameter() {
		return parameter;
	}
	public void setParameter(String parameter) {
		this.parameter = parameter;
	}

}
