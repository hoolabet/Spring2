package org.spring2.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.spring2.model.CouponTargetVO;
import org.spring2.model.DestinationVO;
import org.spring2.model.MemberVO;
import org.spring2.model.UploadFileVO;
import org.spring2.service.CouponService;
import org.spring2.service.MailSendService;
import org.spring2.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import net.coobird.thumbnailator.Thumbnailator;

@Controller
public class MemberController {
	@Autowired
	MemberService ms;

	@Autowired
	private MailSendService mailService;

	@Autowired
	CouponService cs;

	// 회원가입
	@RequestMapping(value = "/member/signup", method = RequestMethod.GET)
	public String signup() {

		return "member/signup";
	}

	@RequestMapping(value = "/member/signup", method = RequestMethod.POST)
	public String signupin(MemberVO member) {
		try {
			member.setPhone(member.getPhone().substring(1, member.getPhone().length()));
			ms.signUp(member);
			CouponTargetVO ctvo = new CouponTargetVO(member.getId());
			System.out.println(ctvo);
			cs.signUpCoupon(ctvo);
			return "member/login";
		} catch (Exception e) {
			e.printStackTrace();
			return "member/signup";
		}
	}

	// 이메일 인증
	@RequestMapping(value = "/member/emailchk/{email}", method = RequestMethod.GET)
	@ResponseBody
	public String mailCheck(@PathVariable String email) {
		System.out.println("이메일 인증 요청이 들어옴!");
		System.out.println("이메일 인증 이메일 : " + email);
		return mailService.joinEmail(email);

	}

