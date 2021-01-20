package dev.mvc.sale;





import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


import dev.mvc.event.EventProcInter;
import dev.mvc.event.EventVO;
import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;



@Controller
public class SaleweekCont {
  @Autowired
  @Qualifier("dev.mvc.sale.SaleweekProc")
  private SaleweekProcInter saleweekProc;
  
  @Autowired
  @Qualifier("dev.mvc.event.EventProc")
  private EventProcInter eventProc;
  
  public SaleweekCont() {
    System.out.println("--> SaleweekCont created.");
  }
 
  /**
   * ����� http://localhost:9090/team3/event/create.do
   * 
   * @return
   */
  @RequestMapping(value = "/sale/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/sale/create"); // /webapp/event/create.jsp

    return mav; // forward
  }
  /**
   * ��� ó�� http://localhost:9090/team3/event/create_msg.do
   * 
   * @return
   */
  @RequestMapping(value = "/sale/create.do", method = RequestMethod.POST)
  public ModelAndView create(HttpServletRequest request, SaleweekVO saleweekVO) {
    // request.setAttribute("categrpVO", categrpVO) �ڵ� ����
   
    ModelAndView mav = new ModelAndView();
    // -------------------------------------------------------------------
    // ���� ���� �ڵ� ����
    // -------------------------------------------------------------------
    String file1 = "";     // main image
    String thumb1 = ""; // preview image
        
    String upDir = Tool.getRealPath(request, "/sale/storage/main_images"); // ���� ���
    // ���� ������ ����� fnamesMF ��ü�� ������.
    // <input type='file' class="form-control" name='file1MF' id='file1MF' 
    //           value='' placeholder="���� ����" multiple="multiple">
    MultipartFile mf = saleweekVO.getFile1MF();
    long size1 = mf.getSize();  // ���� ũ��
    if (size1 > 0) { // ���� ũ�� üũ
      // mp3 = mf.getOriginalFilename(); // ���� ���ϸ�, spring.jpg
      // ���� ���� �� ���ε�� ���ϸ��� ���ϵ�, spring.jsp, spring_1.jpg...
      file1 = Upload.saveFileSpring(mf, upDir); 
      
      if (Tool.isImage(file1)) { // �̹������� �˻�
        // thumb �̹��� ������ ���ϸ� ���ϵ�, width: 120, height: 80
        thumb1 = Tool.preview(upDir, file1, 200, 150); 
      }
      
    }    
    
    saleweekVO.setFile1(file1);
    saleweekVO.setThumb1(thumb1);
    saleweekVO.setSize1(size1);
    // -------------------------------------------------------------------
    // ���� ���� �ڵ� ����
    // -------------------------------------------------------------------
    mav.setViewName("/sale/create_msg"); // /webapp/event/create_msg.jsp

    int cnt = this.saleweekProc.create(saleweekVO);
    mav.addObject("cnt", cnt); // request.setAttribute("cnt", cnt)

    return mav; // forward
  }
  
  /**
   * ��� http://localhost:9090/resort/cate/list.do
   * 
   * @return
   */
  @RequestMapping(value = "/sale/list.do", method = RequestMethod.GET)
  public ModelAndView list(int eventno) {
    ModelAndView mav = new ModelAndView();
    
    mav.setViewName("/sale/list"); // /webapp/categrp/list.jsp
   
    //Event ���� 
    EventVO eventVO=this.eventProc.read(eventno);
    mav.addObject("eventVO", eventVO);
   // List<CategrpVO> list = this.categrpProc.list_categrpno_asc();
    List<SaleweekVO> list = this.saleweekProc.list_saleno_asc();
    mav.addObject("list", list);
   
    return mav; // forward 
  }
  
  /**
   * ��� http://localhost:9090/team3/sale/list_all.do
   * 
   * @return
   */
  @RequestMapping(value = "/sale/list_all.do", method = RequestMethod.GET)
  public ModelAndView list_all() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/sale/list_all"); // /webapp/cate/list_all.jsp

   // List<CategrpVO> list = this.categrpProc.list_categrpno_asc();
    List<SaleweekVO> list = this.saleweekProc.list_saleno_asc();
    mav.addObject("list", list);

    return mav; // forward
  }
  
  /**
   * �̺�Ʈ ��  ��� http://localhost:9090/resort/contents/list.do
   * 
   * @return
   */
  @RequestMapping(value = "/sale/list_by_eventno_table_img1.do", method = RequestMethod.GET)
  public ModelAndView list_by_eventno(int eventno) {
    ModelAndView mav = new ModelAndView();
    // /webapp/contents/list_by_cateno.jsp
    // mav.setViewName("/contents/list_by_cateno");
    
    mav.setViewName("/sale/list_by_eventno_table_img1");

    EventVO eventVO = this.eventProc.read(eventno);
    mav.addObject("eventVO", eventVO);
    
    
    
    List<SaleweekVO> list = this.saleweekProc.list_by_eventno(eventno);
    mav.addObject("list", list);

    return mav; // forward
  }
  
  /**
   * ��ü ��� �б� 
   * @return
   */
  @RequestMapping(value="/sale/read.do", method=RequestMethod.GET )
  public ModelAndView read(int saleno) {
    ModelAndView mav = new ModelAndView();
     
    SaleweekVO saleweekVO = this.saleweekProc.read(saleno);
    mav.addObject("saleweekVO", saleweekVO); 
    
    EventVO eventVO = this.eventProc.read(saleweekVO.getEventno());
    mav.addObject("eventVO", eventVO); 

    
    // mav.setViewName("/contents/read"); // /webapp/contents/read.jsp
    mav.setViewName("/sale/read"); // /webapp/contents/read.jsp
    return mav;
  }
  
  /**
   * ���� ��
   * @return
   */
  @RequestMapping(value="/sale/update.do", method=RequestMethod.GET )
  public ModelAndView update(int saleno) {
    ModelAndView mav = new ModelAndView();
    
    SaleweekVO saleweekVO = this.saleweekProc.read_update(saleno); // read- update �ȶ�
      
    mav.addObject("SaleweekVO", saleweekVO); // request.setAttribute("contentsVO", contentsVO);
    
    mav.setViewName("/sale/update"); // webapp/contents/update.jsp
    
    return mav;
  }
  
  // http://localhost:9090/resort/contents/update.do
  /**
   * ���� ó��
   * @param contentsVO
   * @return
   */
  @RequestMapping(value="/sale/update.do", method=RequestMethod.POST )
  public ModelAndView update(SaleweekVO saleweekVO) {
    ModelAndView mav = new ModelAndView();
    
    EventVO eventVO = this.eventProc.read(saleweekVO.getEventno());
   
    mav.addObject("event_name", eventVO.getName());
    mav.addObject("eventno", eventVO.getEventno());

   
    
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("saleno", saleweekVO.getSaleno());
    hashMap.put("passwd", saleweekVO.getPasswd());
    
    int passwd_cnt = 0; // �н����� ��ġ ���ڵ� ����
    int cnt = 0;             // ������ ���ڵ� ���� 
    
    passwd_cnt = this.saleweekProc.passwd_check(hashMap);
    
    if (passwd_cnt == 1) { // �н����尡 ��ġ�� ��� �� ����
      cnt = this.saleweekProc.update(saleweekVO);
    }

    mav.addObject("cnt", cnt); // request�� ����
    mav.addObject("passwd_cnt", passwd_cnt); // request�� ����
        
    mav.setViewName("/sale/update_msg"); // webapp/contents/update_msg.jsp
    
    return mav;
  }
}
  

