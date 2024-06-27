
package com.drink.view;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.drink.ko.CartService;
import com.drink.ko.FaqService;
import com.drink.ko.NoticeService;
import com.drink.ko.OrderService;
import com.drink.ko.ProdRevService;
import com.drink.ko.ProdService;
import com.drink.ko.QnaService;
import com.drink.ko.UsersService;
import com.drink.ko.vo.CartVO;
import com.drink.ko.vo.FaqVO;
import com.drink.ko.vo.NoticeVO;
import com.drink.ko.vo.OrderVO;
import com.drink.ko.vo.ProdRevVO;
import com.drink.ko.vo.ProdVO;
import com.drink.ko.vo.QnaVO;
import com.drink.ko.vo.UsersVO;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class BichenaController {
	@Autowired
	private ProdService prodService;
	@Autowired
	private ProdRevService prodRevService;
	@Autowired
	private QnaService qnaService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private UsersService usersService;
	@Autowired
	private NoticeService noticeService;
	@Autowired
	private FaqService faqService;
	@Autowired
	private CartService cartService;
	@Autowired
	private BCryptPasswordEncoder encoder;

//	String realPath = "C:/apache-tomcat-9.0.86/webapps/bichena/img/";
//	String realPathJSP = "C:/apache-tomcat-9.0.86/webapps/bichena/WEB-INF/product/";
	String realPath = "C:/Dwork/bichena/src/main/webapp/img/";
	String realPathJSP = "C:/Dwork/bichena/src/main/webapp/WEB-INF/product/";

	public final String IMPORT_TOKEN_URL = "https://api.iamport.kr/users/getToken";
	public final String IMPORT_PAYMENTINFO_URL = "https://api.iamport.kr/payments/find/";
	public final String IMPORT_PAYMENTLIST_URL = "https://api.iamport.kr/payments/status/all";
	public final String IMPORT_CANCEL_URL = "https://api.iamport.kr/payments/cancel";
	public final String IMPORT_PREPARE_URL = "https://api.iamport.kr/payments/prepare";
	public final String IMPORT_CERTIFICATION_URL = "https://api.iamport.kr/certifications";

	// "?�임?�트 Rest Api key�??�정";
	public final String KEY = "5332741436286106";
	// "?�임?�트 Rest Api Secret�??�정";
	public final String SECRET = "xGMw5WNK4QaCvoXJtVwSp7VWp2HtteV0RPzVrRvMfNGe6GfLsRyaBM3GlRLdF93YHnAHea1XgPZu4Yj1";
	// ?�임?�트 가맹점 ?�별코드 �?
	public final String IMPORT_ID = "imp70405420";

	@RequestMapping("/main.ko")
	public String main(Model model) {
		ProdVO vo1 = new ProdVO();
		List<ProdVO> mainPageSlideListTakju = prodService.mainPageSlideListTakju(vo1);
		model.addAttribute("mainPageSlideListTakju", mainPageSlideListTakju);

		ProdVO vo2 = new ProdVO();
		List<ProdVO> mainPageSlideListGwasilju = prodService.mainPageSlideListGwasilju(vo2);
		model.addAttribute("mainPageSlideListGwasilju", mainPageSlideListGwasilju);

		ProdVO vo3 = new ProdVO();
		List<ProdVO> mainPageSlideListChunju = prodService.mainPageSlideListChunju(vo3);
		model.addAttribute("mainPageSlideListChunju", mainPageSlideListChunju);

		ProdVO vo4 = new ProdVO();
		List<ProdVO> mainPageSlideListJeungryuju = prodService.mainPageSlideListJeungryuju(vo4);
		model.addAttribute("mainPageSlideListJeungryuju", mainPageSlideListJeungryuju);

		ProdRevVO revo = new ProdRevVO();
		List<ProdRevVO> mainRevList = prodRevService.mainRevList(revo);
		model.addAttribute("mainRevList", mainRevList);

		return "/main.jsp";
	}

	// 검?�기?�을 ?�한 모델 ?�트리뷰??
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("?�목", "TITLE");
		conditionMap.put("?�용", "CONTENT");
		return conditionMap;
	}

	// 공�? ?�기
	@RequestMapping("/writeNotice.ko")
	public String writeNotice(NoticeVO vo) {
		return "WEB-INF/admin/insertNotice.jsp";
	}

	// 공�? ?�록
	@PostMapping(value = "/insertNotice.ko")
	public String insertNotice(NoticeVO vo) throws IllegalStateException, IOException {
		int not_no = noticeService.getMaxNotice();
		vo.setNot_no(not_no);
		noticeService.insertNotice(vo);
		return "redirect:/getNoticeList.ko";
	}

	// 공�? ?�정
	@RequestMapping("/modifyNotice.ko")
	public String ModyfyNotice(NoticeVO vo, Model model) {
		model.addAttribute("notice", noticeService.getNotice(vo));
		return "WEB-INF/admin/updateNotice.jsp";
	}

	// 공�? ?�정 ?�데?�트
	@RequestMapping("/updateNotice.ko")
	public String updateNotice(@ModelAttribute("notice") NoticeVO vo, HttpSession session) {
		int not_no = vo.getNot_no();
		vo.setNot_no(not_no);
		noticeService.updateNotice(vo);
		return "redirect:/getNoticeList.ko";
	}

	// 공�? ??��
	@RequestMapping("/deleteNotice.ko")
	public String deleteNotice(NoticeVO vo) {
		noticeService.deleteNotice(vo);
		noticeService.updateNot_no1(vo);
		noticeService.updateNot_no2(vo);
		return "getNoticeList.ko";
	}

	// 공�? ?�세 조회
	@RequestMapping("/getNotice.ko")
	public String getNotice(NoticeVO vo, Model model) {
		model.addAttribute("prevNextNotice", noticeService.getPrevNext(vo));
		model.addAttribute("notice", noticeService.getNotice(vo));
		return "WEB-INF/user/getNotice.jsp";
	}

	// 공�? ?�세 조회 (관리자)
	@RequestMapping("/adminGetNotice.ko")
	public String adminGetNotice(NoticeVO vo, Model model) {
		model.addAttribute("prevNextNotice", noticeService.getPrevNext(vo));
		model.addAttribute("notice", noticeService.getNotice(vo));
		return "WEB-INF/admin/adminGetNotice.jsp";
	}

	// 공�? 목록
	@RequestMapping("/getNoticeList.ko")
	public ModelAndView getNoticeListPost(NoticeVO vo,
			@RequestParam(value = "searchCondition", defaultValue = "TITLE", required = false) String condition,
			@RequestParam(value = "searchKeyword", defaultValue = "", required = false) String keyword,
			ModelAndView mav,
			@RequestParam(value = "currPageNo", required = false, defaultValue = "1") String NotcurrPageNo,
			@RequestParam(value = "range", required = false, defaultValue = "1") String Notrange, HttpSession session) {

		int currPageNo = 0;
		int range = 0;
		int totalCnt = noticeService.noticeTotalCnt(vo);

		try {
			currPageNo = Integer.parseInt(NotcurrPageNo);
			range = (currPageNo - 1) / vo.getPageSize() + 1;
		} catch (NumberFormatException e) {
			currPageNo = 1;
			range = 1;
		}

		vo.pageInfo(currPageNo, range, totalCnt);
		if (vo.getNot_title() == null)
			vo.setNot_title("");

		mav.addObject("keyword", keyword);
		mav.addObject("condition", condition);
		mav.addObject("pagination", vo);
		mav.addObject("noticeList", noticeService.noticeListPaging(vo)); // parameter�??�온 값들??보내준??
		if (session.getAttribute("userID") != null) {
			if (session.getAttribute("userID").equals("admin")) {
				mav.setViewName("WEB-INF/admin/adminGetNoticeList.jsp");
			} else {
				mav.setViewName("WEB-INF/user/getNoticeList.jsp");
			}

		} else {
			mav.setViewName("WEB-INF/user/getNoticeList.jsp");
		}

		return mav;
	}

