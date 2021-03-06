package dev.mvc.qnagrp;

import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class QnagrpCont {
  @Autowired
  @Qualifier("dev.mvc.qnagrp.QnagrpProc")
  private QnagrpProcInter qnagrpProc;

  public QnagrpCont() {
    System.out.println("--> QnagrpCont created.");
  }

  /**
   * 등록폼 http://localhost:9090/team3/qnagrp/create.do
   * 
   * @return
   */
  @RequestMapping(value = "/qnagrp/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/qnagrp/create"); // /webapp/event/create.jsp

    return mav; // forward
  }

  /**
   * 등록 처리 http://localhost:9090/team3/event/create_msg.do
   * 
   * @return
   */
  @RequestMapping(value = "/qnagrp/create.do", method = RequestMethod.POST)
  public ModelAndView create(QnagrpVO qnagrpVO) {
    // request.setAttribute("categrpVO", categrpVO) 자동 실행

    ModelAndView mav = new ModelAndView();
    mav.setViewName("/qnagrp/create_msg"); // /webapp/event/create_msg.jsp

    int cnt = this.qnagrpProc.create(qnagrpVO);
    mav.addObject("cnt", cnt); // request.setAttribute("cnt", cnt)

    return mav; // forward
  }

  /**
   * 목록 http://localhost:9090/team3/event/list.do
   * 
   * @return
   */
  @RequestMapping(value = "/qnagrp/list.do", method = RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/qnagrp/list_ajax"); // /webapp/qnagrp/list.jsp

    List<QnagrpVO> list = this.qnagrpProc.list_qnagrpno_asc();
    mav.addObject("list", list);

    return mav; // forward
  }

  /**
   * 수정 처리
   * 
   * @param categrpVO
   * @return
   */
  @RequestMapping(value = "/qnagrp/update.do", method = RequestMethod.POST)
  public ModelAndView update(QnagrpVO qnagrpVO) {
    // CategrpVO categrpVO <FORM> 태그의 값으로 자동 생성됨.
    // request.setAttribute("categrpVO", categrpVO); 자동 실행

    ModelAndView mav = new ModelAndView();

    int cnt = this.qnagrpProc.update(qnagrpVO);
    mav.addObject("cnt", cnt); // request에 저장

    mav.setViewName("/qnagrp/update_msg"); // webapp/categrp/update_msg.jsp

    return mav;
  }   
  
    /**          
     * ajax 기반 list등록처리 
     * @param qnaVO
     * @return
     */
     
    @RequestMapping(value = "/qnagrp/update_ajax.do", method =
    RequestMethod.POST, produces = "text/plain;charset=UTF-8") public String
     update_ajax(QnagrpVO qnagrpVO) { try { Thread.sleep(3000); } catch
     (InterruptedException e) { e.printStackTrace(); }
     
     int cnt = this.qnagrpProc.update(qnagrpVO); // 등록 처리
     
     JSONObject json = new JSONObject(); json.put("cnt", cnt);
     
     return json.toString(); 
     }
    

    /**
     * 삭제 처리 + Ajax
     * @param categrpno
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/qnagrp/delete_ajax.do", method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
    public String delete_ajax(int qnagrpno) {
      try {
        Thread.sleep(3000);
      } catch (InterruptedException e) {
        e.printStackTrace();
      }
      
      int cnt = this.qnagrpProc.delete(qnagrpno);
      
      JSONObject json = new JSONObject();
      json.put("cnt", cnt);
      
      return json.toString();
    }
            
}
