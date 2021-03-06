package dev.mvc.item_option;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.survey.SurveyProcInter;
import dev.mvc.survey.SurveyVO;
import dev.mvc.survey_item.SurveyitemProcInter;
import dev.mvc.survey_item.SurveyitemVO;

@Controller
public class ItemoptionCont {

  @Autowired  // 부모 프로세스 접근
  @Qualifier("dev.mvc.survey.SurveyProc")
  private SurveyProcInter surveyProc;
  
  @Autowired  // 부모 프로세스 접근
  @Qualifier("dev.mvc.survey_item.SurveyitemProc")
  private SurveyitemProcInter surveyitemProc;
  
  @Autowired  // 프로세스 연결
  @Qualifier("dev.mvc.item_option.ItemoptionProc")
  private ItemoptionProcInter itemoptionProc;
 
  
  public ItemoptionCont() {
    System.out.println( "--> ItemoptionCont created." );
  }
  
  
  // 등록폼
  @RequestMapping(value="/adm/itemoption/create.do", method=RequestMethod.GET)
  public ModelAndView create(int item_no, int survey_no) {
    ModelAndView mav = new ModelAndView();
    
    SurveyVO surveyVO = this.surveyProc.read(survey_no);
    mav.addObject("surveyVO", surveyVO);
    
    SurveyitemVO surveyitemVO = this.surveyitemProc.read(item_no);
    mav.addObject("surveyitemVO", surveyitemVO);
    
    String title="항목 선택지";
    
    mav.addObject("survey_title", surveyVO.getTitle());
    mav.addObject("item_title", surveyitemVO.getItem_title());
    mav.addObject("title", title);
    
    mav.setViewName("/adm/itemoption/create");
    
    return mav;
  }
  
  // 등록 처리
  @RequestMapping(value="/adm/itemoption/create.do", method=RequestMethod.POST)
  public ModelAndView create(ItemoptionVO itemoptionVO) {
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.itemoptionProc.create(itemoptionVO);
    int item_no = itemoptionVO.getItem_no();
    
    SurveyitemVO surveyitemVO = this.surveyitemProc.read(item_no);
    
    if(cnt!=0) {
      mav.setViewName("redirect:/adm/itemoption/list.do?item_no="+item_no+"&survey_no="+surveyitemVO.getSurvey_no());
    } else {
      mav.addObject("cnt", cnt);      
      mav.addObject("url", "create_msg");
      mav.setViewName("redirect:/adm/itemoption/msg.do");
    }
    
    return mav;
  }

  /**
   * 항목별 선택지 리스트 http://localhost:9090/team3_testgit/adm/itemoption/list.do
   * @param survey_no
   * @return
   */
  @RequestMapping(value = "/adm/itemoption/list.do", method = RequestMethod.GET)
  public ModelAndView list_seqno_item(@RequestParam(value="item_no", defaultValue="1")  int item_no,
                                                    @RequestParam(value="survey_no", defaultValue="1")  int survey_no) {
    ModelAndView mav = new ModelAndView();
    
    SurveyVO surveyVO = this.surveyProc.read(survey_no);
    mav.addObject("surveyVO", surveyVO);
    
    SurveyitemVO surveyitemVO = this.surveyitemProc.read(item_no);
    mav.addObject("surveyitemVO", surveyitemVO);
    
    String title="항목 선택지";
    
    mav.addObject("survey_title", surveyVO.getTitle());
    mav.addObject("item_title", surveyitemVO.getItem_title());
    mav.addObject("title", title);
    
    List<ItemoptionVO> list = this.itemoptionProc.list_seqno_asc(item_no);
    mav.addObject("list", list);
    
    mav.setViewName("/adm/itemoption/list");
    
    return mav;
  }
  
