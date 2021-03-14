package egovframework.groupware.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import egovframework.groupware.vo.ContentVO;
import egovframework.groupware.vo.FileVO;

@Service 
public class FileUploadService {
	
	private static String SAVE_PATH	= "/uploads";
	private static String PREFIX_URL = "/uploads/";
	
	public String restore(MultipartFile multipartFile) {
		String url = "";
		
		try {
			String oriFileName = multipartFile.getOriginalFilename();
			String extName = oriFileName.substring(oriFileName.lastIndexOf("."), oriFileName.length());	
			long size = multipartFile.getSize();
			String fileName = getfileName(multipartFile);
			String saveFileName = fileName;
			
			System.out.println( "#### 원본 파일명 : " + oriFileName );
			System.out.println( "#### 확장자 : " + extName );
			System.out.println( "#### 저장된 파일명 : " + saveFileName );
			System.out.println( "#### 파일 크기 : " + size );
			
			writeFile( multipartFile, fileName );
			
			url = PREFIX_URL + fileName;
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
			
		return url;
	} 

	private void writeFile(MultipartFile multipartFile, String saveFileName) throws IOException {
		byte[] fileData = multipartFile.getBytes();
		
		FileOutputStream fos = new FileOutputStream(SAVE_PATH + "/" + saveFileName);
		fos.write(fileData);
		fos.close();
	}
	

	/*public String getSaveFileName(String extName) {
		String fileName = "";
		
		Calendar calendar = Calendar.getInstance();
		
		fileName += calendar.get( Calendar.YEAR );
		fileName += calendar.get( Calendar.MONTH );
		fileName += calendar.get( Calendar.DATE );
		fileName += calendar.get( Calendar.HOUR );
		fileName += calendar.get( Calendar.MINUTE );
		fileName += calendar.get( Calendar.SECOND );
		fileName += calendar.get( Calendar.MILLISECOND );
		fileName += extName;
		
		return fileName;
	}*/
	
	 private String getfileName(MultipartFile multipartFile) {
	     Calendar cal=Calendar.getInstance();
	     Date date=cal.getTime();
	     String fileName=new SimpleDateFormat("yyyyMMdd").format(date)+"_"+multipartFile.getOriginalFilename();
	     return fileName;
	 }
	 
	 
		public ResponseEntity<List<FileVO>> uploadAjax(MultipartFile[] uploadFile) {
			List<FileVO> list = new ArrayList<>();
			
			String uploadFolder = "C:\\upload\\mp";
			
			// make folder ----------
			File uploadPath = new File(uploadFolder, getFolder());
			System.out.println("upload path : " + uploadPath);
			
			if(uploadPath.exists()==false) {
				uploadPath.mkdirs();
			}
			
			
			for(MultipartFile multipartFile : uploadFile) {
				System.out.println("upload ajax");
				
				System.out.println("file name : " + multipartFile.getOriginalFilename());
				System.out.println("file size : " + multipartFile.getSize());
				
				FileVO fileVO = new FileVO();
				
				String uploadFilename = multipartFile.getOriginalFilename();
				
				uploadFilename = uploadFilename.substring(uploadFilename.lastIndexOf("\\")+1);
				System.out.println("only file name : "+uploadFilename);
			//	fileVO.setOrigFileName(multipartFile.getOriginalFilename());
				
				UUID uuid = UUID.randomUUID();
				uploadFilename = uuid.toString() + "_" + uploadFilename;
				
				try {
					File saveFile = new File(uploadPath, uploadFilename);
					multipartFile.transferTo(saveFile);

					fileVO.setOrigFileName(multipartFile.getOriginalFilename());
					fileVO.setStoredFileName(uploadFilename);
					fileVO.setFileSize(multipartFile.getSize());
					
					list.add(fileVO);

				} catch(Exception e) {
					System.out.println(e.getMessage());
				}
			}
			return new ResponseEntity<>(list, HttpStatus.OK);
		}
		
		// 오늘 날짜의 경로를 문자열로 생성한다.
		private String getFolder() {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			
			Date date = new Date(0);
			
			String str = sdf.format(date);
			
			return str.replace("-", File.separator);
		}
}
