package org.spring2.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.spring2.model.CriteriaVO;
import org.spring2.model.NoticeVO;
import org.spring2.model.PageVO;
import org.spring2.model.UploadFileVO;
import org.spring2.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import net.coobird.thumbnailator.Thumbnailator;

@Controller
public class NoticeController {
	@Autowired
	NoticeService ns;

	@RequestMapping(value = "/notice/list", method = RequestMethod.GET)
	public void noList(Model model, HttpSession session, CriteriaVO cri) {
		try {
			model.addAttribute("noList",ns.noList(cri));
			model.addAttribute("paging", new PageVO(cri, ns.maxNumSearch(cri)));
			session.setAttribute("criValue", new PageVO(cri, ns.maxNumSearch(cri)));
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/notice/write", method = RequestMethod.GET)
	public void noWriteV() {
	}

	private String getFolder() {
		Date d = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

		return dateFormat.format(d).replace("-", "\\");
	}

	private boolean checkImage(File file) {
		try {
			String fileType = Files.probeContentType(file.toPath());
			return fileType.startsWith("image");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}

	@RequestMapping(value = "/notice/uploadAjaxAction", method = RequestMethod.POST)
	public ResponseEntity<ArrayList<UploadFileVO>> uploadAjaxAction(ArrayList<MultipartFile> uploadFile) {

		ArrayList<UploadFileVO> uvoList = new ArrayList<>();

		String uploadFolder = "D:\\01-STUDY\\upload";
		File uploadPath = new File(uploadFolder, getFolder());
		if(!uploadPath.exists()) {
			uploadPath.mkdirs();
		}

		for(MultipartFile u : uploadFile) {
			UUID uuid = UUID.randomUUID();

			File saveFile = new File(uploadPath,uuid+"_"+u.getOriginalFilename());

			UploadFileVO uvo = new UploadFileVO();

			uvo.setPath(getFolder());
			uvo.setFileName(u.getOriginalFilename());
			uvo.setUuid(uuid.toString());
			uvo.setCheckI(checkImage(saveFile));

			try {
				u.transferTo(saveFile);
				if(checkImage(saveFile)) {
					File thumb = new File(uploadPath,"s_"+uuid+"_"+u.getOriginalFilename());
					FileOutputStream fos = new FileOutputStream(thumb);
					Thumbnailator.createThumbnail(u.getInputStream(),fos,100,100);
					fos.close();
				}
				uvoList.add(uvo);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return new ResponseEntity<>(uvoList,HttpStatus.OK);
	}

	@RequestMapping(value = "/notice/display", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getFile(String fileName){
		File file = new File("D:\\01-STUDY\\upload\\"+ fileName);
		ResponseEntity<byte[]> result = null;
		HttpHeaders headers = new HttpHeaders();
		try {
			headers.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(
					FileCopyUtils.copyToByteArray(file),
					headers,
					HttpStatus.OK
					);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	@RequestMapping(value = "/notice/download", method = RequestMethod.GET)
	public ResponseEntity<Resource> fileDownload(String fileName) {
		Resource res = new FileSystemResource("D:\\01-STUDY\\upload\\"+ fileName);
		String resName = res.getFilename();
		HttpHeaders headers = new HttpHeaders();
		try {
			headers.add(
					"Content-Disposition", 
					"attachment;filename=" 
							+ new String(resName.getBytes("utf-8"),"ISO-8859-1"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return new ResponseEntity<>(res, headers,HttpStatus.OK);
	}

	@RequestMapping(value = "/notice/write", method = RequestMethod.POST)
	public String noWrite(NoticeVO nvo) {
		ns.noWrite(nvo);
		return "redirect:/notice/list";
	}

	@RequestMapping(value = "/notice/detail", method = RequestMethod.GET)
	public void noDetail(Model model, int nono) {
		model.addAttribute("detail", ns.noDetail(nono));
	}

	@RequestMapping(value = "/notice/modify", method = RequestMethod.POST)
	public String noModify(RedirectAttributes rttr, NoticeVO nvo) {
		ns.noModify(nvo);
		rttr.addAttribute("nono", nvo.getNono());
		return "redirect:/notice/detail";
	}

	@RequestMapping(value = "/notice/remove", method = RequestMethod.POST)
	public String noRemove(int nono) {
		ns.noRemove(nono);
		return "redirect:/notice/list";
	}

}