  // 조회_수정
  @RequestMapping(value = "/adm/itemoption/read_update.do", method = RequestMethod.GET)
  public ModelAndView read_update(int option_no, int item_no, int survey_no) {
    ModelAndView mav = new ModelAndView();
    
    SurveyVO surveyVO = this.surveyProc.read(survey_no);  //  SurveyProc 접근
    SurveyitemVO surveyitemVO = this.surveyitemProc.read(item_no);
    ItemoptionVO itemoptionVO = this.itemoptionProc.read(option_no);
     
    mav.addObject("survey_title", surveyVO.getTitle());
    mav.addObject("item_title", surveyitemVO.getItem_title());
    mav.addObject("itemoptionVO", itemoptionVO);
    
    List<ItemoptionVO> list = this.itemoptionProc.list_seqno_asc(item_no);
    mav.addObject("list", list);    
    
    mav.setViewName("/adm/itemoption/read_update");
    
    return mav;
  }
  
  // 수정 처리
  @RequestMapping(value="/adm/itemoption/update.do", method=RequestMethod.POST)
  public ModelAndView update(ItemoptionVO itemoptionVO) {
    ModelAndView mav = new ModelAndView();
    SurveyitemVO surveyitemVO = this.surveyitemProc.read(itemoptionVO.getItem_no());
    
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("option_name", itemoptionVO.getOption_name());
    map.put("seqno", itemoptionVO.getSeqno());
    map.put("option_no", itemoptionVO.getOption_no());
    
    int cnt = 0;
    cnt = this.itemoptionProc.update(map);
    
    if(cnt!=0) {
      mav.addObject("item_no", surveyitemVO.getItem_no());
      mav.addObject("survey_no", surveyitemVO.getSurvey_no());
      mav.setViewName("redirect:/adm/itemoption/list.do");
    } else {
      mav.addObject("cnt", cnt);      
      mav.addObject("url", "update_msg");
      mav.setViewName("redirect:/adm/itemoption/msg.do");
    }
    
    return mav;
  }  
  
  // 조회_삭제
  @RequestMapping(value = "/adm/itemoption/read_delete.do", method = RequestMethod.GET)
  public ModelAndView read_delete(int option_no, int item_no, int survey_no) {
    ModelAndView mav = new ModelAndView();
    
    SurveyVO surveyVO = this.surveyProc.read(survey_no);  //  SurveyProc 접근
    SurveyitemVO surveyitemVO = this.surveyitemProc.read(item_no);
    ItemoptionVO itemoptionVO = this.itemoptionProc.read(option_no);
     
    mav.addObject("survey_title", surveyVO.getTitle());
    mav.addObject("item_title", surveyitemVO.getItem_title());
    mav.addObject("itemoptionVO", itemoptionVO);
    
    List<ItemoptionVO> list = this.itemoptionProc.list_seqno_asc(item_no);
    mav.addObject("list", list);    
    
    mav.setViewName("/adm/itemoption/read_delete");
    
    return mav;
  }
  
  // 삭제 처리
  @RequestMapping(value="/adm/itemoption/delete.do", method=RequestMethod.POST)
  public ModelAndView update(int option_no) {
    ModelAndView mav = new ModelAndView();
    ItemoptionVO itemoptionVO = this.itemoptionProc.read(option_no);
    SurveyitemVO surveyitemVO = this.surveyitemProc.read(itemoptionVO.getItem_no());
    
    int cnt = 0;
    cnt = this.itemoptionProc.delete(option_no);
    
    if(cnt!=0) {
      mav.addObject("item_no", surveyitemVO.getItem_no());
      mav.addObject("survey_no", surveyitemVO.getSurvey_no());
      mav.setViewName("redirect:/adm/itemoption/list.do");
    } else {
      mav.addObject("cnt", cnt);      
      mav.addObject("url", "update_msg");
      mav.setViewName("redirect:/adm/itemoption/msg.do");
    }
    
    return mav;
  }  
  
  
  
  
  
  
  
  
  
  /**
   * 관리자 페이지 - 새로고침을 방지하는 메시지 출력
   * @return
   */
  @RequestMapping(value="/adm/itemoption/msg.do", method=RequestMethod.GET)
  public ModelAndView msgtoA(String url){
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/adm/itemoption/" + url); // forward
    return mav; // forward
  }

}