	// 아이디, 이메일, 전화번호 중복체크
	@RequestMapping(value = "/member/signup/{str}", method = RequestMethod.GET)
	public ResponseEntity<String> emchk(@PathVariable String str) {
		try {
			if (str.contains("@")) {
				System.out.println(str);
				return new ResponseEntity<>(ms.emchk(str).getEmail(), HttpStatus.OK);
			} else if (str.contains("!")) {
				str = str.substring(1, str.length());
				System.out.println(str);
				return new ResponseEntity<>(ms.phchk(str).getPhone(), HttpStatus.OK);
			} else {
				return new ResponseEntity<>(ms.idchk(str).getId(), HttpStatus.OK);
			}
		} catch (Exception e) {
			// TODO: handle exception
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	// 로그인
	@RequestMapping(value = "/member/login", method = RequestMethod.GET)
	public String login() {

		return "member/login";
	}

	@RequestMapping(value = "/member/login", method = RequestMethod.POST)
	public String loginPost(MemberVO member, HttpSession session) {
		System.out.println(ms.login(member));
		session.setAttribute("userInfo", ms.login(member));
		System.out.println(session.getAttribute("userInfo"));
		if (session.getAttribute("userInfo") != null) {

			return "redirect:/";
		} else {
			return "member/login";
		}
	}

	// 로그아웃
	@RequestMapping(value = "/member/logout", method = RequestMethod.GET)
	public String logoutget(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	// 아이디찾기
	@RequestMapping(value = "/member/findId", method = RequestMethod.GET)
	public String findIdGet() {
		return "member/findId";
	}
	
	
	// 아이디 찾기 이메일 인증
	@RequestMapping(value = "/member/emailchkID", method = RequestMethod.POST)
	public ResponseEntity<String> emailchkID(@RequestBody MemberVO member) {
		System.out.println("이메일로 아이디 찾기");
		System.out.println(ms.find(member));

		return mailService.findIdEmail(ms.find(member));
	}

//	@RequestMapping(value = "/member/findId", method = RequestMethod.POST)
//	public String findIdPost(MemberVO member, Model model) {
//		try {
//			if (member.getEmail() != null) {
//				System.out.println("이메일로 아이디 찾기");
//				System.out.println(ms.find(member));
//				model.addAttribute("email", ms.find(member).getEmail());
//				return mailService.findIdEmail(ms.find(member));
//			} else {
//				System.out.println("번호로 아이디 찾기");
//				System.out.println(ms.find(member));
//				model.addAttribute("email", ms.find(member).getEmail());
//				return mailService.findIdEmail(ms.find(member));
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//			return "member/findId";
//		}
//	}

	// 비밀번호 찾기
	@RequestMapping(value = "/member/findPw", method = RequestMethod.GET)
	public String findPwGet() {
		return "member/findPw";
	}

	@RequestMapping(value = "/member/findPw", method = RequestMethod.POST)
	public String findPwPost(MemberVO member, Model model) {
		try {
			if (member.getEmail() != null) {
				System.out.println("이메일로 비밀번호 찾기");
				System.out.println(ms.find(member));
				model.addAttribute("id", ms.find(member).getId());
				if (ms.find(member) != null) {

					return "member/modifyPassword";
				}
				return "member/findPw";
			} else {
				System.out.println("번호로 비밀번호 찾기");
				System.out.println(ms.find(member));
				model.addAttribute("id", ms.find(member).getId());
				if (ms.find(member) != null) {
					return "member/modifyPassword";
				}
				return "member/findPw";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "member/findPw";
		}
	}

	@RequestMapping(value = "/member/destination", method = RequestMethod.GET)
	public void destination() {

	}

	// 배송지 목록 관리
	@RequestMapping(value = "/destination/select/{id}", method = RequestMethod.GET)
	public ResponseEntity<ArrayList<DestinationVO>> destinationGet(@PathVariable String id) {
		System.out.println(id);
		return new ResponseEntity<>(ms.destinationGet(id), HttpStatus.OK);
	}

	@RequestMapping(value = "/destination/insert", method = RequestMethod.POST)
	public ResponseEntity<String> destinationPost(@RequestBody DestinationVO des) {
		int result = ms.destinationPost(des);

		return result == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@RequestMapping(value = "/destination/update", method = RequestMethod.PUT)
	public ResponseEntity<String> destinationPut(@RequestBody DestinationVO des) {
		int result = ms.destinationPut(des);

		return result == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@RequestMapping(value = "/destination/delete", method = RequestMethod.DELETE)
	public ResponseEntity<String> destinationDelete(@RequestBody int dno) {
		System.out.println(dno);
		int result = ms.destinationDelete(dno);

		return result == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	// 회원목록
	@RequestMapping(value = "/member/memberList", method = RequestMethod.GET)
	public void memberList() {

	}

	@RequestMapping(value = "/memberList/select", method = RequestMethod.GET)
	public ResponseEntity<ArrayList<MemberVO>> memberListGet(MemberVO member) {
		System.out.println(member.getId());
		return new ResponseEntity<>(ms.memberListGet(member), HttpStatus.OK);
	}

	// 회원 상세정보
	@RequestMapping(value = "/member/memberDetail", method = RequestMethod.GET)
	public void memberDetail(String id, Model model) {
		model.addAttribute("detail", ms.memberDetail(id));
	}

	// 비밀번호 수정하기
	@RequestMapping(value = "/member/modifyPassword", method = RequestMethod.GET)
	public String modifyPasswordGet() {
		return "member/modifyPassword";
	}

	@RequestMapping(value = "/member/modifyPassword", method = RequestMethod.POST)
	public String modifyPasswordPost(MemberVO member) {

		int result = ms.modifyPw(member);
		System.out.println(result);

		return result == 1 ? "member/login" : "redirect:/member/modifyPassword";
	}

	// 마이페이지
	@RequestMapping(value = "/member/mypage", method = RequestMethod.GET)
	public String mypage(HttpSession session) {
//		if(session.getAttribute("userInfo") == null) {
//			
//			return "redirect:/member/login";
//		} else {
		return "member/mypage";
//		}

	}

	// 개인정보 수정 전 비밀번호 확인
	@RequestMapping(value = "/member/modifyInfoPWCheck", method = RequestMethod.GET)
	public String modifyGet(HttpSession session) {
		if (session.getAttribute("userInfo") == null) {
			return "redirect:/member/login";
		} else {
			return "member/modifyInfoPWCheck";
		}
	}

	@RequestMapping(value = "/member/modifyInfoPWCheck", method = RequestMethod.POST)
	public String modifyPost(MemberVO member, HttpSession session) {
		System.out.println(ms.modify(member));
		if (ms.modify(member) != null) {
			return "redirect:/member/memInfo";
		} else {
			return "member/modifyInfoPWCheck";
		}

	}

	// 개인정보 수정
	@RequestMapping(value = "/member/memInfo", method = RequestMethod.GET)
	public String memInfoGet(HttpSession session) {
		if (session.getAttribute("userInfo") == null) {
			return "redirect:/member/login";
		} else {
			return "member/memInfo";
		}
	}

	private String getFolder() {

		// 현재날짜 추출(Thu Aug 24 09:23:12 KST 2022)
		Date date = new Date();
		// Thu Aug 24 09:23:12 KST 2022 -> 2022-08-24
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		// 현재날짜와 날짜형식을 연결
		String str = sdf.format(date); // 2022-08-24
		// 2022-08-24 -> 2022\08\24로 변경
		return str.replace("-", "\\");
	}

	private boolean checkImageType(File file) {
		// probeContentType(파일경로).경로 안의 파일이 어떤 타입인지 알아내는 메서드.
		String contentType;
		try {
			contentType = Files.probeContentType(file.toPath());
			System.out.println("ContentType=" + contentType);
			// 파일타입이 image이면 true, 그 외에는 false
			return contentType.startsWith("image");

		} catch (Exception e) {
			System.out.println(e.getMessage()); // 오류 메세지를 확인

		}
		return false;

	}

	// 프로필 사진 수정
	@RequestMapping(value = "/uploadAjax", method = RequestMethod.GET)
	public void uploadAjax() {

	}

	@RequestMapping(value = "/member/uploadAjaxAction", method = RequestMethod.POST)
	public ResponseEntity<ArrayList<UploadFileVO>> uploadAjaxPost(MultipartFile[] uploadFile) {

		// AttachFileVO클래스 포함
		ArrayList<UploadFileVO> list = new ArrayList<>();

		// 폴더 경로
		String uploadFolder = "D:\\01-STUDY\\upload";
		// 서버 업로드 경로와 getFolder메서드의 날짜 문자열을 이어서 하나의 폴더 생성
		File uploadPath = new File(uploadFolder, getFolder());

		// 폴더생성(D:\\upload\\현재날짜)
		if (uploadPath.exists() == false) {// uploadPath가 존재하지 않으면,
			uploadPath.mkdirs();
		}

		// for(변수명:배열명)

		for (MultipartFile multipartFile : uploadFile) {

			// AttachFileVO클래스의 새로운 주소를 반복적으로 생성하여
			// ArrayList에 저장
			UploadFileVO attachvo = new UploadFileVO();

			System.out.println(multipartFile.getOriginalFilename());
			System.out.println(multipartFile.getSize());

			// 실제 파일명(multipartFile.getOriginalFilename());
			// UUID 적용(UUID_multipartFile.getOriginalFilename());
			UUID uuid = UUID.randomUUID();
			System.out.println("UUID=" + uuid.toString());

			// AttachFileVo의 uploadPath 변수에 저장()
			attachvo.setPath(getFolder());
			// AttachFileVo의 fileName 변수에 저장()
			attachvo.setFileName(multipartFile.getOriginalFilename());
			// AttachFileVo의 uuid 변수에 저장()
			attachvo.setUuid(uuid.toString());

			// 파일 저장
			// 어느폴더에(D:\\upload\\현재날짜),어떤 파일이름으로(UUID_hodori.jpg)
			File saveFile = new File(uploadPath, uuid.toString() + "_" + multipartFile.getOriginalFilename());

			// D:\\upload\\hodori.jpg에 파일을 전송(transferTo)
			// multipartFile.transferTo(saveFile);

			try {// transferTo()메서드에 예외가 있으면
				multipartFile.transferTo(saveFile); // 서버로 원본파일 전송
				// 내가 서버에 올리고자 하는 파일이 이미지이면,
				if (checkImageType(saveFile)) {

					// AttachFileVo의 image 변수에 저장()
					attachvo.setCheckI(true);

					// 파일 생성
					FileOutputStream thumbnail = new FileOutputStream(
							new File(uploadPath, "s_" + uuid.toString() + "_" + multipartFile.getOriginalFilename()));
					// 섬네일형식의 파일 생성
					Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);

					thumbnail.close();
				} // checkImageType메서드 끝

				// AttachFileVO에 저장된 데이터를 배열에 추가(add)
				list.add(attachvo);

			} catch (Exception e) { // 예외를 처리하라
				System.out.println(e.getMessage()); // 오류 메세지를 확인
			}
		} // for문 끝
		return new ResponseEntity<>(list, HttpStatus.OK);
	} // uploadAjax end...

	@RequestMapping(value = "/member/display", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getFile(String fileName) {
		System.out.println(fileName);

		File file = new File("D:\\01-STUDY\\upload\\" + fileName);

		ResponseEntity<byte[]> result = null;

		HttpHeaders headers = new HttpHeaders();

		try {
			headers.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}// getFile메서드 끝...

	@RequestMapping(value = "/member/modifyUImg", method = RequestMethod.PUT)
	public ResponseEntity<String> modifyimg(@RequestBody MemberVO member, HttpSession session) {
		System.out.println(member);
		int result = ms.modifyimg(member);

		session.setAttribute("userInfo", ms.modifyNewInfo(member));
		return result == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	// 이메일 수정
	@RequestMapping(value = "/member/modifyEmail", method = RequestMethod.PUT)
	public ResponseEntity<String> modifyEmail(@RequestBody MemberVO member, HttpSession session) {
		System.out.println(member);

		int result = ms.modifyEmail(member);
		System.out.println(result);

		session.setAttribute("userInfo", ms.modifyNewInfo(member));
		return result == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	// 전화번호 수정
	@RequestMapping(value = "/member/modifyPhone", method = RequestMethod.PUT)
	public ResponseEntity<String> modifyPhone(@RequestBody MemberVO member, HttpSession session) {
		System.out.println("수정 : " + member);

		int result = ms.modifyPhone(member);
		System.out.println(result);

		session.setAttribute("userInfo", ms.modifyNewInfo(member));
		return result == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	// 비밀번호 수정
	@RequestMapping(value = "/member/modifyPw", method = RequestMethod.PUT)
	public ResponseEntity<String> modifyPw(@RequestBody MemberVO member, HttpSession session) {
		System.out.println(member);

		int result = ms.modifyPw(member);
		System.out.println(result);

		session.invalidate();
		return result == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	// 계정삭제
	@RequestMapping(value = "/member/modifyDelete", method = RequestMethod.DELETE)
	public ResponseEntity<String> modifyDelete(@RequestBody MemberVO member, HttpSession session) {
		System.out.println(member);

		int result = ms.modifyDelete(member);
		System.out.println(result);

		session.invalidate();
		return result == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

}