// ?�기??부?�는 FAQ??관?�된 ?�용?�니??---------------

	// Faq ?�기
	@RequestMapping("/writeFaq.ko")
	public String writeFaq(FaqVO vo) {
		return "WEB-INF/admin/insertFaq.jsp";
	}

	// Faq ?�록
	@PostMapping(value = "/insertFaq.ko")
	public String insertFaq(FaqVO vo) throws IllegalStateException, IOException {
		int faq_no = faqService.faqTotalCnt(vo);
		faq_no += 1;
		vo.setFaq_no(faq_no);
		faqService.insertFaq(vo);
		return "redirect:/getFaqList.ko";
	}

	// Faq ?�정
	@RequestMapping("/modifyFaq.ko")
	public String ModyfyFaq(FaqVO vo, Model model) {
		model.addAttribute("faq", faqService.getFaq(vo));
		return "WEB-INF/admin/updateFaq.jsp";
	}

	// Faq ?�정 ?�데?�트
	@RequestMapping("/updateFaq.ko")
	public String updateFaq(@ModelAttribute("faq") FaqVO vo, HttpSession session) {
		faqService.updateFaq(vo);
		return "getFaqList.ko";
	}

	// Faq ??��
	@RequestMapping("/deleteFaq.ko")
	public String deleteFaq(FaqVO vo) {
		faqService.deleteFaq(vo);
		faqService.updateFaq_no1(vo);
		faqService.updateFaq_no2(vo);
		return "redirect:/getFaqList.ko";
	}

	// Faq 목록
	@RequestMapping("/getFaqList.ko")
	public ModelAndView getFaqListPost(FaqVO vo,
			@RequestParam(value = "searchCondition", defaultValue = "TITLE", required = false) String condition,
			@RequestParam(value = "searchKeyword", defaultValue = "", required = false) String keyword,
			ModelAndView mav,
			@RequestParam(value = "currPageNo", required = false, defaultValue = "1") String NotcurrPageNo,
			@RequestParam(value = "range", required = false, defaultValue = "1") String Notrange, HttpSession session) {

		int currPageNo = 0;
		int range = 0;
		int totalCnt = faqService.faqTotalCnt(vo);

		try {
			currPageNo = Integer.parseInt(NotcurrPageNo);
			range = (currPageNo - 1) / vo.getPageSize() + 1;
		} catch (NumberFormatException e) {
			currPageNo = 1;
			range = 1;
		}

		vo.pageInfo(currPageNo, range, totalCnt);
		if (vo.getFaq_title() == null)
			vo.setFaq_title("");

		mav.addObject("keyword", keyword);
		mav.addObject("condition", condition);
		mav.addObject("pagination", vo);
		mav.addObject("faqList", faqService.faqListPaging(vo)); // parameter�??�온 값들??보내준??

		if (session.getAttribute("userID") != null) {
			if (session.getAttribute("userID").equals("admin")) {
				mav.setViewName("WEB-INF/admin/adminGetFaqList.jsp");
			} else {
				mav.setViewName("WEB-INF/user/getFaqList.jsp");
			}

		} else {
			mav.setViewName("WEB-INF/user/getFaqList.jsp");
		}

		return mav;
	}


	@GetMapping("/prodList.ko")
	public ModelAndView prodListAndFilteredProducts(ProdVO vo, ModelAndView mav,
			@RequestParam(value = "currPageNo", required = false, defaultValue = "1") String prodCurrPageNo,
			@RequestParam(value = "range", required = false, defaultValue = "1") String prodRange,
			@RequestParam(value = "type", required = false) String type,
			@RequestParam(value = "sweet", required = false) String sweet,
			@RequestParam(value = "acidity", required = false) String acidity,
			@RequestParam(value = "carbonic", required = false) String carbonic,
			@RequestParam(value = "ingredient", required = false) String ingredient,
			@RequestParam(value = "searchKeyword", required = false) String searchKeyword, HttpSession session) {
		int currPageNo = 0;
		int range = 0;
		int totalCnt = prodService.prodTotalCnt(vo);

		try {
			currPageNo = Integer.parseInt(prodCurrPageNo);
			range = Integer.parseInt(prodRange);
		} catch (NumberFormatException e) {
			currPageNo = 1;
			range = 1;
		}

		vo.pageInfo(currPageNo, range, totalCnt);
		if (type != null) {
			mav.addObject("type", type);
		}
		if (sweet != null) {
			mav.addObject("sweet", sweet);
		}
		if (acidity != null) {
			mav.addObject("acidity", acidity);
		}
		if (carbonic != null) {
			mav.addObject("carbonic", carbonic);
		}
		if (ingredient != null) {
			mav.addObject("ingredient", ingredient);
		}
		if (searchKeyword != null && !searchKeyword.isEmpty()) {
			mav.addObject("searchKeyword", searchKeyword);
			vo.setSearchKeyword(searchKeyword); // ProdVO??검?�어 ?�드�?추�??�고 setter�??�용
		}

		mav.addObject("totalCnt", totalCnt);
		mav.addObject("pagination", vo);
		mav.addObject("prodList", prodService.prodList(vo));
		mav.setViewName("WEB-INF/user/prodList.jsp"); // ?�래?��?
//		mav.setViewName("WEB-INF/user/prodList2.jsp");

		return mav;
	}

	@RequestMapping("/prodOne.ko")
	public String prodOne(@RequestParam(value = "p_no") String p_no, Model model) {
		ProdVO prodOne = prodService.prodOne(p_no);
		model.addAttribute("prodOne", prodOne);
		return "/WEB-INF/user/prodOneView.jsp";
	}


	@RequestMapping("/orderRevchk.ko") // 리뷰state 처리
	public String orderRevchk(OrderVO vo) {
		orderService.orderRevchk(vo);
		return "redirect:/myRevList.ko";
	}

	@RequestMapping("/adminProdList.ko")
	public String adminProdList(ProdVO vo, Model model,
			@RequestParam(value = "searchCondition", required = false) String searchCondition,
			@RequestParam(value = "searchKeyword", defaultValue = "", required = false) String searchKeyword,
			@RequestParam(value = "currPageNo", required = false, defaultValue = "1") String NotcurrPageNo,
			@RequestParam(value = "range", required = false, defaultValue = "1") String Notrange) {

		int currPageNo = 0;
		int range = 0;
		int totalCnt = prodService.prodTotalCnt(vo);

		try {
			currPageNo = Integer.parseInt(NotcurrPageNo);
			range = (currPageNo - 1) / vo.getPageSize() + 1;
		} catch (NumberFormatException e) {
			currPageNo = 1;
			range = 1;
		}

		vo.pageInfo(currPageNo, range, totalCnt);
		if (vo.getP_name() == null) {
			vo.setP_name("");
		}
		if (searchKeyword != null && !searchKeyword.isEmpty()) {
			model.addAttribute("searchKeyword", searchKeyword);
			vo.setSearchKeyword(searchKeyword);
		}

		if (searchCondition != null && !searchCondition.isEmpty()) {
			model.addAttribute("searchCondition", searchCondition);
			vo.setSearchCondition(searchCondition);
		}

		List<ProdVO> adminProdList = prodService.prodList(vo);
		model.addAttribute("pagination", vo);
		model.addAttribute("adminProdList", adminProdList);
		return "/WEB-INF/admin/adminProdView.jsp";
	}

	@RequestMapping("/adminProdInsert.ko")
	public String adminProdInsert(ProdVO vo) throws IllegalStateException, IOException {
		MultipartFile uplodFile = vo.getUploadFile();
		File f = new File(realPath);
		if (!f.exists()) {
			f.mkdirs();
		}

		if (!(uplodFile == null || uplodFile.isEmpty())) {
			vo.setP_img(uplodFile.getOriginalFilename());
			uplodFile.transferTo(new File(realPath + vo.getP_img()));
		}

		int pno = prodService.getPnoMaxNum();
		String editFilename = "pno" + pno + ".jsp";
		vo.setP_no(pno);
		vo.setEditfile(editFilename);

		File file = new File(realPathJSP);
		if (!file.exists()) {
			file.mkdirs();
		}

		FileWriter fw = null;
		try {
			fw = new FileWriter(file + "/" + editFilename);
			fw.write("<%@ page language=\"java\" contentType=\"text/html; charset=UTF-8\" pageEncoding=\"UTF-8\" %>");
			fw.write(vo.getEdithtml());
			fw.flush();
		} catch (IOException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				fw.close();
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
		}
		int cnt = prodService.insertProduct(vo);

		if (cnt > 0) {
			System.out.println("?�록?�료");
			return "redirect:adminProdList.ko";
		} else {
			System.out.println("?�록?�패");
			return "redirect:adminProdList.ko";
		}

	}

	@RequestMapping("/adminProdUpdate.ko")
	public String adminProdUpdate(ProdVO vo) throws IllegalStateException, IOException {
		// 기존 ?�품?�보
		ProdVO oldvo = prodService.prodOne(String.valueOf(vo.getP_no()));

		// 기존 ?�품 ?�세?�이지jsp?�일
		File oldFile = new File(realPathJSP + oldvo.getEditfile());
		// 기존 ?�품 ?��?지?�일
		File oldImg = new File(realPath + oldvo.getP_img());

		MultipartFile uplodFile = vo.getUploadFile();
		File f = new File(realPath);
		if (!f.exists()) {
			f.mkdirs();
		}

		if (!(uplodFile == null || uplodFile.isEmpty())) {
			oldImg.delete(); // 기존 ?��?지 ??��
			vo.setP_img(uplodFile.getOriginalFilename());
			uplodFile.transferTo(new File(realPath + vo.getP_img()));
		} else {
			vo.setP_img(oldvo.getP_img());
		}

		// 기존 ?�품?�이지jsp?�일 ??��
		if (oldFile.exists()) {
			oldFile.delete(); // ?�일 ??��
			System.out.println("기존 ?�세?�이지jsp ??��");
		}

		int pno = oldvo.getP_no();
		String editFilename = "pno" + pno + ".jsp";
		vo.setEditfile(editFilename);

		File file = new File(realPathJSP);
		if (!file.exists()) {
			file.mkdirs();
		}

		FileWriter fw = null;
		try {
			fw = new FileWriter(file + "/" + editFilename);
			fw.write("<%@ page language=\"java\" contentType=\"text/html; charset=UTF-8\" pageEncoding=\"UTF-8\" %>");
			fw.write(vo.getEdithtml());
			fw.flush();
		} catch (IOException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				fw.close();
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
		}
		int cnt = prodService.updateProduct(vo);

		if (cnt > 0) {
			System.out.println("?�정?�료");
			return "redirect:adminProdList.ko";
		} else {
			System.out.println("?�정?�패");
			return "redirect:adminProdList.ko";
		}

	}

